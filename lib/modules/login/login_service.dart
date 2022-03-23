import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnon() async {
    try {
     var result = await _auth.signInAnonymously();
     User user = result.user;
     return user;
    } catch (e){
      print(e.toString());
      return null;
    }
  } 

  Future<void> signOut() async{
    try {
      await _auth.signOut();
    } catch (e) {
       print(e.toString());
      return null;
    }
  }

}