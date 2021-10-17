import 'package:binge/authentications.dart';
import 'package:binge/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';


class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  int coins;

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
        title: Text("Profile", textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontFamily: 'Bangers', fontSize: 30),),
      ),
            body: SingleChildScrollView(
              child: StreamBuilder(
    stream: FirebaseFirestore.instance.collection('users').doc(currentUser.id).snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return new Text("Loading", textAlign: TextAlign.center,);
      }
      var userDocument = snapshot.data;
      coins = userDocument["amount"];
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 30,),
          Container(
            height: 180,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: MediaQuery
                    .of(context)
                    .size
                    .width / 4.3),
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Stack(
                        children: <Widget>[
                          CircleAvatar(
                              radius: 50,
                              backgroundColor: Color(0xFF07fdab),
                              child: CircleAvatar(
                                  radius: 49,
                                  backgroundImage: NetworkImage(
                                      (currentUser != null)
                                          ? currentUser.url
                                          : 'assets/images/profile.jpg'))),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Color(0xFF07fdab),
                              child: Icon(
                                Icons.edit,
                                color: Color(0xFF212121),
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      currentUser.username,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      currentUser.email,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.5),
                Column(
                  children: [
                    SizedBox(height: 20,),
                    Text("Total Coins", style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),),
                    Text(coins.toString(), style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),)
                  ],
                ),
                SizedBox(width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.5),
                Column(
                  children: [
                    SizedBox(height: 20,),
                    Text("Total Wins", style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),),
                    Text("1100", style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),)
                  ],
                ),
                SizedBox(width: MediaQuery
                    .of(context)
                    .size
                    .width / 3),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Swipe', style: TextStyle(color: Colors.grey),),
              Icon(Icons.arrow_forward_ios_rounded, size: 20,color: Color(0xFF07fdab)),
              SizedBox(width: 20,)
            ],
          ),
          SizedBox(height: 20,),
          Column(
            children: [
              profileListItem(
                  Icons.history, 'Purchase History', 'PurchaseHistory'),
              profileListItem(Icons.help_outline_rounded, 'Help & Support',
                  'Help & Support'),
              profileListItem(Icons.settings, 'Settings', 'Settings',),
              profileListItem(
                Icons.person_add, 'Invite a Friend', 'Invite a Friend',),
              profileListItem(Icons.logout, 'Logout', 'Logout',),
            ],
          )

        ],
      );
    }),
            ),
          );
  }

  profileListItem(IconData icon, String text, String functionality ){
    return TextButton(
      onPressed: () {print(functionality);
      if(functionality=='Logout') {
        logoutUser();
      }
      },
      child: Container(
        height: 55,
        margin: EdgeInsets.symmetric(
          horizontal: 25,
        ).copyWith(
          bottom: 10,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color(0xFF07fdab),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 20,
              color: Colors.black,
            ),
            SizedBox(width: 15),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 20,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  logoutUser() async {
    //await gSignIn.signOut();
    User user = auth.currentUser;
    if (user.providerData[0].providerId == 'google.com') {
      await gSignIn.disconnect();
    }
    await auth.signOut();
    Phoenix.rebirth(context);
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => TestLogin()));

  }
}

