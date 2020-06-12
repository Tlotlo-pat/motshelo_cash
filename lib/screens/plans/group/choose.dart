import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Choose extends StatefulWidget {
  Choose({Key key, this.title, this.uid}) : super(key: key); //update this to include the uid in the constructor
  final String title;
  final String uid; //include this

   final int selectedIndex = 0;
  

  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  TextEditingController taskTitleInputController;
  TextEditingController taskDescripInputController;
  FirebaseUser currentUser;
  int _currentIndex = 0;
 


  @override
  initState() {
    taskTitleInputController = new TextEditingController();
    taskDescripInputController = new TextEditingController();
    this.getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    currentUser = await FirebaseAuth.instance.currentUser();
  }
  
  void onTabTapped(int index){
     setState(() {
       _currentIndex = index;
     });
  }
  @override
  Widget build(BuildContext context) {
    
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('my group savings'),
       
        
      ),
      
    
      body: Center(

       
        child: FlatButton(  
        //Text('Create Group Plan'),
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        padding: EdgeInsets.all(8.0),
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
        onPressed: () {
         Navigator.pushNamed(context, "/register");
         },
         child: Text('Create Group Plan',style: TextStyle(fontSize: 20.0),),
                    
        ),
     
      ),
      bottomNavigationBar: BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      items: [
         
        new BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        new BottomNavigationBarItem(icon: Icon(Icons.history), title: Text('Transactions')),
        new BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile')),
           
      ],

    ),
      

       
     
  
      
    );
    return scaffold;
  }
   

  
 
}
