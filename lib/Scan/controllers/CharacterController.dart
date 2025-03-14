import 'package:get/get.dart';

class CharacterController extends GetxController {
  var isLavaOn = false.obs;   // Lava switch ki state
  var isWaterOn = false.obs;  // Water switch ki state

  void toggleLava(bool value) {
    isLavaOn.value = value;
  }

  void toggleWater(bool value) {
    isWaterOn.value = value;
  }
}
