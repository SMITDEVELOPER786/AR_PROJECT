import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_iq/Settings/view/logout_screen.dart';
import 'package:play_iq/Settings/view/select_lanaguage.dart';
import 'package:play_iq/Settings/view/update_password.dart';
import '../controllers/setting_controller.dart';


class SettingScreen extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());

  SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              SizedBox(height: 20),

              _buildAudioTile(),
              SizedBox(height: 20),

              _buildAnimationSettings(),
              SizedBox(height: 20),

              _buildSettingsTile(
                icon: Icons.lock,
                title: 'Change Password',
                onTap: () => Get.to(() => UpdatePasswordScreen()), // Navigate
              ),
              SizedBox(height: 20),

              _buildSettingsTile(
                icon: Icons.language,
                title: 'Language',
                subtitle: 'English',
                onTap: () => Get.to(() => SelectLanguage()), // Navigate
              ),
              SizedBox(height: 20),

              _buildSettingsTile(
                icon: Icons.logout,
                title: 'Logout',
                onTap: () => Get.to(() => LogOutScreen()), // Navigate
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAudioTile() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.mic, color: Colors.black),
              SizedBox(width: 10),
              Text('Audio', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black)),
            ],
          ),
          Obx(() => Switch(
                activeTrackColor: Colors.blue,
                value: controller.isAudioEnabled.value,
                onChanged: (value) => controller.isAudioEnabled.value = value,
              )),
        ],
      ),
    );
  }

  Widget _buildAnimationSettings() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Animation Settings',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          SizedBox(height: 10),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      height: 6,
                      decoration: BoxDecoration(
                        color: controller.animationSpeed.value >= (index + 1) * 20 ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  );
                }),
              )),
        ],
      ),
    );
  }

  Widget _buildSettingsTile({required IconData icon, required String title, String? subtitle, required VoidCallback onTap}) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title, style: TextStyle(color: Colors.black)),
        subtitle: subtitle != null ? Text(subtitle, style: TextStyle(color: Colors.black)) : null,
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
        onTap: onTap,
      ),
    );
  }
}
