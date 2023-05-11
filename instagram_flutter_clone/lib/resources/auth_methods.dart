import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_flutter_clone/models/user.dart' as model;
import 'package:instagram_flutter_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

  DocumentSnapshot snap = await _firebaseFirestore.collection('users')
      .doc(currentUser.uid).get();

  return model.User.fromSnapshot(snap);
  }

  //sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'Some error occured';
    try {
      if(email.isNotEmpty || password.isNotEmpty
          || username.isNotEmpty || bio.isNotEmpty
          || file != null) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password
        );

        String photoUrl = await StorageMethods().uploadImageToStorage(
            'profilePics',
            file,
            false
        );

        // add user to database

        model.User user = model.User(
            email: email,
            uid: cred.user!.uid,
            photoUrl: photoUrl,
            username: username,
            bio: bio,
            followers: [],
            following: []
        );

        _firebaseFirestore.collection('users')
            .doc(cred.user!.uid).set(user.toJson());

        res = 'success';
      }
    } catch(err) {
      res = err.toString();
    }
    return res;
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password
  }) async {
    String res = "Some error occured";

    try {
      if(email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email,
            password: password
        );

        res = 'success';
      } else {
        res = 'Please enter all the fields';
      }
    } catch(err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}