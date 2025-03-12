import 'package:get/get.dart';

class SelectLanguageController extends GetxController {
  var selectedLanguage = "English".obs;

  void updateLanguage(String language) {
    selectedLanguage.value = language;
  }

  void saveLanguage() {
    Get.snackbar("Success", "Language updated to ${selectedLanguage.value}",
        snackPosition: SnackPosition.BOTTOM);
  }
}
