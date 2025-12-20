import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService{

  // Firebase service that manages authentication in your app
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Open the Google account selection screen
  final GoogleSignIn _googleSignIn = GoogleSignIn(clientId: "165574279956-di8m647fn6i1iha3vru3t84dqnts5tsm.apps.googleusercontent.com");

  Future<User?> SignInWithGoogle ()async{
    
    try{
      final GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();

    // if not select any account return null
    if(googleAccount == null) return null;

    // Gets access token + ID token from Google
    final GoogleSignInAuthentication googleAuth = await googleAccount.authentication;

    // Converts Google tokens into Firebase credentials
    final credentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    ); 

    // Firebase verifies the credential and log user into app
    final UserCredential userCredential = await firebaseAuth.signInWithCredential(credentials);

    // Extracts the authenticated Firebase user from the login result
    final User user = userCredential.user!;

    await FirebaseFirestore.instance.collection('user').add({
      'uid': user.uid,
      'name': user.displayName,
      'email': user.email,
      'photoUrl': user.photoURL,
      'createdAt': FieldValue.serverTimestamp(),
    });SetOptions(merge: true);

    return user;
    }
    catch(e){
      print("Google Sign-In Error: $e");
      return null;
    }
  }


}