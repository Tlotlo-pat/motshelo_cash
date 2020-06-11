import 'package:flutter/material.dart';
import 'package:motshelo_cash/services/auth.dart';
import 'package:motshelo_cash/shared/constants.dart';
import 'package:motshelo_cash/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey= GlobalKey<FormState>();
  bool loading = false;
  
  //text field state
  String email = '';
  String password = '';
   String error = '';

  
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
       
       backgroundColor: Colors.white,
       /*appBar: AppBar(
         backgroundColor: Colors.blue[400],
         elevation: 0.0,
         title: Text('Sign in to Motshelo'),
         actions: <Widget>[
           FlatButton.icon(onPressed: () {widget.toggleView();}, icon: Icon(Icons.person), label: Text('Register'))
           
         ],
       ),*/
       body: Container(  
         
         padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 40.0),
         child: Form(
              key: _formKey,
             // children: <Widget>[
              
              child: SingleChildScrollView(
                              child: Column(
                //  key: _formKey,
                  children: <Widget>[
                    SizedBox(
                        height: 180.0,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),

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
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                         
                           if(_formKey.currentState.validate()){
                            setState(() => loading = true );
                           dynamic result = await _auth.signIn(email,password);
                         if( result == null) {
                             setState(() { error = 'Could not sign in with those credentials';
                                           loading = false;
                             
                             });
                         }
                       }
                      },
                    ),
                   SizedBox(height: 12.0),
                   Text(
                     error,
                     style: TextStyle(color: Colors.red, fontSize:14.0),),
                     FlatButton.icon(onPressed: () {widget.toggleView();}, icon: Icon(Icons.person), label: Text('New here?  Please Register') ,color: Colors.white)
                  ],
                ),
              ),
              //],
         ),
       ),
    );
  }
}