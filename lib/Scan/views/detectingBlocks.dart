import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_iq/Scan/controllers/BlockDetectionController.dart'; // Controller ka path sahi rakhein
import 'package:play_iq/Scan/views/characters.dart';

class BlockDetectionScreen extends StatelessWidget {
  BlockDetectionController controller = Get.put(BlockDetectionController());

  BlockDetectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.purple.shade700],
              ),
            ),
          ),

          // Back Button
          Positioned(
            top: 40,
            left: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade800,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Get.back(),
              ),
            ),
          ),

          // Detecting Text
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 80.0),
              child: Text(
                "Detecting Blocks...",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          // Scanner Frame
          Center(
            child: GestureDetector(
              onTap: controller.detectBlocks,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: CustomPaint(
                      painter: ScannerFramePainter(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Icons
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Obx(() => controller.blocksDetected.value
                    ? const Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Castle blocks detected!",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : const SizedBox.shrink()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.photo,
                          color: Colors.white, size: 30),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.flash_on,
                          color: Colors.white, size: 30),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.sync, color: Colors.white, size: 30),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Proceed to AR Button
          Obx(() => controller.blocksDetected.value
              ? Positioned(
                  bottom: 40,
                  left: 50,
                  right: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () => Get.to(() => CharactersScreen()),
                    child: const Text(
                      "PROCEED TO AR",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                )
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}

class ScannerFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const double cornerLength = 30;

    Path path = Path()
      ..moveTo(0, cornerLength)
      ..lineTo(0, 0)
      ..lineTo(cornerLength, 0)
      ..moveTo(size.width - cornerLength, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, cornerLength)
      ..moveTo(size.width, size.height - cornerLength)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - cornerLength, size.height)
      ..moveTo(cornerLength, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, size.height - cornerLength);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
