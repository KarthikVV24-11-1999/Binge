import 'package:binge/creategamelobby.dart';
import 'package:binge/joingamelobby.dart';
import 'package:flutter/material.dart';

class GameType extends StatefulWidget {

  @override
  _GameTypeState createState() => _GameTypeState();
}

class _GameTypeState extends State<GameType> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xFF77db9b)),
              child: Text("Join Game", style: TextStyle(
                  color: Colors.black
              ),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => JoinGameLobby()));
              },
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xFF77db9b)),
              child: Text("Create Game", style: TextStyle(
                  color: Colors.black
              ),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreateGameLobby()));
              },
            )
          ],
        ),
      );
  }
}
