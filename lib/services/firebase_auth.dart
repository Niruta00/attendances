import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';


class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;


   Future logininwithgoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential myCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential user =
        await FirebaseAuth.instance.signInWithCredential(myCredential);

    debugPrint(user.user?.displayName);
  }
}