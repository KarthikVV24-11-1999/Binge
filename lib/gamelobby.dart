import 'package:flutter/material.dart';
import 'package:share/share.dart';

class GameLobby extends StatefulWidget {
  const GameLobby({Key key}) : super(key: key);


  @override
  _GameLobbyState createState() => _GameLobbyState();
}

class _GameLobbyState extends State<GameLobby> {

  final name = 'Spiderman';
  final email = 'spiderman@gmail.com';
  final urlImage = 'assets/images/profile.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        bottom: PreferredSize(
            child: Container(
              color: const Color(0xFF39FF14),
              height: 1.0,
            ),
            preferredSize: const Size.fromHeight(4.0)),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("MY ROOM", textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF39FF14)),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 40,),
            const Text('ROOM CODE', style: TextStyle(fontSize: 20, color: Color(0xFF39FF14)),),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 60,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text('N', style: TextStyle(fontSize: 25, color: Color(0xFF39FF14)),),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: const Color(0xFF39FF14),width: 1),
                    ),
                  ),
                ),
                const SizedBox(width: 9,),
                SizedBox(
                  width: 50,
                  height: 60,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text('O', style: TextStyle(fontSize: 25, color: Color(0xFF39FF14)),),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: const Color(0xFF39FF14),width: 1),
                    ),
                  ),
                ),
                const SizedBox(width: 9,),
                SizedBox(
                  width: 50,
                  height: 60,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('O', style: const TextStyle(fontSize: 25, color: Color(0xFF39FF14)),),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: const Color(0xFF39FF14),width: 1),
                    ),
                  ),
                ),
                const SizedBox(width: 9,),
                SizedBox(
                  width: 50,
                  height: 60,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('B', style: TextStyle(fontSize: 25, color: Color(0xFF39FF14)),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Color(0xFF39FF14),width: 1),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('INVITE FRIENDS', style: TextStyle(fontSize: 20, color: Color(0xFF39FF14)),),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    side: BorderSide(width: 2, color: Color(0xFF39FF14)),
                  ),
                  onPressed: () => share(context),
                  child: Text('SHARE CODE', style: TextStyle(fontSize: 15, color: Color(0xFF39FF14) ),),
                )
              ],
            ),
            SizedBox(height: 50,),
            Text('Waiting For Players..', style: TextStyle(fontSize: 15, color: Color(0xFF39FF14) ),),
            SizedBox(height: 50,),
            ListTile(
              leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xFF39FF14),
                  child: CircleAvatar(
                      radius: 29,
                      backgroundImage: AssetImage(urlImage),
                  )),
              title: Text(name, style: TextStyle(color: Color(0xFF39FF14))),
              onTap: (){},
            ),
            SizedBox(height: 200,),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: (){},
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
                    "START GAME",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void share(BuildContext context) {
    final RenderBox box = context.findRenderObject();

    Share.share("I want to play BINGE! with you! Room Code: 'NOOB' Open App > Login > Join Room > Enter Room code. Believe me, this is an awesome game!",
        subject: "CODE",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

}
