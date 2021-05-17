import 'package:get/get.dart';

class BaseController extends GetxController {
  String error = "";
  bool isBusy = false;

  bool get hasError => error.length != 0;

  void setBusy(bool value) {
    isBusy = value;
    update();
  }

  void setError(String value) {
    error = value;
    update();
  }

  void clearError() {
    error = "";
    update();
  }
}
