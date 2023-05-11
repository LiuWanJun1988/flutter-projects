import 'package:flutter/material.dart';
import 'dart:io';
import '../main.dart';

class MyCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var image;

    var userName = applicationPreferences?.getString('userName') ?? '';
    var userOccupation = applicationPreferences?.getString('userOccupation') ?? '';
    var userPhoneNumber = applicationPreferences?.getString('userPhoneNumber') ?? '';
    var userEmail = applicationPreferences?.getString('userEmail') ?? '';

    var imagePath = applicationPreferences?.getString('imagePath') ?? '';

    if (imagePath?.isNotEmpty ?? false) {
      image = MemoryImage(File(imagePath).readAsBytesSync());
    }

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
                backgroundImage: image,
              ),
              Text(
                userName,
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico'
                ),
              ),
              Text(
                userOccupation,
                style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 2.5,
                    color: Colors.teal.shade100,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SourceSansPro'
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
                        title: Text(
                          userPhoneNumber,
                          style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'SourceSansPro',
                              fontSize: 20.0
                          ),
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
                      title: Text(
                        userEmail,
                        style: TextStyle(
                            color: Colors.teal.shade900,
                            fontFamily: 'SourceSansPro',
                            fontSize: 14.0
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                width: double.infinity,
                height: 0,
              )
            ]
        ),
      ),
    );
  }
}