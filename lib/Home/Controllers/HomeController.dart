import 'package:get/get.dart';

class HomeController extends GetxController {
  var userName = "User".obs; // Default name
  
  void updateUserName(String name) {
    userName.value = name;
  }
}
