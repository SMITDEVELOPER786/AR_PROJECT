import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UpdatePasswordController extends GetxController {
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var isOldPasswordVisible = false.obs;
  var isNewPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  void toggleOldPasswordVisibility() {
    isOldPasswordVisible.value = !isOldPasswordVisible.value;
  }

  void toggleNewPasswordVisibility() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void updatePassword() {
    // TODO: Implement password update logic
    Get.snackbar("Success", "Password updated successfully!",
        snackPosition: SnackPosition.BOTTOM);
  }
}
