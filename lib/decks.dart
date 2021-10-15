import 'package:binge/gamelobby.dart';
import 'package:binge/navigationdrawer.dart';
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
      backgroundColor: Color(0xFF142535),
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        bottom: PreferredSize(
            child: Container(
              color: Color(0xFF9ce991),
              height: 2.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
        backgroundColor: Color(0xFF142535),
        centerTitle: true,
        title: Text("BINGE !", textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF77db9b ), fontFamily: 'Bangers', fontSize: 40)),
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
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GameLobby()));
                },
                child: card('assets/images/friends.jpg', Colors.black, 30)
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GameLobby()));
                },
                child: card('assets/images/GOT.jpg', Colors.black,15)
            ),
          ],
        ),
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GameLobby()));
                },
                child: card('assets/images/mirzapur.jpg', Colors.black,15)
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GameLobby()));
                },
                child:  card('assets/images/bbt.jpg', Colors.black, 20)
            ),
          ],
        ),
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GameLobby()));
                },
                child: card('assets/images/B99.jpg', Colors.black, 30)
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GameLobby()));
                },
                child: card('assets/images/lucifer.jpg',  Colors.black, 10)
            ),
          ],
        ),
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GameLobby()));
                },
                child: card('assets/images/moneyheist.jpg', Colors.black, 30)
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GameLobby()));
                },
                child: card('assets/images/squidgame.jpeg',  Colors.black, 10)
            ),
          ],
        ),
        /*PetOptions(
                  itemOneTitle: "Vet \nClinics",
                  itemOneImg: "assets/images/Vet.png",
                  itemTwoTitle: "Places \nto eat",
                  itemTwoImg: "assets/images/dogfood.png"),,*/
      ],
    );
  }

  card (String url, Color colors, double top) {
    return SizedBox(
      width: 175,
      height: 240,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Color(0xFF77db9b),width: 1),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(url)
          ),
        ),
      ),
    );
  }
}
