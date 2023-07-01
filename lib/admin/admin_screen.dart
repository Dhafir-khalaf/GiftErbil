import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:Gift_Erbil/screens/login_screen.dart';
import 'package:Gift_Erbil/admin/OrderDetailScreen.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  Future<bool> _isEmpty() async {
    return orders.snapshots().isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(7),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (orders.snapshots() != null)
                  StreamBuilder<QuerySnapshot>(
                    stream: orders.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        print(orders.snapshots().toString());
                        return Text('Something went wrong');
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        return SingleChildScrollView(
                          child: Container(
                            height: _screenHeight - 100,
                            width: _screenWidth,
                            child: new ListView(
                              children: snapshot.data.docs
                                  .map((DocumentSnapshot document) {
                                if (document.exists) {
                                  return InkWell(
                                    child: new ListTile(
                                      leading: CircleAvatar(backgroundImage: AssetImage(document.data()['imageUrl']),),
                                      title: new Text(document.data()['title']),
                                      subtitle: new Text(
                                          '${document.data()['itemQuantity']}'),
                                      trailing: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        Text('${document.data()['userName']}'),
                                        Text('${document.data()['userPhone']}')
                                      ],),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        _orderTaped(
                                          itemId: document.data()['itemId'],
                                          itemTitle: document.data()['title'],
                                          itemImageUrl: document.data()['imageUrl'],
                                          quantity: document.data()['itemQuantity'],
                                          price: document.data()['itemPrice'],
                                          description: document.data()['itemDescription'],
                                          deliveryAddress: document.data()['Delivery_Address'],
                                          deliveryDate: document.data()['Delivery Date'],
                                          deliveryTime: document.data()['Delivery time'],

                                        ),
                                      );
                                    },
                                  );
                                }
                              }).toList(),
                            ),
                          ),
                        );
                      }
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Route _orderTaped(
      {String itemId,
      String itemTitle,
      String itemImageUrl,
      String quantity,
      String price,
      String description,
      String deliveryAddress,
      String deliveryDate,
      String deliveryTime,
      String userPhone,
      String userName}) {

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          OrderDetailScreen(
        itemId: itemId,
        itemTitle: itemTitle,
        itemImageUrl: itemImageUrl,
        itemQuantity: quantity,
        itemPrice: price,
        description: description,
        deliveryAddress: deliveryAddress,
        deliveryDate: deliveryDate,
        deliveryTime: deliveryTime,
        userName: userName,
        userPhone: userPhone,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // print('inside create route ');
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
