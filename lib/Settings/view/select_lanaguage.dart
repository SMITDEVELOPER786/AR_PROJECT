import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_iq/Settings/view/setting_screen.dart';
import '../controllers/select_language_controller.dart';
import '../core/theme.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});
  @override
  Widget build(BuildContext context) {
    final SelectLanguageController controller =
        Get.put(SelectLanguageController());
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.white, AppTheme.bgColor])),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                   IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
            Navigator.pop(context);

                },
              ),
                SizedBox(height: 20),
                Text('Select Your Language',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.black)),
                SizedBox(height: 20),
                Obx(() => GestureDetector(
                      onTap: () => controller.updateLanguage("English"),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: controller.selectedLanguage.value == "English"
                                ? AppTheme.bgColor
                                : Colors.grey,
                          ),
                          color: controller.selectedLanguage.value == "English"
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/images/uk_flag.jpg'),
                              radius: 15,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                                child: Text("English",
                                    style: TextStyle(fontSize: 16,color: Colors.black))),
                            if (controller.selectedLanguage.value == "English")
                              Icon(Icons.check, color: Colors.black),
                          ],
                        ),
                      ),
                    )),
                SizedBox(height: 20),
                Obx(() => GestureDetector(
                      onTap: () => controller.updateLanguage("Español"),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: controller.selectedLanguage.value == "Español"
                                ? AppTheme.bgColor
                                : Colors.grey,
                          ),
                          color: controller.selectedLanguage.value == "Español"
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('Assets/images/bahasa_flag.jpg'),
                              radius: 15,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                                child: Text("Español",
                                    style: TextStyle(fontSize: 16,color: Colors.black))),
                            if (controller.selectedLanguage.value == "Español")
                              Icon(
                                Icons.check,
                                color: Colors.black,
                              )
                          ],
                        ),
                      ),
                    )),
                SizedBox(height: 20),
                Obx(() => GestureDetector(
                      onTap: () => controller.updateLanguage("Deutsch"),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: controller.selectedLanguage.value == "Deutsch"
                                ? AppTheme.bgColor
                                : Colors.grey,
                          ),
                          color: controller.selectedLanguage.value == "Deutsch"
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/images/deutsch_flag.jpg'),
                              radius: 15,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                                child: Text("Deutsch",
                                    style: TextStyle(fontSize: 16,color: Colors.black))),
                            if (controller.selectedLanguage.value == "Deutsch")
                              Icon(
                                Icons.check,
                                color: Colors.black,
                              )
                          ],
                        ),
                      ),
                    )),
                SizedBox(height: 300),
                Center(
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen()));

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple.shade900,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text("UPDATE",
                          style: TextStyle(color: Colors.white, fontSize: 16,)),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
