import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_iq/Scan/RhymingGame.dart';
import 'package:play_iq/Scan/controllers/CharacterSelectioncontroller.dart';

class CharacterSelectionScreen extends StatelessWidget {
  final CharacterSelectionController controller = Get.put(CharacterSelectionController());

  final List<String> imageUrls = [
    'assets/images/elephant.png',
    'assets/images/dragon.png',
    'assets/images/phoenix.png',
    'assets/images/raptor.png',
    'assets/images/lion.png',
    'assets/images/t-rex.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.white, Color(0xFFB49EF4)],
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Get.back(),
              ),
              title: Text(
                'Add Character',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              centerTitle: true,
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => controller.selectCharacter(index),
                    child: Obx(() => ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: controller.selectedCharacterIndex.value == index
                                      ? Colors.blue.withOpacity(0.5)
                                      : Colors.white,
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10),
                                  ],
                                ),
                                child: Image.asset(
                                  imageUrls[index],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              if (index == 1 || index == 2)
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.lock, color: Colors.black, size: 20),
                                  ),
                                ),
                            ],
                          ),
                        )),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3F51B5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    _showPuzzleDialog();
                  },
                  child: Text('PLACE CHARACTER',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPuzzleDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.all(20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Solve Puzzle to Unlock\nExotic Characters",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Get.to(() => RhymingGameScreen());
                },
                child: Text("OKAY, LET'S START", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(color: Colors.indigo.shade900),
                ),
                onPressed: () {
                  Get.back();
                },
                child: Text("NO, GO BACK", style: TextStyle(color: Colors.indigo.shade900)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
