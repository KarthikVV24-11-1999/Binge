import 'package:binge/CreateAccountPage.dart';
import 'package:binge/authentications.dart';
import 'package:binge/home.dart';
import 'package:binge/user.dart';
import 'package:binge/FadeAnimation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

final GoogleSignIn gSignIn = GoogleSignIn();
useri currentUser;

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool isSignedIn = false;
  bool loading = true;
  final DateTime timestamp = DateTime.now();

  @override
  void initState() {
    super.initState();
    gSignIn.onCurrentUserChanged.listen((gSignInAccount) {
      controlSignIn(gSignInAccount);
    }, onError: (gError) {
      print("Error Message: $gError");
    });
    gSignIn.signInSilently(suppressErrors: false).then((gsignInAccount) {
      controlSignIn(gsignInAccount);
      setState(() {
        isSignedIn = false;
      });
    }).catchError((gError) {
      print("Error Message: $gError");
    });
    setState(() {
      loading = false;
    });
  }


  controlSignIn(signInAccount) async {
    if (signInAccount != null) {
      await saveUserInfoToFireStore();
      print('User Signed In $signInAccount');
      setState(() {
        isSignedIn = true;
      });
    }
  }

  loginUser() {
    gSignIn.signIn();
  }

  logoutUser() {
    gSignIn.disconnect();
  }



  /*Future<bool> _logInWithMail() async {
    final form = formkey.currentState;
    if (form.validate()){
      setState(() {
        loading = true;
      });
      try {
        UserCredential result = await auth.signInWithEmailAndPassword(
            email: email, password: email);
        User user = await auth.currentUser;
        // return Future.value(true);
        print(user.uid);
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid)
            .get();
        if (!documentSnapshot.exists) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User does not Exist, Create Account'),
            ),
          );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignUp()));
        }
        documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        currentUser = useri.fromDocument(documentSnapshot);
        setState(() {
          isSignedIn = true;
        });
      } on FirebaseAuthException catch (e) {
        var title = '';
        switch (e.code) {
          case 'account-exists-with-different-credential' :
            title = 'This account exists with a different sign in provider';
            break;
          case 'invalid-credential' :
            title = 'Unknown error has occurred';
            break;
          case 'operation-not-allowed' :
            title = 'This operation is not allowed';
            break;
          case 'user-disabled' :
            title = 'The user you tried to login is disabled';
            break;
          case 'user-not-found' :
            title = 'User not found';
            break;
          case 'wrong-password' :
            title = 'Wrong Password';
            break;
        }
        showDialog(context: context, builder: (context) =>
            AlertDialog(
              title: Text('Log In with FaceBook failed'),
              content: Text(title),
              actions: [TextButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text('OK'))
              ],
            ));
      } finally {
        setState(() {
          loading = false;
        });
      }
    }
  }*/











  void _logInWithFacebook() async {
    setState(() {
      loading = true;
    });
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();

      final facebookAuthCredential = FacebookAuthProvider.credential(facebookLoginResult.accessToken.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      User user = auth.currentUser;
      print(user.uid);
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      if (!documentSnapshot.exists) {
        final username = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreateAccountPage()));

        FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          "id": user.uid,
          "profileName": userData['name'],
          "username": (username == null) ? 'Un-Named' : username,
          "url": userData['picture']['data']['url'],
          "email": userData['email'],
          "amount": 0,
          "timestamp": timestamp,
        });
      }
      setState(() {
        isSignedIn = true;
      });

      documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      currentUser = useri.fromDocument(documentSnapshot);
    }
    on FirebaseAuthException catch (e) {
      var title = '';
      switch (e.code) {
        case 'account-exists-with-different-credential' :
          title = 'This account exists with a different sign in provider';
          break;
        case 'invalid-credential' :
          title = 'Unknown error has occurred';
          break;
        case 'operation-not-allowed' :
          title = 'This operation is not allowed';
          break;
        case 'user-disabled' :
          title = 'The user you tried to login is disabled';
          break;
        case 'user-not-found' :
          title = 'User not found';
          break;
        case 'wrong-password' :
          title = 'Wrong Password';
          break;
      }
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text('Log In with FaceBook failed'),
        content: Text(title),
        actions: [TextButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text('OK'))],
      ));
    }finally {
      setState(() {
        loading = false;
      });
    }
  }

  saveUserInfoToFireStore() async {
    setState(() {
      loading = true;
    });
    try{
      GoogleSignInAccount googleSignInAccount = await gooleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);
        UserCredential result = await auth.signInWithCredential(credential);
        User user = auth.currentUser;
        print(user.uid);
        final GoogleSignInAccount gCurrentUser = gSignIn.currentUser;
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        if (!documentSnapshot.exists) {
          final username = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateAccountPage()));
          FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            "id": user.uid,
            "profileName": gCurrentUser.displayName,
            "username": (username == null) ? 'Un-Named' : username,
            "url": gCurrentUser.photoUrl,
            "email": gCurrentUser.email,
            "amount": 0,
            "timestamp": timestamp,
          });
        }
        documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        currentUser = useri.fromDocument(documentSnapshot);
      }
    }
    on FirebaseAuthException catch (e) {
      var title = '';
      switch (e.code) {
        case 'account-exists-with-different-credential' :
          title = 'This account exists with a different sign in provider';
          break;
        case 'invalid-credential' :
          title = 'Unknown error has occurred';
          break;
        case 'operation-not-allowed' :
          title = 'This operation is not allowed';
          break;
        case 'user-disabled' :
          title = 'The user you tried to login is disabled';
          break;
        case 'user-not-found' :
          title = 'User not found';
          break;
        case 'wrong-password' :
          title = 'Wrong Password';
          break;
      }
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text('Log In with FaceBook failed'),
        content: Text(title),
        actions: [TextButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text('OK'))],
      ));
    }finally {
      setState(() {
        loading = false;
      });
    }
  }


  Scaffold login(width) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 400,
                child: Stack(
                  children: <Widget>[
                    // Positioned(
                    //   top: 25,
                    //   height: 400,
                    //   width: width+20,
                    //   child: FadeAnimation(1, Container(
                    //     decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //         image: AssetImage('assets/images/background.png'),
                    //         fit: BoxFit.fill
                    //       ),
                    //     ),
                    //   )),
                    // ),
                    Positioned(
                      height: 400,
                      width: width+20,
                      child: FadeAnimation(1.3, Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/background-2.png'),
                            fit: BoxFit.fill
                          )
                        ),
                      )),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 40, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          'Log In',
                          style:
                          TextStyle(
                            fontFamily: 'SubtleCurvesItalic',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          ),
                        ),
                        // Solid text as fill.
                        Text(
                          'Log In',
                          style: TextStyle(
                            fontFamily: 'SubtleCurvesItalic',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            color: Color(0xFF07fdab),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Log In with one of the following options",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize:15, fontFamily: 'Aleo', fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextButton(
                          onPressed: loginUser,
                          child: Image(
                              width: 40,
                              image: AssetImage('assets/icons/google.png')),
                        ),
                        TextButton(
                          onPressed: _logInWithFacebook,
                          child: Image(
                              width: 40,
                              image: AssetImage('assets/icons/facebook.png')),
                        ),
                      ],
                    ),
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
                          side: BorderSide(color: Colors.black, width: 2),
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
                            "Log In",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize:15, fontFamily: 'Aleo', fontWeight: FontWeight.bold, color: Colors.black)
                          ),
                        ),
                      ),
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (loading == true) {
      return CircularProgressIndicator();
    } else {
      if (isSignedIn) {
        return Home();
      } else {
        return login(width);
      }
    }
  }
}

