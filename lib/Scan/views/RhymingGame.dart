import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:play_iq/Scan/RhymingGame2.dart';
import 'package:play_iq/Scan/controllers/GamingRhymeController.dart';
import 'package:play_iq/Scan/views/RhymingGame2.dart';
import 'package:play_iq/core/theme.dart';

class RhymingGameScreen extends StatelessWidget {
  RhymingGameController controller = Get.put(RhymingGameController());

  RhymingGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFB49EF4)],
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Get.back(),
              ),
            ),
            const Text(
              "Can you pick the letters that\nrhyme with 'BALL'?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/ball.png',
              width: 80,
              height: 80,
            ),
            const SizedBox(height: 20),

            // Selected Letter Slots
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) => _buildLetterSlot(
                        index < controller.selectedLetters.length
                            ? controller.selectedLetters[index]
                            : ''),
                  ),
                )),

            const SizedBox(height: 30),

            // Letter Boxes
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLetterBox('M'),
                    const SizedBox(width: 10),
                    _buildLetterBox('H'),
                    const SizedBox(width: 10),
                    _buildLetterBox('A'),
                    const SizedBox(width: 10),
                    _buildLetterBox('J'),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLetterBox('L'),
                    const SizedBox(width: 10),
                    _buildLetterBox('U'),
                    const SizedBox(width: 10),
                    _buildLetterBox('L'),
                    const SizedBox(width: 10),
                    _buildLetterBox('I'),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Reset & Finish Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: controller.resetSelection,
                  child: const Text(
                    'RESET',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => RhymingGameScreen2());
                  },
                  child: const Text(
                    'FINISH',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLetterSlot(String letter) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        letter,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildLetterBox(String letter) {
    return GestureDetector(
      onTap: () => controller.selectLetter(letter),
      child: Container(
        width: 55,
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF1E56A0),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 6,
              offset: Offset(3, 3),
            ),
          ],
        ),
        child: Text(
          letter,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFA500),
          ),
        ),
      ),
    );
  }
}
