import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:play_iq/service/firebase_api_service.dart';

class HomeController extends GetxController {
  final FirebaseApiService _firebaseService = FirebaseApiService();

  var userName = "User".obs; // Default name

  void updateUserName(String name) {
    userName.value = name;
  }

  void getCurretUser() {
    User? user = _firebaseService.getCurrentUser();
    updateUserName(user?.email ?? "");
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   getCurretUser();
  // }
}
