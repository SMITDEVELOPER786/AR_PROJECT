import 'package:flutter/material.dart';
import 'package:play_iq/Scan/AddCharacter.dart';
import 'package:play_iq/Scan/characters.dart';

class BlockDetectionScreen extends StatefulWidget {
  @override
  _BlockDetectionScreenState createState() => _BlockDetectionScreenState();
}

class _BlockDetectionScreenState extends State<BlockDetectionScreen> {
  bool blocksDetected = false;

  void detectBlocks() {
    setState(() {
      blocksDetected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
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
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
            Navigator.pop(context);

                },
              ),
            ),
          ),
          
          // Detecting Text
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
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
              onTap: detectBlocks,
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
            bottom: blocksDetected ? 100 : 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                if (blocksDetected)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Castle blocks detected!",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.photo, color: Colors.white, size: 30),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.flash_on, color: Colors.white, size: 30),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.sync, color: Colors.white, size: 30),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Proceed to AR Button
          if (blocksDetected)
            Positioned(
              bottom: 40,
              left: 50,
              right: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CharactersScreen()));
                },
                child: Text(
                  "PROCEED TO AR",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
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

    final double cornerLength = 30;

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
