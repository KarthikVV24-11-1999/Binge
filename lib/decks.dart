import 'package:binge/gametype.dart';
import 'package:binge/login.dart';
import 'package:binge/profile.dart';
import 'package:flutter/material.dart';

class Decks extends StatefulWidget {
  const Decks({Key key}) : super(key: key);

  @override
  State<Decks> createState() => _DecksState();
}

class _DecksState extends State<Decks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Profile(),
              ));},
          child: CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFF07fdab),
              child: CircleAvatar(
                  radius: 19, backgroundImage: NetworkImage((currentUser != null) ? currentUser.url : 'assets/images/profile.jpg'))),
        ),
        bottom: PreferredSize(
            child: Container(
              color: Color(0xFF07fdab),
              height: 2.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("BINGE !", textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontFamily: 'Bangers', fontSize: 40)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    decks(context)
                  ],
                )
            ),
          )),
    );
  }

  decks(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        const Align(
            alignment: Alignment.center,
            child: Text(
              "THE DECKS",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, height: 1.5, fontFamily: 'Aleo'),
            )),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            card('assets/images/friends.jpeg'),
            card('assets/images/GOT.jpeg'),
          ],
        ),
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            card('assets/images/mirzapur.jpeg'),
            card('assets/images/bbt.jpg'),
          ],
        ),
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            card('assets/images/B99.jpg'),
            card('assets/images/lucifer.jpeg'),
          ],
        ),
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            card('assets/images/moneyheist.jpg'),
            card('assets/images/squidgame.jpeg')
          ],
        ),
      ],
    );
  }

  card (String url) {
    return
      TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => GameType()));
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width/2.3,
            height: 270,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: Color(0xFF77db9b),width: 1),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(url)
                ),
              ),
            ),
          ),
      );
  }
}
