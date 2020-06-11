import 'package:flutter/material.dart';
import 'package:motshelo_cash/screens/authenticate/register.dart';
import 'package:motshelo_cash/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
  //locator.registerLazySigleton(() => FirestoreService())
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return SignIn(toggleView: toggleView);

    } else {
      return Register(toggleView: toggleView);
    }

     
  }
}
