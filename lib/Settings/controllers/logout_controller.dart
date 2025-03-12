import 'package:get/get.dart';

import '../app/routes.dart';

class LogoutController extends GetxController {
  void confirmLogout() {
    print("User logged out");
    Get.offAllNamed(Routes.login);
  }

  void cancelLogout() {
    Get.back();
  }
}
