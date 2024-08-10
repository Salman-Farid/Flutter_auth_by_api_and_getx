
import 'package:get/get.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  var user = Rxn<User>();

  void setUser(User newUser) {
    user.value = newUser;
  }
}
