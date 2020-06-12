import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motshelo_cash/services/auth.dart';
import 'package:motshelo_cash/services/auth.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:motshelo_cash/services/database.dart';





class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

    final AuthService _auth  = AuthService();
  int _currentIndex = 1;
  final int selectedIndex = 0;
  final FirebaseAuth _authi = FirebaseAuth.instance;
   FirebaseUser user;
   

   void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _authi.currentUser();
    setState(() {});
  }

  final List<Widget> _children = [];

  void onTabTapped(int index){
     setState(() {
       _currentIndex = index;
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Motshelo'),
        backgroundColor: Colors.blue[400],
        elevation:0.0,
        actions: <Widget>[
          FlatButton.icon(onPressed: () async { await _auth.signOut();}, icon: Icon(Icons.person), label: Text('logout'), color: Colors.white)
        ]
      ),
       drawer: Drawer(
        elevation: 10.0,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("${user?.displayName}"),
              accountEmail: Text("${user?.email}"),
              decoration: BoxDecoration(
                color: Colors.blue,
                
                
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: (){

              },
            ),
            ListTile(
              title: Text('About MotsheloApp'),
              onTap: (){

              },
            ),
          ],
        ),
      ),
      
      body: Container(
          
           child: Column(
            children: <Widget>[
            Image.asset('assets/money.jpg'),
            Text('Choose Plan Below',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue.withOpacity(0.8))),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // IconButton(icon: Icon(Icons.group), onPressed: (){}, iconSize: 100,),
                  // IconButton(icon: Icon(Icons.person), onPressed: (){}, iconSize: 100, labelText)
                  FlatButton(textColor: Colors.white,padding:EdgeInsets.all(35),onPressed: (){ Navigator.pushNamed(context, "/choose");},color: Colors.teal[300],shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                   child: Column(children: <Widget>[
                   Icon(Icons.group),Text('Group Savings'),
                  ],),),

                  FlatButton(textColor: Colors.white,padding:EdgeInsets.all(35),onPressed: (){},color: Colors.red[300],shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                  child: Column(children: <Widget>[
                   Icon(Icons.person),Text('Personal Savings'),
                  ],),),

                 /* FlatButton(textColor: Colors.white,padding:EdgeInsets.fromLTRB(50, 15, 50, 15),onPressed: (){},color: Colors.blue[300],shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                  child: Column(children: <Widget>[
                   Icon(Icons.gps_fixed),Text('Fixed Savings'),
                  ],),),*/
                ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // IconButton(icon: Icon(Icons.group), onPressed: (){}, iconSize: 100,),
                  // IconButton(icon: Icon(Icons.person), onPressed: (){}, iconSize: 100, labelText)
                  FlatButton(textColor: Colors.white,padding:EdgeInsets.fromLTRB(35, 45, 35, 45),onPressed: (){},color: Colors.green[300],shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                   child: Column(children: <Widget>[
                   Icon(Icons.rotate_left),Text('Rotational Savings'),
                  ],),),

                

                 /* FlatButton(textColor: Colors.white,padding:EdgeInsets.fromLTRB(50, 15, 50, 15),onPressed: (){},color: Colors.blue[300],shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                  child: Column(children: <Widget>[
                   Icon(Icons.gps_fixed),Text('Fixed Savings'),
                  ],),),*/
                ],
            ),
           ]
              
      ) , 
          
           
      ),
     //_children[_currentIndex],   
    
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
  }
}