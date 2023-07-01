import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:io';

import 'package:Gift_Erbil/screens/home_screen.dart';
import 'package:Gift_Erbil/screens/login_screen.dart';
import 'package:Gift_Erbil/widgets/user_image_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class YourInfoScreen extends StatefulWidget {
  final String userPhone;
  YourInfoScreen(this.userPhone);
  @override
  _YourInfoScreenState createState() => _YourInfoScreenState();
}

class _YourInfoScreenState extends State<YourInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  var _userName = '';
  File _userImageFile;
  var futureImage;
  bool _isLoading = false;

  @override
  void initState() {
    _dropDownMenuItems = _buildDropDownMenuItems(_Neighborhoods);
    _selectedNeighborhood = _dropDownMenuItems[0].value;
    super.initState();
  }

////-------------------------------------------------------------------- Neighborhood dropdown --------------------------------------------

  List<Neighborhood> _Neighborhoods = Neighborhood.getNeighborhoods();
  List<DropdownMenuItem<Neighborhood>> _dropDownMenuItems;
  Neighborhood _selectedNeighborhood;

  List<DropdownMenuItem<Neighborhood>> _buildDropDownMenuItems(List _Neighborhoods) {
    List<DropdownMenuItem<Neighborhood>> _items = List();
    for (Neighborhood neighborhood in _Neighborhoods) {
      _items.add(
        DropdownMenuItem(
          value: neighborhood,
          child: Text(neighborhood.name),
        ),
      );
    }
    return _items;
  }

  _onChangedDropDownItem(Neighborhood updatedNieghborhood) {
    setState(() {
      _selectedNeighborhood = updatedNieghborhood;
    });
  }

////--------------------------------------------------------------------image picker --------------------------------------------
  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(
        source: ImageSource.camera,
        imageQuality: 75,
        maxWidth: 250,
        maxHeight: 250);
    final pickedImageFile = File(pickedImage.path);
    setState(() {
      if (pickedImageFile != null) {
        _userImageFile = pickedImageFile;
      }
    });
  }

  void snackBarnullImage(BuildContext context, String title) {
    Flushbar(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      backgroundGradient: LinearGradient(
        colors: [Colors.green.shade800, Colors.greenAccent.shade700],
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
      message: '$title',
    )..show(context);
  }

////--------------------------------------------------------------------submit form--------------------------------------------
  Future<bool> _trySubmit() async {
    FocusScope.of(context).unfocus();
    if(_userImageFile == null){
      snackBarnullImage(context, 'Please pick an image');
    }
    if (_formKey.currentState.validate() &&(_userImageFile != null)) {
      _formKey.currentState.save();
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser.uid != null) {
        try {
          setState(() {
            _isLoading = true;
          });
          final ref = FirebaseStorage.instance
              .ref()
              .child('user_image')
              .child(currentUser.uid + '.jpg');

          await ref.putFile(_userImageFile).onComplete;

          final url = await ref.getDownloadURL();
          print(url +
              'upload has been done ..............................................');
          //await _sendData(userCred.user.uid, username, url);
          print(currentUser.uid);
          await FirebaseFirestore.instance
              .collection('users')
              .doc(currentUser.uid)
              .set({
            'userId':currentUser.uid.toString(),
            'userName': _userName,
            'userNumber': widget.userPhone,
            'Neighborhood': _selectedNeighborhood.name.toString(),
            'image_url': url,
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false);
          return true;
        } on PlatformException catch (err) {
          snackBarnullImage(context, 'please add all information!');
          var message = 'An error occurred, please check your credentials!';

          if (err.message != null) {
            message = err.message;
          }
          return false;
        }
      }
      return false;
    }
    return false;
  }

  ////--------------------------------------------------------------------build return--------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tell us more'),
        ),
        body: Center(
          child: (_isLoading)
              ? CircularProgressIndicator()
              : Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  elevation: 4,
                  color: Color(0xffffd6f6),
                  margin: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            //--------------------------------User image
                            // showImage(),
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey,
                              backgroundImage: _userImageFile != null
                                  ? FileImage(_userImageFile)
                                  : null,
                            ),
                            FlatButton.icon(
                              textColor: Theme.of(context).primaryColor,
                              onPressed: _pickImage,
                              icon: Icon(Icons.image),
                              label: Text('Add Image'),
                            ),
                            //--------------------------------User name
                            TextFormField(
                              key: ValueKey('userName'),
                              autovalidate: true,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  labelText: 'User name',
                                  border: OutlineInputBorder()),
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'User Name is required'),
                                MinLengthValidator(5,
                                    errorText:
                                        'User Name must be at least 5 digits long'),
                              ]),
                              onSaved: (value) => _userName = value,
                            ),

                            SizedBox(height: 12),
                            Row(
                              children: [
                                Text('City: '),
                                Text(' Erbil'),
                              ],
                            ),
                            SizedBox(height: 12),
                            //---------------------------------------------------User Neighborhood
                            Row(
                              children: [
                                Text('Select a Neighborhood  '),
                                SizedBox(
                                  width: 5,
                                ),
                                DropdownButton(
                                  value: _selectedNeighborhood,
                                  items: _dropDownMenuItems,
                                  onChanged: _onChangedDropDownItem,
                                ),
                              ],
                            ),

                            SizedBox(height: 12),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                              ),
                              elevation: 5,
                              color: Color(0xffd817a4),
                              child: Text('Submit',
                                  style: TextStyle(color: Colors.white)),
                              onPressed: _trySubmit,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ));
  }
}

class Neighborhood {
  int id;
  String name;

  Neighborhood(this.id, this.name);

  static List<Neighborhood> getNeighborhoods() {
    return <Neighborhood>[
      Neighborhood(1, 'حي العسكري'),
      Neighborhood(2, 'Dream City'),
      Neighborhood(3, 'ParkView'),
      Neighborhood(4, 'Naz Naz City'),
      Neighborhood(5, 'Atlantic City'),
      Neighborhood(6, 'Empire'),
      Neighborhood(7, 'English village'),
      Neighborhood(8, 'Italian City 1'),
      Neighborhood(9, 'Italian City 2'),
    ];
  }
}
