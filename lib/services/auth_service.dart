// import 'package:flutter/rendering.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:karmalab_assignment/constants/network_constants.dart';
import 'package:karmalab_assignment/controllers/base_controller.dart';
import 'package:karmalab_assignment/helper/dialog_helper.dart';
import 'package:karmalab_assignment/services/base/base_client.dart';

import '../controllers/user_controller.dart';
import '../models/user_model.dart';

class AuthService extends BaseController {

  final BaseClient _baseClient = BaseClient();
  UserController userController = Get.find<UserController>();



  Future<User?> register(dynamic object) async {
    try {
      var response = await _baseClient.post(
        NetworkConstants.registerAPI,
        object,
        header: {'Content-Type': "application/json"},
      ).catchError(handleError);

      // Ensure result is not null and parse the response
      if (response != null && response.containsKey('data')) {
        var data = response['data'];
        print(data);
        User fetchedUser = userFromJson(jsonEncode(data));
        userController.setUser(fetchedUser);
        return fetchedUser;
      }
    } catch (e) {
      print('Error during login: $e');
    }
    return null;
  }





  Future<User?> login(dynamic object) async {
    try {
      var response = await _baseClient.post(
        NetworkConstants.loginAPI,
        object,
        header: {'Content-Type': "application/json"},
      ).catchError(handleError);

      if (response != null && response.containsKey('data')) {
        var data = response['data'];
        User fetchedUser = userFromJson(jsonEncode(data));
        userController.setUser(fetchedUser);
        return fetchedUser;
      }
    } catch (e) {
      print('Error during login: $e');
    }
    return null;
  }










// !! send otp
  Future<bool> sentOtp(dynamic object) async {
    var result = await _baseClient.post(
      NetworkConstants.forgotPassWord,
      object,
      header: {'Content-Type': "application/json"},
    ).catchError(handleError);

    if (result != null) {
      result = json.decode(result);
      debugPrint("otp send");

      DialogHelper.showSnackBar(
        description: "${result["otp"]} is your Learn net verification code.",
        duration: const Duration(seconds: 10),
          );

      return true;
    } else {
      return false;
    }
  }

  // !! send otp
  Future<bool> verifyOtp(dynamic object) async {
    // debugPrint(object.toString());
    // debugPrint(await _prefService.getToken());

    var result = await _baseClient.post(
      NetworkConstants.verifyOtp,
      object,
      header: {
        'Content-Type': "application/json",

      },
    ).catchError(handleError);

    if (result != null) {
      result = json.decode(result);
      print(result.toString());
      print("======");
      print(result["token"]);


      debugPrint("verify otp");

      return true;
    } else {
      return false;
    }
  }

  // !! send otp
  Future<bool> resetPassword(dynamic object) async {
    debugPrint("new token");
    debugPrint(object.toString());


    var result = await _baseClient.post(
      NetworkConstants.resetPassApi,
      object,
      header: {
        'Content-Type': "application/json",

      },
    ).catchError(handleError);
    debugPrint(result.toString());

    if (result != null) {
      result = json.decode(result);
      debugPrint("reset password");
      debugPrint(result.toString());

      return true;
    } else {
      return false;
    }
  }

}
