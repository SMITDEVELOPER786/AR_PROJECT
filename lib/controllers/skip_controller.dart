import 'package:get/get.dart';
import 'package:play_iq/views/login_screen.dart';

class SkipController extends GetxController {
  void goToLogin() {
    Get.to(LoginScreen());
  }
}
