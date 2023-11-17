import 'package:get/get.dart';

class HomeController extends GetxController {
  int s = 0;
  void getScreen()  {
    s++;
    update();
  }
}
