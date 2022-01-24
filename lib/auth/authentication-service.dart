import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skippy/auth/googleSignInProvider.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<bool> signIn({String email, String password}) async{
    try {
      var sign = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    // return await FirebaseAuth.instance.signInWithCredential(credential);
    var authCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    print('Auth credential: $authCredential');

    return true;
  }

  Future<bool> signUp({String email, String password}) async{
    try {
      var sign = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }
}