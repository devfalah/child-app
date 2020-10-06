import 'package:Child/res/strings.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Tts {
  FlutterTts flutterTts;

  Tts() {
    flutterTts = new FlutterTts();
    flutterTts.setLanguage('ar');
  }


  Future speak({String textToSpeach =inputHint}) async {

    var result = await flutterTts.speak(textToSpeach);
    if (result != 1) {
      print("erorr in speak");
    }
  }
}

