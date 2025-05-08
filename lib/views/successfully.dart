import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:play_iq/Tab.dart';
import 'package:play_iq/views/login_screen.dart';
import '../app/routes.dart';
import '../core/assets.dart';
import '../core/theme.dart';

class Successfully extends StatelessWidget {
  const Successfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text('Successfully',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700)),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Your password has been updated, please change your password regularly to avoid this happening',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: SizedBox(
                  height: 150,
                  child: Image.asset(
                    Assets.changedPass,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Get.to(const Hometab());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.backgroundColor,
                    minimumSize: const Size(double.infinity, 50)),
                child: const Text('Continue',
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
                    onPressed: () => LoginScreen()),
              ),
              const SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You have not received the email?",
                      style: TextStyle(color: AppTheme.backgroundColor),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.signup);
                        },
                        child: const Text(
                          ' Resend',
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
    );
  }
}
