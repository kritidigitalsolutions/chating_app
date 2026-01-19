import 'package:get/get.dart';

class ConvertCoinController extends GetxController {
  var selectedOption = RxnString();

  void toggle(String type) {
    selectedOption.value = type;
  }
}

class BuyCoinController extends GetxController {
  var selectedOption = RxnString();

  void toggle(String type) {
    selectedOption.value = type;
  }
}
