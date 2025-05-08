import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_iq/Scan/controllers/puzzleCompleteController.dart';
import 'package:play_iq/Tab.dart';
import '../core/theme.dart';

class PuzzleCompletedView extends StatelessWidget {
  PuzzleCompletedController controller = Get.put(PuzzleCompletedController());

  PuzzleCompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF9735),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: 300,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        const Text(
                          "Good job",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Obx(() => Text(
                              controller.characterName.value,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black),
                            )),
                        const SizedBox(height: 15),
                        const Text(
                          "Reward",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFFF9735),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Obx(() => Image.asset(controller.characterImage.value,
                            height: 120)),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.backgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Get.offAll(() => const Hometab());
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Text(
                              "YAY, OKAY",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -110,
                    child: Image.asset(
                      'assets/images/stars.png',
                      height: 160,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
