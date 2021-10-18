import 'package:binge/login.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction extends StatefulWidget {

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {


  @override
  Widget build(BuildContext context) => IntroductionScreen(
    isBottomSafeArea: true,
    pages: [
      PageViewModel(
        titleWidget: Column(
          children: [
            SizedBox(height: 70,),
            Stack(
              children: <Widget>[
                // Stroked text as border.
                Text(
                  'Welcome',
                  style:
                  TextStyle(
                    fontFamily: 'SubtleCurvesItalic',
                    fontSize: 40,
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
                  'Welcome',
                  style: TextStyle(
                    fontFamily: 'SubtleCurvesItalic', 
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Color(0xFF07fdab),
                  ),
                ),
              ],
            ),
            // Text('Welcome', style:TextStyle(fontFamily: 'SubtleCurvesItalic', fontSize: 40.0, fontWeight: FontWeight.bold, letterSpacing: 2.0, color: Color(0xFF07fdab))),
            SizedBox(height: 20,),
            Text("I'll be your guide. Let's start by swiping right. That's not so hard, is it?",
              textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText1.copyWith(fontFamily: 'Aleo', fontSize: 25,)
              ),
            // Material(
            //   borderRadius: BorderRadius.circular(20.0),
            //   color: Color(0xFF8390FA),
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         children: [
            //           Text('Welcome', style:TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Color(0xFFd1c8e1))),
            //           SizedBox(height: 20,),
            //           Text("I'll be your guide. Let's start by swiping right. That's not so hard, was it .",
            //             textAlign: TextAlign.center, style: TextStyle(fontSize: 25, color: Colors.white),),

            //         ],
            //       ),
            //     )),
            SizedBox(height: 35,),
            Image.asset('assets/images/welcome.png'),
          ],
        ),
        body: '',
        decoration: getPageDecoration(),
      ),
      PageViewModel(
        titleWidget: Column(
          children: [
            SizedBox(height: 60,),
            Image.asset('assets/images/selectadeck.png'),
            SizedBox(height: 25,),
            Stack(
              children: <Widget>[
                // Stroked text as border.
                Text(
                  'Select a Deck',
                  style: TextStyle(
                    fontFamily: 'SubtleCurvesItalic', 
                    fontSize: 40,
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
                  'Select a Deck',
                  style: TextStyle(
                    fontFamily: 'SubtleCurvesItalic', 
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Color(0xFF07fdab),
                  ),
                ),
              ],
            ),
            // Text('Select a Deck', style:TextStyle(fontFamily: 'SubtleCurvesItalic', fontSize: 40.0, fontWeight: FontWeight.bold, letterSpacing: 2.0, color: Color(0xFF07fdab))),
            SizedBox(height: 25,),
            Text("Pick a show/category from the decks, wager a few coins and double your coins in 60 seconds, if you are 'the ultimate binge watcher'. Binge offers a fresh take on TV show trivia by letting you win or lose coins on quick 5 question MCQ quizzes. Be prepared for some tricky and mind boggling questions from your favourite TV shows.",
                textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText1.copyWith(fontFamily: 'Aleo', fontSize: 25,),)
          ],
        ),
        body: '',
        decoration: getPageDecoration(),
      ),
      PageViewModel(
        titleWidget: Column(
          children: [
            SizedBox(height: 80,),
            Image.asset('assets/images/I declare bankruptcy.png'),
            SizedBox(height: 40,),
            Text("Make sure you've recapped the TV show before challenging your friends as you might end up declaring bankruptcy like our friend Michael Scott. ( Just kidding!! ) All coins are virtual binge coins!! So don't worry...",
              textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText1.copyWith(fontFamily: 'Aleo', fontSize: 25,),)
          ],
        ),
        body: '',
        decoration: getPageDecoration(),
      ),
      PageViewModel(
        titleWidget: Column(
          children: [
            SizedBox(height: 80,),
            Image.asset('assets/images/invite.png'),
            SizedBox(height: 45,),
            Stack(
              children: <Widget>[
                // Stroked text as border.
                Text(
                  'Invite',
                  style: TextStyle(
                    fontFamily: 'SubtleCurvesItalic', 
                    fontSize: 40,
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
                  'Invite',
                  style: TextStyle(
                    fontFamily: 'SubtleCurvesItalic', 
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Color(0xFF07fdab),
                  ),
                ),
              ],
            ),
            // Text(
            //   "Invite",
            //   style:TextStyle(fontFamily: 'SubtleCurvesItalic', fontSize: 40.0, fontWeight: FontWeight.bold, letterSpacing: 2.0, color: Color(0xFF07fdab)),
            //   style: new TextStyle(
            //       fontSize: 60.0,
            //       fontWeight: FontWeight.bold,
            //       foreground: Paint()..shader = LinearGradient(
            //         colors: <Color>[Color(0xffed15cd), Color(0xff8515ed)],
            //       ).createShader(Rect.fromLTRB(0.0, 0.0, 250.0, 0.0))),
            // ),
            SizedBox(height: 40,),
            Text('Share room code with your friend and invite them to the game',
              textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText1.copyWith(fontFamily: 'Aleo', fontSize: 25,),)
          ],
        ),
        body: '',
        decoration: getPageDecoration(),
      ),
      PageViewModel(
        titleWidget: Column(
          children: [
            SizedBox(height: 70,),
            Stack(
              children: <Widget>[
                // Stroked text as border.
                Text(
                  "Let's Binge !",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'SubtleCurvesItalic', 
                    fontSize: 80,
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
                  "Let's Binge !",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'SubtleCurvesItalic', 
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Color(0xFF07fdab),
                  ),
                ),
              ],
            ),
            // Text(
            //   "Let's Binge !",
            //   textAlign: TextAlign.left,
            //   style:TextStyle(fontFamily: 'SubtleCurvesItalic', fontSize: 80.0, fontWeight: FontWeight.bold, letterSpacing: 2.0, color: Color(0xFF07fdab)),
              // style: new TextStyle(
              //     fontSize: 80.0,
              //     fontWeight: FontWeight.bold,
              //     foreground: Paint()..shader = LinearGradient(
              //       colors: <Color>[Color(0xffed15cd), Color(0xff8515ed)],
              //     ).createShader(Rect.fromLTRB(0.0, 0.0, 250.0, 0.0))),
            // ),
            SizedBox(height: 90,),
            ElevatedButton(
              onPressed: () => goToHome(context),
              style: ElevatedButton.styleFrom(primary: Colors.white, shape: StadiumBorder(),padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),),
              child: Icon(Icons.live_tv_outlined, color: Colors.black, size: 70),
              // Text(
              //   'Start Playing',
              //   style: TextStyle(color: Colors.black, fontSize: 16),
              // ),
            )
          ],
        ),
        body: '',
        decoration: getPageDecoration(),
      ),

    ],
    done: Text('', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
    onDone: () => goToHome(context),
    showSkipButton: true,
    skip: Text('Skip', style: TextStyle(color: Colors.black, fontSize: 20)),
    onSkip: () => goToHome(context),
    next: Icon(Icons.arrow_forward, color: Colors.black),
    dotsDecorator: getDotDecoration(),
    globalBackgroundColor: Color.alphaBlend(Color(0xff07fdab), Color(0xffed15cd)),
    skipFlex: 0,
    nextFlex: 0,
    // isProgressTap: false,
    // isProgress: false,
    // showNextButton: false,
    // freeze: true,
    // animationDuration: 1000,
  );

  void goToHome(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => Login()),
  );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
    color: Colors.black,
    //activeColor: Colors.orange,
    size: Size(10, 10),
    activeSize: Size(22, 10),
    activeColor: Colors.black,
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Colors.white),
    bodyTextStyle: TextStyle(fontSize: 20, color: Colors.white),
    descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
    imagePadding: EdgeInsets.all(25),
    pageColor: Theme.of(context).backgroundColor,
  );
}