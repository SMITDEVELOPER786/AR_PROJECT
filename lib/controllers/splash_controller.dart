import 'package:get/get.dart';
import 'package:play_iq/views/skip_screen.dart';
import '../../app/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5));
    // Get.toNamed(Routes.skip);
    Get.to(SkipScreen()); // Change this when adding a home screen
  }
}
