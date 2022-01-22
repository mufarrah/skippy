import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<bool> signIn({String email, String password}) async{
    try {
      var sign = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      print(sign);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }
  Future<bool> signUp({String email, String password}) async{
    try {
      var sign = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      print(sign);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }
}