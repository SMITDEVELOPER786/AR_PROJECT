import 'package:get/get.dart';

class RhymingGameController extends GetxController {
  var selectedLetters = <String>[].obs;

  void selectLetter(String letter) {
    if (selectedLetters.length < 4) {
      selectedLetters.add(letter);
    }
  }

  void resetSelection() {
    selectedLetters.clear();
  }
}
