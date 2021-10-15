import 'package:binge/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 100, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Log In",
                  style: TextStyle(fontSize:30, color: Color(0xFF39FF14))
              ),
              SizedBox(
                height: 10,
              ),
              Text("Log In with one of the following options",
                  style: TextStyle(fontSize:15, color: Color(0xFF39FF14))),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                width: 2000,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => Home()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    primary: Color(0xFF39FF14),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(0.0),
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  child: Container(
                    constraints:
                    BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Log In",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?",
                        style: TextStyle(fontSize:15, color: Color(0xFF39FF14))),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Color(0xFF39FF14),
                      ),
                      child: Text('Sign Up', style: (TextStyle(fontSize: 15))),
                      onPressed: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
