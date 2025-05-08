import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_iq/Settings/view/setting_screen.dart';

import '../controllers/update_pass_controller.dart';
import '../core/theme.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UpdatePasswordController controller =
        Get.put(UpdatePasswordController());
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.white, AppTheme.bgColor])),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
            Navigator.pop(context);

                },
              ),
                  const SizedBox(height: 20),
                  const Text('Update Password',
                      style: TextStyle(
                          color: AppTheme.backgroundColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 20),
                  const Text("Old Password",
                      style: TextStyle(
                          color: AppTheme.backgroundColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  _buildPasswordField(
                      "Old Password",
                      controller.oldPasswordController,
                      controller.isOldPasswordVisible,
                      controller.toggleOldPasswordVisibility),
                  const SizedBox(height: 15),
                  const Text("New Password",
                      style: TextStyle(
                          color: AppTheme.backgroundColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  _buildPasswordField(
                      "New Password",
                      controller.newPasswordController,
                      controller.isNewPasswordVisible,
                      controller.toggleNewPasswordVisibility),
                  const SizedBox(height: 15),
                  const Text("Confirm Password",
                      style: TextStyle(
                          color: AppTheme.backgroundColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  _buildPasswordField(
                      "Confirm Password",
                      controller.confirmPasswordController,
                      controller.isConfirmPasswordVisible,
                      controller.toggleConfirmPasswordVisibility),
                  const SizedBox(height: 300),
                  Center(
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple.shade900,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text("UPDATE",
                            style: TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(String label, TextEditingController textController,
      RxBool isVisible, VoidCallback toggleVisibility) {
    return Obx(() => Container(
          height: 50,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: TextField(
            style: const TextStyle(color: Colors.black),
            controller: textController,
            obscureText: !isVisible.value,
            decoration: InputDecoration(
              hintText: label,
              suffixIcon: IconButton(
                icon: Icon(
                    color: Colors.grey,
                    isVisible.value ? Icons.visibility : Icons.visibility_off),
                onPressed: toggleVisibility,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ));
  }
}
