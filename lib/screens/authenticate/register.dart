import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motshelo_cash/services/auth.dart';
import 'package:motshelo_cash/shared/constants.dart';
import 'package:motshelo_cash/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  final AuthService _auth = AuthService();
  final _formKey= GlobalKey<FormState>();
  bool loading = false;
  //text field state
  String email = '';
  String fullName = '';
  String cell = '';
  String password = '';
  String error = '';
  
String validateMobile(String value) {
String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
RegExp regExp = new RegExp(patttern);
if (value.length == 0) {
      return 'Please enter mobile number';
}
else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
}
return null;
} 
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
       
       backgroundColor: Colors.white,
       appBar: AppBar(
         backgroundColor: Colors.blue[400],
         elevation: 0.0,
         title: Text('SignUp in to Motshelo'),
         actions: <Widget>[
           FlatButton.icon(onPressed: () {widget.toggleView();}, icon: Icon(Icons.person), label: Text('SignIn'), color: Colors.white)
         ],
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
                       
                       decoration: textInputDecoration.copyWith(hintText: 'Email'),
                       validator: (val) => val.isEmpty ? 'Enter an email' : null,
                       onChanged: (val){
                         setState(()  => email = val);
                       },
                    ),
                    
                    SizedBox(height: 20.0),
                    TextFormField(
                       decoration: textInputDecoration.copyWith(hintText: 'fullName'),
                       validator: (val) => val.isEmpty ? 'Enter your fullName' : null,
                       onChanged: (val){
                         setState(()  => fullName = val);
                       },
                    ),

                    SizedBox(height: 20.0),
                    TextFormField(
                       decoration: textInputDecoration.copyWith(hintText: 'Cell: 267 71 000 000'),
                       validator:  validateMobile,
                       onChanged: (val){
                        setState(()  => cell = val);
                       },
                    ),

                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(hintText: 'password'),
                      validator: (val) => val.length < 8 ? 'Enter a password 8+ chars long' : null,
                      obscureText: true,
                       onChanged: (val){
                         setState(()  => password = val);
                       },
                    ),

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
                         dynamic result = await _auth.registerDetails(email,fullName,cell,password);
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