import 'package:get/get.dart';

class RhymingGame2Controller extends GetxController {
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
