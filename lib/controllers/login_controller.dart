import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_iq/Tab.dart';
import 'package:play_iq/service/firebase_api_service.dart';

class LoginController extends GetxController {
  final FirebaseApiService _firebaseService = FirebaseApiService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isPasswordHidden = true.obs;
  RxBool isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void login() async {
    try {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        Get.snackbar("Error", "Please enter both email and password",
            snackPosition: SnackPosition.BOTTOM);
        return;
      }
      isLoading.value = true;

      final user = await _firebaseService.login(
        email: email,
        password: password,
      );

      if (user != null) {
        isLoading.value = false;
        Get.snackbar("Success", "Login successful",
            snackPosition: SnackPosition.BOTTOM);
        Get.to(const Hometab());
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
      Get.snackbar("Error", "Something went wrong",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void googleLogin() {
    Get.snackbar("Info", "Google Sign-In clicked",
        snackPosition: SnackPosition.BOTTOM);
  }
}
