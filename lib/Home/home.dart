import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:play_iq/Scan/detectingBlocks.dart';
import 'package:play_iq/core/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAE6F2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PLAYIQ',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color:Color(0xFF2E327C)
                        ),
                      ),
                      const Text(
                        'Welcome, soroushnrz',
                        style: TextStyle(fontSize: 16,color: Colors.black),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.png'),
                    radius: 20,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                style: TextStyle(color:Colors.black),
                decoration: InputDecoration(
                  hintText: 'Search AR',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Row(
                  children: [
                    const Text(
                      'Explore ',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                     const Text(
                      ' AR',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                    color:     Color(0xFF2E327C)
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/images/home (1).png', height: 150),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dragon #001     By PlayIQ AR',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'A fierce winged beast ready to breathe fire in your AR scene!',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
               Center(
                 child: Container(
                  width: MediaQuery.of(context).size.width*0.6,
                   child: ElevatedButton(
                          onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BlockDetectionScreen()));
                          },
                      
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.backgroundColor,
                          minimumSize: Size(double.infinity, 50)),
                      child: Text('SCAN YOUR BLOCK',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                 ),
               ),
               
             
            ],
          ),
        ),
      ),
    );
  }
}
