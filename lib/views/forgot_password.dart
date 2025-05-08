import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:play_iq/controllers/forgot_password_controller.dart';
import 'package:play_iq/views/check_email.dart';
import '../core/assets.dart';
import '../core/theme.dart';

class ForgotPassword extends StatelessWidget {
  final ForgotPasswordController controller =
      Get.put(ForgotPasswordController());
  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text('Forgot Password?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700)),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    'To reset your password, you need your email or mobile number that can be authenticated',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Center(
                  child: SizedBox(
                    height: 100,
                    child: Image.asset(
                      Assets.forgotPass,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text("Email",
                    style: GoogleFonts.poppins(
                        color: AppTheme.backgroundColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                TextField(
  style: const TextStyle(color: Colors.black), // Text color set to black
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Email',
                      hintStyle: const TextStyle(color: AppTheme.backgroundColor)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                      onPressed: (){
                        Get.to(const CheckEmail());

                      },
                  
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.backgroundColor,
                      minimumSize: const Size(double.infinity, 50)),
                  child: const Text('RESET PASSWORD',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(2)),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: AppTheme.primary,
                      ),
                      label: const Text("BACK TO LOGIN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white)),
                      onPressed: () => Get.back()
                      )
                      ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
