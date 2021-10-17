import 'package:flutter/material.dart';

class ReportBug extends StatefulWidget {
  const ReportBug({Key key}) : super(key: key);


  @override
  _ReportBugState createState() => _ReportBugState();
}

class _ReportBugState extends State<ReportBug> {
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
        title: Text("REPORT A BUG", textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontFamily: 'Bangers', fontSize: 30),),
      ),
    );
  }
}
