import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //SignIn with Gmail

  Future<void> signInWithGoogle() async {
    try {
      //Triger the google signin process
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }

      final googleAuth = await googleUser.authentication;

      //Create the credential
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await _auth.signInWithCredential(credential);
    } catch (error) {
      print('Error Signin with Google : $error');
    }
  }

  //Signut method
  Future<void> signOut() async {
    try {
  await _auth.signOut();
} catch (e) {
  // TODO
}
  }
}
