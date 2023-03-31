import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<bool> registerWithGoogle() async {
  // Trigger the Google sign-in flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the Google sign-in flow
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new Firebase credential using the Google authentication tokens
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  try {
    // Sign in to Firebase using the Google credential
    final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    // If the user doesn't already exist in Firebase, create a new account using their Google email and a random password
    if (userCredential.additionalUserInfo!.isNewUser) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userCredential.user!.email!,
        password: 'random-password',
      );
    }

    // User is now signed in to Firebase
    print('User ${userCredential.user!.uid} signed in to Firebase');

    // Return true to indicate successful registration
    return true;
  } catch (e) {
    // Return false to indicate registration failed
    return false;
  }
}