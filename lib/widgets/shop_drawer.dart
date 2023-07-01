import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Gift_Erbil/models/cart_items.dart';
import 'badge.dart';
import 'package:Gift_Erbil/screens/profile.dart';
import 'package:Gift_Erbil/screens/cart_screen.dart';
import 'package:Gift_Erbil/theme/style_guide.dart';
import 'package:Gift_Erbil/screens/login_screen.dart';


class ShopDrawer extends StatelessWidget {
  final String authId = FirebaseAuth.instance.currentUser.uid;

  Future getdata(String userId) {
    dynamic nested;
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        try {
           nested = documentSnapshot.get(FieldPath(['image_url']));

          return nested;
        } on StateError catch (e) {
          print('No nested field exists!');
          return e;
        }
      } else {
        return 'Document does not exist on the database';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.only(top: 35, right: 15, left: 15, bottom: 30),
      alignment: Alignment.centerLeft,
      color: AppTheme.PrimaryColor,
      child: ListView(
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc("9X6P0iRx9XUb6uqDlNmahsecAS52")
                .get(),
            builder: (context, snap) {
              if (snap.hasData) {
                DocumentSnapshot newSnap = snap.data;
                String url = newSnap.data()['image_url'];
                // if (url==null){
                //   url = 'assets/images/asfas.jpg';
                // }
                String userName = newSnap.data()['userName'].toString().toUpperCase();
                return ListTile(
                  leading: CircleAvatar(
                    maxRadius: 25,
                    minRadius: 20,
                    backgroundImage: NetworkImage(url),
                  ),
                  title:
                      Text(userName, style: AppTheme.heading),
                  subtitle: Text(
                    newSnap.data()['userNumber'],
                    style: AppTheme.subHeading,
                  ),
                );
              } else
                return CircularProgressIndicator();
            },
          ),
          SizedBox(
            height: height * 0.06,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Profile.routeName);
            },
            child: ListTile(
              leading: Icon(
                Icons.people,
                color: AppTheme.IconLightColor,
              ),
              title: Text('Profile', style: AppTheme.subHeading),
            ),
          ),
          SizedBox(height: height * 0.03),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
            child: ListTile(
              leading: 
              
              Consumer<Cart>(builder: (_,cart,ch)=>Badge(
                  child:ch,
                  value: cart.itemCount.toString(),
                  color:Colors.red
                ),
                child: Icon(
                    Icons.shopping_cart,
                    color: AppTheme.IconLightColor,
                  ),          
              ),


              title: Text('Cart', style: AppTheme.subHeading),
            ),
          ),
          SizedBox(height: height * 0.30),
          GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false);
            },
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: AppTheme.IconLightColor,
              ),
              title: Text('Log-Out', style: AppTheme.subHeading),
            ),
          )
        ],
      ),
    );
  }
}
