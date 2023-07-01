import 'package:Gift_Erbil/theme/style_guide.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Gift_Erbil/theme/style_guide.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';

  final String authId = FirebaseAuth.instance.currentUser.uid;

  Future getdata(String userId) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        try {
          dynamic nested = documentSnapshot.get(FieldPath(['image_url']));

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
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Profile',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontFamily: 'WorkSans'),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(authId)
                  .get(),
              builder: (context, snap) {
                if (snap.hasData) {
                  DocumentSnapshot newSnap = snap.data;
                  String url = newSnap.data()['image_url'];
                  if(url.isEmpty){
                    url ='https://firebasestorage.googleapis.com/v0/b/gift-erbil.appspot.com/o/user_image%2FdefaultAvatar.jpg?alt=media&token=6960b68c-fc51-4cb6-b082-20dd51f5765c';
                  }
                  String phoneNumber = newSnap.data()['userNumber'];
                  String userName = newSnap.data()['userName'];
                  return Center(
                    child: Container(
                      width: sw * 0.9,
                      height: sh * 0.7,
                      child: Card(
                        shadowColor: Colors.grey,
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              width: 200,
                              height: 200,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(url),
                              ),
                            ),
                            Card(
                              elevation: 0,
                              child: ListTile(
                                leading: Icon(Icons.email_rounded),
                                title: Row(
                                  children: [
                                    Text(
                                      'User-Name: ',
                                      style: TextStyle(
                                        fontFamily: 'WorkSans',
                                        fontSize: 18,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      '$userName',
                                      style: TextStyle(
                                        fontFamily: 'WorkSans',
                                        fontSize: 18,
                                        color: Colors.black45,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Wrap(
                              children: [
                                Card(
                                  elevation: 0,
                                  child: ListTile(
                                    leading: Icon(Icons.person),
                                    title: Row(
                                      children: [
                                        Text(
                                          'Phone-Num: ',
                                          style: TextStyle(
                                            fontFamily: 'WorkSans',
                                            fontSize: 18,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Text(
                                          '$phoneNumber',
                                          style: TextStyle(
                                            fontFamily: 'WorkSans',
                                            fontSize: 18,
                                            color: Colors.black45,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else
                  return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
