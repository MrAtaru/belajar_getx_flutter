import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  final count = 10.obs;

  void increment() {
    if (count >= 20) {
      Get.snackbar('STOPP', 'UDAH STOPP KELEBIHAN COY');
    } else {
      count.value ++;
    }
  }

  void decrement() {
    if (count <= 1) {
      Get.snackbar('STOP', "TERLALU SEDIKIT NTAR");
    } else {
      count.value--;
    }
  }
}
