import 'package:get/get.dart';

class CharacterSelectionController extends GetxController {
  var selectedCharacterIndex = (-1).obs; // Initially, koi character select nahi

  void selectCharacter(int index) {
    selectedCharacterIndex.value = index;
  }
}
