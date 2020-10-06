import 'package:Child/res/strings.dart';
import 'package:diamond_notched_fab/diamond_fab_notched_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'res/colors.dart';
import 'res/strings.dart';
import 'res/images.dart';
import 'logic/tts.dart';
import 'package:diamond_notched_fab/diamond_notched_fab.dart';

Tts tts;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    tts = new Tts();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  String _name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomAppBar(),
      body: buildBody(),
      floatingActionButton: DiamondNotchedFab(
        child: Icon(Icons.volume_up),
        backgroundColor: greenColor,
        onPressed: () {
          tts.speak(textToSpeach: _name);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      color: primaryColor,
      notchMargin: 5,
      shape: DiamondFabNotchedShape(),
      child: TextField(
        onChanged: (String writting) {
          _name = writting;
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: yellowSurfaceColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: yellowSurfaceColor),
          ),
          border: OutlineInputBorder(),
          labelText: inputHint,
          labelStyle: TextStyle(
            fontFamily: 'Homos',
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Container buildBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          buildTitle(),
          buildCardLayer(),
        ],
      ),
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("images/background.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget buildCardLayer() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSizedBox(image: imgFeelingsSad, text: feelingsSad),
              buildSizedBox(image: imgFeelingsHappy, text: feelingsHappy)
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildSizedBox(image: imgFeelingsWater, text: feelingsWater),
                buildSizedBox(image: imgFeelingsMe, text: feelingsMe),
                buildSizedBox(image: imgFeelingsHungry, text: feelingsHungry)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSizedBox(image: imgFeelingsNo, text: feelingsNO),
              buildSizedBox(image: imgFeelingsYes, text: feelingsYes)
            ],
          ),
        ],
      ),
    );
  }

  SizedBox buildSizedBox({String image, String text}) {
    return SizedBox(
      width: 100,
      child: Card(
        elevation: 6,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: InkWell(
          splashColor: blueColor,
          onTap: () => {
            tts.speak(textToSpeach: text),
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  image,
                  width: 80.0,
                  height: 80.0,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'Homos',
                  fontSize: 26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 48.0),
      child: Center(
        child: Text(
          titleApp,
          style: TextStyle(
            fontSize: 35.0,
            fontFamily: 'Homos',
            shadows: <Shadow>[
              Shadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(0, 4.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
