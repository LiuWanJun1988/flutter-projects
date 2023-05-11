import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../main.dart';

class MyCardEdit extends StatefulWidget{
  MyCardEdit({Key key}):super(key: key);
  @override
  _MyCardEditState createState() => _MyCardEditState();
}

class _MyCardEditState extends State<MyCardEdit>{

  var userNameController = TextEditingController();
  var userOccupationController = TextEditingController();
  var userPhoneNumberController = TextEditingController();
  var userEmailController = TextEditingController();
  final picker = ImagePicker();
  var imagePath;
  var image;

  void retrieveImgFromCamera() async{
    var pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null){
        imagePath = pickedFile.path;
        applicationPreferences.setString('imagePath', imagePath);
        image = MemoryImage(File(imagePath).readAsBytesSync());
      }
    });
  }

  void retrieveImgFromGallery() async {
    var pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null){
        imagePath = pickedFile.path;
        applicationPreferences.setString('imagePath', imagePath);
        image = MemoryImage(File(imagePath).readAsBytesSync());
      }
    });
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () {
                        retrieveImgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      retrieveImgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  @override
  void dispose() {
    userNameController.dispose();
    userOccupationController.dispose();
    userPhoneNumberController.dispose();
    userEmailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    userNameController.text = applicationPreferences?.getString('userName') ?? 'Edit me';
    userOccupationController.text = applicationPreferences?.getString('userOccupation') ?? 'Edit me';
    userPhoneNumberController.text = applicationPreferences?.getString('userPhoneNumber') ?? 'Edit me';
    userEmailController.text = applicationPreferences?.getString('userEmail') ?? 'Edit me';

    imagePath = applicationPreferences?.getString('imagePath') ?? '';
    if (imagePath.isNotEmpty ?? false) {
      image = MemoryImage(File(imagePath).readAsBytesSync());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showPicker(context);
                    },
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.white,
                      backgroundImage: image,
                    ),
                  ),
                  Container(
                    height: 65,
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico'
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none
                      ),
                      controller: userNameController,
                      onChanged: (String newValue) {
                        applicationPreferences.setString('userName', newValue);
                      },
                    ),
                  ),
                  Container(
                    height: 30,
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 2.5,
                          color: Colors.teal.shade100,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSansPro'
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none
                      ),
                      controller: userOccupationController,
                      onChanged: (String newValue) {
                        applicationPreferences.setString('userOccupation', newValue);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 150.0,
                    child: Divider(
                      color: Colors.teal.shade100,
                    ),
                  ),
                  Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            leading: Icon(Icons.phone,
                                color: Colors.teal),
                            title: TextField(
                              style: TextStyle(
                                  color: Colors.teal.shade900,
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 20.0
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none
                              ),
                              controller: userPhoneNumberController,
                              onChanged: (newValue) {
                                applicationPreferences.setString('userPhoneNumber', newValue);
                              },
                            ),
                          )
                      )
                  ),
                  Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          leading: Icon(Icons.email,
                              color: Colors.teal),
                          title: TextField(
                            style: TextStyle(
                                color: Colors.teal.shade900,
                                fontFamily: 'SourceSansPro',
                                fontSize: 14.0
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none
                            ),
                            controller: userEmailController,
                            onChanged: (newValue) {
                              applicationPreferences.setString('userEmail', newValue);
                            },
                          ),
                        ),
                      )
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}