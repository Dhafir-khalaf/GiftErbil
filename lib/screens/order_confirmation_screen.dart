import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';

import 'package:Gift_Erbil/theme/style_guide.dart';
import 'package:Gift_Erbil/models/cart_items.dart';
import 'package:Gift_Erbil/screens/home_screen.dart';

class OrderConfirmationScreen extends StatefulWidget {
  @override
  _OrderConfirmationScreenState createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  DateTime _pickedDate= DateTime.now();
  TimeOfDay _pickedTime = TimeOfDay.now();

  ////--------------------------------------------------------------initialization

//-------------------------------------------------picking a date
  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: _pickedDate,
    );
    if (date != null)
      setState(() {
        _pickedDate = date;
      });
  }

//-------------------------------------------------picking a time
  void _pickedTimeFounction() async {
    TimeOfDay t =
        await showTimePicker(context: context, initialTime: _pickedTime);
    if (t != null)
      setState(() {
        _pickedTime = t;
      });
  }

  void showFlushBar(BuildContext context) {
    Flushbar(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      backgroundGradient: LinearGradient(
        colors: [Colors.red.shade800, Colors.redAccent.shade700],
        stops: [0.6, 1],
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      // All of the previous Flushbars could be dismissed by swiping down
      // now we want to swipe to the sides
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      duration: Duration(seconds: 2),
      // The default curve is Curves.easeOut
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      message: 'Delivery Address can\'t be empty!',
    )..show(context);
  }

  Widget build(BuildContext context) {
    CollectionReference orders = FirebaseFirestore.instance.collection('orders');
    final currentUser = FirebaseAuth.instance.currentUser;
    String userName;
    String userPhone;
    final users = FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
         userName = documentSnapshot.data()['userName'];
         userPhone = documentSnapshot.data()['userNumber'];
      } else {
        print('Document does not exist on the database');
      }
    });

    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    var _deliveryAddress;
    var _orderDescription = '';
    final cartData = Provider.of<Cart>(context);
    final cartTotal = cartData.cartTotal.toString();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Confirm Your Order'),
        backgroundColor: AppTheme.PrimaryColor,
      ),
      body: Container(
        height: _screenHeight,
        width: _screenWidth,
        child: ListView(
          children: [
            Column(
              children: [
                Card(
                  elevation: 1,
                  child: Container(
                    width: _screenWidth - 2,
                    height: _screenHeight * 0.1,
                    alignment: Alignment.center,
                    child: ListTile(
                      leading:
                          Text('Delivery Date: ', style: AppTheme.display2),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Text(
                          "${_pickedDate.year}, ${_pickedDate.month}, ${_pickedDate.day}",
                          style: TextStyle(color: AppTheme.PrimaryColor),
                        ),
                      ),
                      trailing: Icon(
                        Icons.calendar_today,
                        color: AppTheme.PrimaryColor,
                      ),
                      onTap: _pickDate,
                    ),
                  ),
                ),
                Card(
                  elevation: 1,
                  child: Container(
                    width: _screenWidth - 2,
                    height: _screenHeight * 0.1,
                    alignment: Alignment.center,
                    child: ListTile(
                      leading:
                          Text('Delivery Time: ', style: AppTheme.display2),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                            "${_pickedTime.hour}:${_pickedTime.minute} ",
                            style: TextStyle(color: AppTheme.PrimaryColor)),
                      ),
                      trailing: Icon(
                        Icons.access_alarm,
                        color: AppTheme.PrimaryColor,
                      ),
                      onTap: _pickedTimeFounction,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 15),
                    child: Text('Delivery address :', style: AppTheme.display2),
                  ),
                ),
                Card(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    onChanged: (value) {
                      _deliveryAddress = value;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 15),
                    child: Row(
                      children: [
                        Text(
                          'Order Description ',
                          style: AppTheme.display2,
                        ),
                        Text('(optional)', style: AppTheme.description),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 2,
                    maxLines: 5,
                    onChanged: (value) {
                      _orderDescription = value;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 75, right: 75, bottom: 15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppTheme.PrimaryColor,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        // print('dhafir before');
                        if (_deliveryAddress != null) {
                          var alertDialog = AlertDialog(
                            title: Text('Alert'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('Are you sure you want to Order?')
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Order'),
                                onPressed: () {

                                  // send all cart items to database
                                  if (cartData.items.isNotEmpty) {
                                    for (var item in cartData.items.values) {
                                      orders.add({
                                        'userId': currentUser.uid,
                                        'userName':userName,
                                        'userPhone':userPhone,
                                        'itemId': item.id,
                                        'title': item.title,
                                        'itemDescription':item.description,
                                        'itemColor':item.color,
                                        'itemPrice': item.price.toString(),
                                        'itemQuantity': item.quantity.toString(),
                                        'imageUrl':item.imageUrl,
                                        'Delivery Date': _pickedDate.toString(),
                                        'Delivery time': _pickedTime.toString(),
                                        'Delivery_Address': _deliveryAddress.toString(),
                                        'Order Description': _orderDescription.toString(),
                                      }).then((value) => print('order has been submitted'));
                                      // print(currentUser.uid);
                                      // print(item.id);
                                      // print(item.price);
                                      // print(item.title);
                                      // print(item.quantity);
                                      // print(_pickedDate);
                                      // print(_pickedTime);
                                      // print(_deliveryAddress);
                                      // print(_orderDescription);
                                    }
                                    // delete all cart items
                                    Provider.of<Cart>(context, listen: false)
                                        .emptyCart();
                                    //navigate to home screen
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()),
                                        (route) => false);
                                  }
                                },
                              ),
                            ],
                          );
                          if (cartData.items.isNotEmpty) {
                            showDialog(
                                context: context, builder: (_) => alertDialog);
                          }
                        } else {
                          showFlushBar(context);
                        }
                      },
                      child: Text(
                        'Order Now',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
