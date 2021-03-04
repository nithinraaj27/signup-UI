import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_maker_app/model/model.dart';

class AuthService
{
  FirebaseAuth _auth = FirebaseAuth.instance;
  Userr  _userFromFirebaseUser(User user)
  {
    return user != null ? Userr(uid: user.uid) : null;
  }

  Future signInEmailAndPass(String email, String password) async
  {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = authResult.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }
    Future signUpWithEmailAndPassword(String email, String password) async{
      try{

        UserCredential authResult = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password
        );
        User firebaseUser = authResult.user;
        return _userFromFirebaseUser(firebaseUser);
      }
      catch(e)
      {
        print(e.toString());
      }
    }

  Future signOut() async
  {
    try{
      return await _auth.signOut();
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }
}
