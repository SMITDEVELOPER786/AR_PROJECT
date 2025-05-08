import 'package:get/get.dart';
import 'package:play_iq/views/skip_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5));
    // Get.toNamed(Routes.skip);
    Get.to(const SkipScreen()); // Change this when adding a home screen
  }
}
