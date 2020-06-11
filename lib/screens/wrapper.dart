import 'package:flutter/material.dart';
import 'package:motshelo_cash/screens/authenticate/authenticate.dart';
import 'package:motshelo_cash/screens/home/home.dart';
import 'package:motshelo_cash/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:motshelo_cash/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   final user = Provider.of<User>(context);
   print(user);

   //return either home or uthenticate widget.
   if(user ==null){
     return Authenticate();
   }else {
     return Home ();
   }
  }
}