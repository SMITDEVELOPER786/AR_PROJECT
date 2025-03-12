import 'package:flutter/material.dart';
import 'package:play_iq/Scan/RhymingGame2.dart';
import 'package:play_iq/core/theme.dart';

class RhymingGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
            Navigator.pop(context);

                },
              ),
            ),
            Text(
              "Can you pick the letters that\nrhyme with 'BALL'?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/ball.png',
              width: 80,
              height: 80,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) => _buildLetterSlot()),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(angle: -0.1, child: _buildLetterBox('M')),
                SizedBox(width: 10),
                Transform.rotate(angle: 0.1, child: _buildLetterBox('H')),
                SizedBox(width: 10),
                Transform.rotate(angle: -0.1, child: _buildLetterBox('A')),
                SizedBox(width: 10),
                Transform.rotate(angle: 0.1, child: _buildLetterBox('J')),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(angle: -0.1, child: _buildLetterBox('L')),
                SizedBox(width: 10),
                Transform.rotate(angle: 0.1, child: _buildLetterBox('U')),
                SizedBox(width: 10),
                Transform.rotate(angle: -0.1, child: _buildLetterBox('L')),
                SizedBox(width: 10),
                Transform.rotate(angle: 0.1, child: _buildLetterBox('I')),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RhymingGameScreen2(),
                      ),
                    );
                  },
                  child: Text(
                    'FINISH',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLetterSlot() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 40,
      height: 5,
      color: Colors.white,
    );
  }

  Widget _buildLetterBox(String letter) {
    return Container(
      width: 55,
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFF1E56A0),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 6,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Text(
        letter,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Color(0xFFFFA500),
        ),
      ),
    );
  }
}
