import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_iq/service/firebase_api_service.dart';
import 'package:play_iq/views/login_screen.dart';

class SettingsController extends GetxController {
  var isAudioEnabled = false.obs;
  var animationSpeed = 50.0.obs; // Define animationSpeed here

  final FirebaseApiService _firebaseService = FirebaseApiService();

  RxBool isLoading = false.obs;

  void logOut() {
    try {
      isLoading.value = true;
      _firebaseService.logout().then((value) {
        isLoading.value = false;

        Get.offAll(() => LoginScreen());
      });
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
      Get.snackbar("Error", "Something went wrong",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
