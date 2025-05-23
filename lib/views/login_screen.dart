import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:play_iq/Home/home.dart';
import 'package:play_iq/Tab.dart';
import 'package:play_iq/core/theme.dart';
import 'package:play_iq/views/forgot_password.dart';
import 'package:play_iq/views/signup_screen.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Welcome Back",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.backgroundColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: AppTheme.backgroundColor,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text("Parents Details",
                    style: GoogleFonts.poppins(
                        color: AppTheme.backgroundColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text("Email",
                    style: GoogleFonts.poppins(
                        color: AppTheme.backgroundColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                TextField(
                  controller: controller.emailController,
                  style: const TextStyle(
                      color: Colors.black), // Text color set to black
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
                    hintStyle: const TextStyle(color: AppTheme.backgroundColor),
                  ),
                ),
                const SizedBox(height: 20),
                Text("Password",
                    style: GoogleFonts.poppins(
                        color: AppTheme.backgroundColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Obx(() => TextField(
                      style: const TextStyle(
                          color: Colors.black), // Text color set to black
                      controller: controller.passwordController,
                      obscureText: controller.isPasswordHidden.value,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Password",
                        hintStyle:
                            const TextStyle(color: AppTheme.backgroundColor),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        suffixIcon: IconButton(
                          color: AppTheme.backgroundColor,
                          icon: Icon(controller.isPasswordHidden.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      ),
                    )),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            fillColor:
                                WidgetStateProperty.resolveWith((states) {
                              if (states.contains(WidgetState.selected)) {
                                return Colors
                                    .blue; // Background color when checked
                              }
                              return AppTheme
                                  .primary; // Background color when unchecked
                            }),
                            value: false,
                            onChanged: (value) {}),
                        const Text("Remember me",
                            style: TextStyle(
                                color: Color.fromARGB(255, 153, 132, 132))),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(ForgotPassword());
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: AppTheme.backgroundColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Obx(() {
                    return SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: AppTheme.backgroundColor),
                        onPressed: () {
                          controller.login();
                        },
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator()
                            : const Text("LOGIN",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(2)),
                    width: 300,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: AppTheme.primary,
                      ),
                      icon: const Icon(
                        FontAwesomeIcons.google,
                      ),
                      label: const Text("SIGN IN WITH GOOGLE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.backgroundColor)),
                      onPressed: controller.googleLogin,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "You don’t have an account yet?",
                        style: TextStyle(color: AppTheme.backgroundColor),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(SignUpScreen());
                          },
                          child: const Text(
                            ' Sign up',
                            style: TextStyle(
                                color: AppTheme.highlightColor,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
