import 'package:get/get.dart';

class PuzzleCompletedController extends GetxController {
  var characterName = "DRAGON EXOTIC CHARACTER".obs;
  var characterImage = "assets/images/dragon.jpg".obs;

  void setCharacter(String name, String imagePath) {
    characterName.value = name;
    characterImage.value = imagePath;
  }
}
