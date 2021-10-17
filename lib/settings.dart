import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);


  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
        title: Text("SETTINGS", textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontFamily: 'Bangers', fontSize: 30),),
      ),
    );
  }
}
