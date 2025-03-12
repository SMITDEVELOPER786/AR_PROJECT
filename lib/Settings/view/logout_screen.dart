import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_iq/views/login_screen.dart';

import '../controllers/logout_controller.dart';

class LogOutScreen extends StatelessWidget {
  const LogOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LogoutController controller = Get.put(LogoutController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
                thickness: 3,
                indent: 100,
                endIndent: 100,
                color: Colors.black54),
            SizedBox(height: 20),
            Text(
              "Log out",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              "Are you sure you want to leave?",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade900,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text("YES",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => controller.cancelLogout(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text("CANCEL",
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
