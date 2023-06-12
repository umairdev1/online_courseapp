import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:online_courseapp/utilis/colors.dart';
import 'package:online_courseapp/views/home/home_view.dart';

import '../mainview/main_view.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  OnBoardViewState createState() => OnBoardViewState();
}

class OnBoardViewState extends State<OnBoardView> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
      fontSize: 14.0,
    );

    const pageDecoration = PageDecoration(
        imageFlex: 2,
        titleTextStyle: TextStyle(fontSize: 38.0, fontWeight: FontWeight.w700),
        bodyTextStyle: bodyStyle,
        bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        imagePadding: EdgeInsets.zero,
        pageColor: kwhiteClr);

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: kwhiteClr,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      globalHeader: const Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16),
          ),
        ),
      ),

      pages: [
        PageViewModel(
          title: "Explore Thousands of Online Courses",
          body:
              "Download the Stockpile app and master the market with our mini-lesson.",
          image: Container(
            height: 700,
            width: double.maxFinite,
            color: kbottonpurpleClr,
            child: Image.network(
              "https://cdni.iconscout.com/illustration/premium/thumb/education-qualification-2161979-1819835.png",
              height: 300,
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Kids and teens",
          body:
              "Kids and teens can track their stocks 24/7 and place trades that you approve.",
          image: Container(
            height: 700,
            width: double.maxFinite,
            color: kbottonpurpleClr,
            child: Image.network(
              "https://cdni.iconscout.com/illustration/premium/thumb/education-in-metaverse-5200780-4340679.png?f=webp",
              height: 300,
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: Container(
            height: 700,
            width: double.maxFinite,
            color: kbottonpurpleClr,
            child: Image.network(
              "https://cdni.iconscout.com/illustration/premium/thumb/education-4238850-3518593.png?f=webp",
              height: 300,
            ),
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainView(),
            ));
      },
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,

      next: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: kprimaryClr),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: kwhiteClr,
            ),
          )),
      done: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: kprimaryClr),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Done',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: kwhiteClr)),
          )),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(20.0, 6.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        color: kbottonpurpleClr,
        activeColor: kprimaryClr,
        activeSize: Size(20.0, 6.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
