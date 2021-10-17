import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);


  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          bottom: PreferredSize(
              child: Container(
                color: Color(0xFF07fdab),
                height: 2.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("PROFILE", textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontFamily: 'Bangers', fontSize: 30),),
        ),
    );
  }
}
