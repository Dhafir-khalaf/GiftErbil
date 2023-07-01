import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

import '../widgets/auth_widget.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;
  // Future _sendData(String userId,String userName, String imageUrl) async {
  //
  //   CollectionReference users = FirebaseFirestore.instance.collection('users');
  //   //final userData = await FirestoreFirestore.instance.collection('users').doc(userId).get();
  //   users.add({
  //     'createdAt': Timestamp.now(),
  //     'userId': userId,
  //     'username': userName,
  //     'userImage': imageUrl,
  //   });
  //
  // }
  void _submitAuthForm(
    String email,
    String password,
    String username,
    File image,
    bool isLogin,
    BuildContext ctx,
  ) async {
    UserCredential userCred;

    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        userCred = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        userCred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        final ref = FirebaseStorage.instance
            .ref()
            .child('user_image')
            .child(userCred.user.uid + '.jpg');

        await ref.putFile(image).onComplete;

        final url = await ref.getDownloadURL();
        //await _sendData(userCred.user.uid, username, url);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCred.user.uid)
            .set({
          'username': username,
          'email': email,
          'image_url': url,
        });
      }
    } on PlatformException catch (err) {
      var message = 'An error occurred, pelase check your credentials!';

      if (err.message != null) {
        message = err.message;
      }

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                color: Colors.transparent,
                width: 200,
                height: 200,
                child: Image(
                  image: AssetImage('assets/images/LogoGiftErbil.png'),
                ),
              ),
              AuthWidget(
                _submitAuthForm,
                _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
