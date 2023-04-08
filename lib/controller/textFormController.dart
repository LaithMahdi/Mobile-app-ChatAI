import 'package:get/get.dart';

class TextFormController extends GetxController {
  bool isObscure = false;
  void changeObscure() {
    isObscure = !isObscure;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    isObscure = true;
    super.onInit();
  }
}
