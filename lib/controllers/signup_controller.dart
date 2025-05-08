import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_iq/Tab.dart';
import 'package:play_iq/service/firebase_api_service.dart';

class SignUptController extends GetxController {
  final FirebaseApiService _firebaseService = FirebaseApiService();
  final TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isPasswordHidden = true.obs;
  RxBool isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void signUp() async {
    try {
      String fullName = fullNameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        Get.snackbar("Error", "Please enter both email and password",
            snackPosition: SnackPosition.BOTTOM);
        return;
      }
      isLoading.value = true;

      final user = await _firebaseService.signUp(
        fullName: fullName,
        email: email,
        password: password,
      );

      if (user != null) {
        isLoading.value = false;

        Get.snackbar("Success", "Sign Up successful",
            snackPosition: SnackPosition.BOTTOM);
        Get.to(const Hometab());
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
      Get.snackbar("Error", "SSomething went wrong",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void googleLogin() {
    // Implement Google Sign-In logic here
    Get.snackbar("Info", "Google Sign-In clicked",
        snackPosition: SnackPosition.BOTTOM);
  }
}
