import 'package:firebase_auth/firebase_auth.dart';
import 'package:motshelo_cash/models/user.dart';
import 'package:motshelo_cash/screens/authenticate/register.dart';
import 'package:motshelo_cash/services/database.dart'; 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motshelo_cash/locator.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final Firestore _firestoreService = FirestoreService.;
  final firestoreInstance = Firestore.instance;

  final FirestoreService _firestoreService = locator<FirestoreService>();
 
 //create user obj based on FirebaseUser
 User _userFromFirebaseUser(FirebaseUser user){

    return user != null ? User(uid: user.uid) : null;  
    
 }

 // auth change user stream
 Stream<User>  get user{
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);
 }
 
 //sign in anon
 Future signInAnon() async{
   try {

     AuthResult result =  await _auth.signInAnonymously();
     FirebaseUser user = result.user;
     return _userFromFirebaseUser(user); 

   } catch(e){
     print(e.toString());
     return null;
   }
 }

 // sign in with email and pass
  Future signIn(String email, String password) async {
    try{
       AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password:password);
       FirebaseUser user = result.user;
       return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

 //register with email and password
  Future registerDetails(String email, String fullName,String cell,String password) async {
    try{
       AuthResult result = await _auth.createUserWithEmailAndPassword(email: email,password:password);
      // UserUpdateInfo updateInfo = UserUpdateInfo();
       //updateInfo.displayName = user.displayName;
       await _firestoreService.createUser(User(uid: result.user.uid, email: email, fullName: fullName, cell: cell));
       FirebaseUser user = result.user;
      // Firestore.instance.collection('users').document(user.uid).setData({ 'fullName': fullName, 'cell': cell});
       return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }

  }

 //sign out
 Future signOut() async {
   try{
     return await _auth.signOut();
    
   } catch(e){
    print(e.toString());
    return null;
   }
 }

}