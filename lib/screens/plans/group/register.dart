import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:motshelo_cash/models/user.dart';
import 'package:motshelo_cash/services/auth.dart';
import 'package:motshelo_cash/shared/constants.dart';
import 'package:motshelo_cash/shared/loading.dart';
import 'package:intl/intl.dart'; 

class RegisterGroup extends StatefulWidget {

  final Function toggleView;
  RegisterGroup({ this.toggleView});

  @override
  _RegisterGroupState createState() => _RegisterGroupState();
}

class _RegisterGroupState extends State<RegisterGroup> {
  
  //final AuthService _auth = AuthService();
  final firestoreInstance = Firestore.instance;
  final _formKey= GlobalKey<FormState>();
  bool loading = false;
  //text field state
  String title = '';
  String description = '';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String error = '';
  User member;
  

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
       
       backgroundColor: Colors.white,
       appBar: AppBar(
         backgroundColor: Colors.blue[400],
         elevation: 0.0,
         title: Text('Register for Group Plan'),
         
       ),
       body: Container(
         //resizeToAvoidBottomInset: false,
         padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 40.0),
         child: Form(
              key: _formKey,
              //children: <Widget>[
              child: SingleChildScrollView(
                              child: Column(
                  //key: _formKey,
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                       
                       decoration: textInputDecoration.copyWith(hintText: 'Title'),
                       validator: (val) => val.isEmpty ? 'Enter Title' : null,
                       onChanged: (val){
                         setState(()  => title = val);
                       },
                    ),
                    
                    SizedBox(height: 20.0),
                    TextFormField(
                       decoration: textInputDecoration.copyWith(hintText: 'Description'),
                       validator: (val) => val.isEmpty ? 'Enter Description' : null,
                       onChanged: (val){
                         setState(()  => description = val);
                       },
                    ),

                    SizedBox(height: 20.0),
                      FormBuilderDateTimePicker(    
                         attribute: "startDate",     
                         inputType: InputType.date,    
                         validators: [FormBuilderValidators.required()],    
                         format: DateFormat("dd-MM-yyyy"),    
                         decoration: InputDecoration(labelText: "Start_Date"),    
                       ),  

                    SizedBox(height: 20.0),
                      FormBuilderDateTimePicker(    
                         attribute: "endDate",    
                         inputType: InputType.date,    
                         validators: [FormBuilderValidators.required()],    
                         format: DateFormat("dd-MM-yyyy"),    
                         decoration: InputDecoration(labelText: "Start_Date"),    
                       ),  
                    
                     SizedBox(height: 20.0),

                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.green,
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                         if(_formKey.currentState.validate()){
                           setState(() => loading = true);
                         dynamic result = await firestoreInstance.collection('group');
                         if( result == null) {
                             setState(() {
                               error = 'Please supply valid email'; 
                               loading = false;
                               });
                         }
                       }
                      }
                    ),
                   SizedBox(height: 12.0),
                   Text(
                     error,
                     style: TextStyle(color: Colors.red, fontSize:14.0),
                   ),
                  ],
                ),
              ),
            //  ],
         ),
       ),
    );
  }
} 