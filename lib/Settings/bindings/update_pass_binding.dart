import 'package:get/get.dart';
import '../controllers/update_pass_controller.dart';

class UpdatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatePasswordController>(() => UpdatePasswordController());
  }
}
