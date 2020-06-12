import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motshelo_cash/models/user.dart';

class FirestoreService{

  final String  uid;
  FirestoreService({ this.uid });

  final CollectionReference _usersCollectionReference = 
     Firestore.instance.collection('users');
  final CollectionReference _groupCollection = 
     Firestore.instance.collection('group');

  Future updateUserData(String fullName, String cell) async {
    return await _usersCollectionReference.document(uid).setData({
      'fullName': fullName,
      'cell': cell,
    });
  }

  Future UpdateGroupPlan(String title, String description, DateTime startDate, DateTime endDate , User member) async {
    return await _usersCollectionReference.document(uid).setData({
      'title': title,
      'description': description,
      'startDate' : startDate,
      'endDate' : endDate,
      'member'  : member,
    });
  }




  Future createUser(User user) async {
   
     try{
        
        await _usersCollectionReference.document(user.uid).setData(user.toJson());

     } catch (e){
       print(e.toString());
       return null;
     }
     
  }

}