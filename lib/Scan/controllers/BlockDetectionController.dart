import 'package:get/get.dart';

class BlockDetectionController extends GetxController {
  var blocksDetected = false.obs;

  void detectBlocks() {
    blocksDetected.value = true;
  }
}
