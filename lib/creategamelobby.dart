import 'package:binge/login.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class CreateGameLobby extends StatefulWidget {
  const CreateGameLobby({Key key}) : super(key: key);


  @override
  _CreateGameLobbyState createState() => _CreateGameLobbyState();
}

class _CreateGameLobbyState extends State<CreateGameLobby> {

  String code = (currentUser != null) ? currentUser.username : 'Spiderman';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        bottom: PreferredSize(
            child: Container(
              color: const Color(0xFF07fdab),
              height: 1.0,
            ),
            preferredSize: const Size.fromHeight(4.0)),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("MY ROOM", textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontFamily: 'Bangers', fontSize: 30),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40,),
              Container(
                padding: const EdgeInsets.all(50.0),
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xFF07fdab),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text('ROOM CODE', style: TextStyle(fontFamily: 'Aleo', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 60,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text('${code[0].toUpperCase()}', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(color: Colors.black,width: 1),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 9,),
                              SizedBox(
                                width: 50,
                                height: 60,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text('${code[1].toUpperCase()}', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(color: Colors.black,width: 1),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 9,),
                              SizedBox(
                                width: 50,
                                height: 60,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text('${code[2].toUpperCase()}', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(color: Colors.black,width: 1),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 9,),
                              SizedBox(
                                width: 50,
                                height: 60,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text('${code[3].toUpperCase()}', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(color: Colors.black,width: 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('INVITE FRIENDS', style: TextStyle(fontFamily: 'Aleo', fontSize: 20, color: Colors.white),),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      side: BorderSide(width: 2, color: Color(0xFF39FF14)),
                    ),
                    onPressed: () => share(context),
                    child: Text('SHARE CODE', style: TextStyle(fontFamily: 'Aleo', fontSize: 15, color: Colors.white ),),
                  )
                ],
              ),
              SizedBox(height: 50,),
              Text('Waiting For Players..', style: TextStyle(fontFamily: 'Aleo', fontSize: 15, color: Colors.white ),),
              SizedBox(height: 50,),
              ListTile(
                leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xFF39FF14),
                    child: CircleAvatar(
                        radius: 29,
                        backgroundImage: NetworkImage((currentUser != null) ? currentUser.url : 'assets/images/profile.jpg'),
                    )),
                title: Text((currentUser != null) ? currentUser.username : 'Spiderman', style: TextStyle(fontFamily: 'Aleo', color: Color(0xFF07fdab))),
                onTap: (){},
              ),
              SizedBox(height: 180,),
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
                    primary: Color(0xFF07fdab),
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
      ),
    );
  }

  void share(BuildContext context) {
    final RenderBox box = context.findRenderObject();

    Share.share("I want to play BINGE! with you! Room Code: '${code[0].toUpperCase()} ${code[1].toUpperCase()} ${code[2].toUpperCase()} ${code[3].toUpperCase()}' Open App > Login > Join Room > Enter Room code. Believe me, this is an awesome game!",
        subject: "CODE",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

}
