import 'package:Gift_Erbil/screens/auth_screen.dart';
import 'package:Gift_Erbil/theme/style_guide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Gift_Erbil/screens/otp.dart';

import 'package:Gift_Erbil/admin/admin_login_medium.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Auth'),
        backgroundColor: AppTheme.PrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              Container(
                margin: EdgeInsets.only(top: 60),
                child: Center(
                  child: Text(
                    'Phone Authentication',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40, right: 10, left: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    prefix: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('+964'),
                    ),
                  ),
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  controller: _controller,
                ),
              )
            ]),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.PrimaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(1, 3), // changes position of shadow
                  ),
                ],
              ),
              child: FlatButton(
                onPressed: () {
                  print(_controller.text);
                  if(_controller.text==null) {
                   return;
                  }else{
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OTPScreen(_controller.text)));
                  }
                  },
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: _screenHeight*0.35 ,),
            Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width*0.20,
              // decoration: BoxDecoration(
              //   color: Colors.grey,
              //   borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(10),
              //       topRight: Radius.circular(10),
              //       bottomLeft: Radius.circular(10),
              //       bottomRight: Radius.circular(10)),
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.grey.withOpacity(0.5),
              //       spreadRadius: 1,
              //       blurRadius: 3,
              //       offset: Offset(1, 3), // changes position of shadow
              //     ),
              //   ],
              // ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminLoginMedium()),
                          (route) => false);
                },
                child: Text(
                  'Admin',
                  style: TextStyle(color: AppTheme.PrimaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
