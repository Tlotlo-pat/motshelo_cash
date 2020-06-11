import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motshelo_cash/models/user.dart';

class FirestoreService{

  final CollectionReference _usersCollectionReference = 
     Firestore.instance.collection('users');

  Future createUser(User user) async {
   
     try{
        
        await _usersCollectionReference.document(user.uid).setData(user.toJson());

     } catch (e){
       print(e.toString());
       return null;
     }
     
  }

}