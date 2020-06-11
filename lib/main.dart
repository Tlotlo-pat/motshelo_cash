import 'package:flutter/material.dart';
import 'package:motshelo_cash/screens/welcome_screen.dart';
import 'package:motshelo_cash/screens/wrapper.dart';
import 'package:motshelo_cash/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:motshelo_cash/models/user.dart';
import 'package:motshelo_cash/locator.dart';

void main() {
  runApp(MotsheloCash());
  setuplocator();
}

class MotsheloCash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
         value: AuthService().user,
         child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Wrapper(), 
      ),
    );
  }
}