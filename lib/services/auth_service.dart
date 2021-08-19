import 'package:firebase_auth/firebase_auth.dart';
import 'package:firbase_test3/models/myUser.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser _userFromFirebaseUser(User user) {
    return MyUser(uid: user.uid);
  }

  //auth change user stream, change the state if user signs out
  Stream<MyUser> get user {
    return _auth.authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
    //or .map(_userFromFirebaseUser); it is equivelant
  }
  //sign in with email

  //sign in anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
