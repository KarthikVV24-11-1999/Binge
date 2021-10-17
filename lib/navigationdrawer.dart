import 'package:binge/authentications.dart';
import 'package:binge/home.dart';
import 'package:binge/login.dart';
import 'package:binge/profile.dart';
import 'package:binge/reportbug.dart';
import 'package:binge/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class NavigationDrawerWidget extends StatefulWidget {
  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final name = 'Spiderman';
    final email = 'spiderman@gmail.com';
    final urlImage = 'assets/images/profile.jpg';

    return Drawer(
      child: Material(
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => {},
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Home',
                    icon: Icons.home,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Profile',
                    icon: Icons.person,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Settings',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Color(0xFF07fdab)),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Report an Issue',
                    icon: Icons.bug_report,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Logout',
                    icon: Icons.logout,
                    onClicked: logoutUser,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    @required String urlImage,
    @required String name,
    @required String email,
    @required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF07fdab),
                    child: CircleAvatar(radius: 29, backgroundImage: NetworkImage((currentUser != null) ? currentUser.url : 'assets/images/profile.jpg'))),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (currentUser != null) ? currentUser.username : 'Spiderman',
                      style: TextStyle(fontSize: 20, color: Color(0xFF07fdab)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      (currentUser != null) ? currentUser.email : 'Spiderman@gmail.com',
                      style: TextStyle(fontSize: 13, color: Color(0xFF07fdab)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItem({
    @required String text,
    @required IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Color(0xFF07fdab);
    final hoverColor = Color(0xFF07fdab);

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
        break;
      case 1:
        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Profile(),
            ));
        break;
      case 2:
        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Settings(),
            ));
        break;
      case 3:
        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ReportBug(),
            ));
        break;
      case 4: logoutUser;
        break;
    }
  }

  logoutUser() async {
    //await gSignIn.signOut();
    User user = await auth.currentUser;
    print(user.providerData[0].providerId);
    if (user.providerData[0].providerId == 'google.com') {
      await gSignIn.disconnect();
    }
    await auth.signOut();
    Phoenix.rebirth(context);
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => TestLogin()));

  }
}