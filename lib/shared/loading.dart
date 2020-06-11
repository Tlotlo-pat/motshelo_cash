import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.blue[100],
       child:  Center(
         child: SpinKitChasingDots(
           color: Colors.blue,
           size: 50.0,
         )
       ),
    );
  }
}