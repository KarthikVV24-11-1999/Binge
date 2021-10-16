import 'package:binge/coins.dart';
import 'package:binge/decks.dart';
import 'package:binge/gamelobby.dart';
import 'package:binge/leaderboard.dart';
import 'package:binge/navigationdrawer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PageController pageController;
  int getPageIndex = 0;

  void initState() {
    super.initState();

    pageController = PageController();
  }

  whenPageChanges(int pageIndex) {
    setState(() {
      this.getPageIndex = pageIndex;
    });
  }

  onTapChangePage(int pageIndex) {
    pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 1), curve: Curves.bounceInOut);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Decks(),
          Leaderboard(),
          Bingecoins()
        ],
        controller: pageController,
        onPageChanged: whenPageChanges,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: getPageIndex,
        //currentIndex: getPageIndex,
        onTap: onTapChangePage,
        height: 50,
        backgroundColor: Colors.black,
        buttonBackgroundColor: Color(0xFF07fdab),
        color: Color(0xFF07fdab),
        animationDuration: Duration(
            milliseconds: 300
        ),
        //activeColor: Colors.pink,
        //inactiveColor: Colors.grey,
        items: [
          Icon(Icons.content_copy_rounded,size:40, color: Colors.black,),
          Icon(Icons.leaderboard_rounded,size: 30, color: Colors.black,),
          Icon(Icons.monetization_on_rounded,size: 30, color: Colors.black,)
          /*BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.pets_rounded)),
          BottomNavigationBarItem(icon: Icon(Icons.local_fire_department)),
          BottomNavigationBarItem(icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),*/
        ],
      ),
    );
  }

}
