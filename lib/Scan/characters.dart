import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:play_iq/Scan/AddCharacter.dart'; // Ensure this file exists

class CharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD1A8E6), // Light purple background
      body: SafeArea(
        child: Column(
          children: [
            // Back Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
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
            ),
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/chracter.png',
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Add Character Button
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2D2F94), // Dark Indigo
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 14),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CharacterSelectionScreen()),
                            );
                          },
                          child: Text(
                            "+ ADD CHARACTER",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Toggle Buttons Styled as in Image
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Switch(value: false, onChanged: (value) {}),
                                      Text("Lava", style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500, color: Colors.black)),
                                      SizedBox(width: 8),
                                    ],
                                  ),
                                  Text("Toggle On/Off", style: GoogleFonts.poppins(
                                      fontSize: 12, color: Colors.grey)),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Switch(value: false, onChanged: (value) {}),
                                      Text("Water", style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500, color: Colors.black)),
                                      SizedBox(width: 8),
                                    ],
                                  ),
                                  Text("Toggle On/Off", style: GoogleFonts.poppins(
                                      fontSize: 12, color: Colors.grey)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}