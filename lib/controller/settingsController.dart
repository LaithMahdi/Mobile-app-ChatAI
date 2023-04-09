import 'package:get/get.dart';

class SettingsController extends GetxController {
  bool isChange = false;
  void changeSwtich() {
    isChange = !isChange;
    update();
  }
}
