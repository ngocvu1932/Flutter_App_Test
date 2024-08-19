import 'package:flutter_application_1/views/screens/login/data.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var currentUser = Rx<UserData?>(null);

  void setUser(UserData? user) {
    currentUser.value = user;
  }
}
