import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:karmalab_assignment/services/auth_service.dart';
import 'package:karmalab_assignment/services/base/app_exceptions.dart';

import '../models/user_model.dart';

class SignUpController extends GetxController {
  final AuthService _authService = AuthService();

  // Controllers
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformPasswordController = TextEditingController();
  final _avatarBase64 = ''.obs; // Observable for the avatar in base64 format

  final _loading = false.obs;

  var isPasswordVisible = false.obs;
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  var isConformPasswordVisible = false.obs;
  void toggleConformPasswordVisibility() {
    isConformPasswordVisible.value = !isConformPasswordVisible.value;
  }




  @override
  void dispose() {
    _nameTextController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _conformPasswordController.dispose();
    super.dispose();
  }

  TextEditingController get nameTextController => _nameTextController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get conformPasswordController => _conformPasswordController;
  bool get loading => _loading.value;
  String get avatarBase64 => _avatarBase64.value;

  bool validate() {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController.text);

    try {
      if (_nameTextController.text == "" ||
          _emailController.text == "" ||
          passwordController.text == "" ||
          _conformPasswordController.text == "" ||
          _avatarBase64.value==null
      ) {
        throw InvalidException("Please fill all the fields and upload an avatar image!", false);
      } else {
        if (emailValid) {
          if (passwordController.text.length >= 8) {
            if (passwordController.text == conformPasswordController.text) {
              return true;
            } else {
              throw InvalidException("Passwords do not match!", false);
            }
          } else {
            throw InvalidException("Password must be at least 8 characters long!", false);
          }
        } else {
          throw InvalidException("Email is not valid!", false);
        }
      }
    } catch (e) {
      throw InvalidException("Error: $e", false);
    }
  }

  Future<void> pickAvatarImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      _avatarBase64.value = base64Encode(bytes);
    } else {
      throw InvalidException("No image selected!", false);
    }
  }

  // Future<void> register(Function(bool, {String? errorMessage}) success) async {
  //   final valid = validate();
  //   if (valid) {
  //     _loading.value = true;
  //     try {
  //       await Future.delayed(const Duration(seconds: 2));
  //
  //       // Create a User object
  //       User user = User(
  //         id: '', // Placeholder, will be filled by backend
  //         name: _nameTextController.text,
  //         email: _emailController.text,
  //         password: _passwordController.text,
  //         confirmPassword: _conformPasswordController.text,
  //         avatar: "data:image/png;base64,$avatarBase64",
  //         otherPermissions: OtherPermissions(),
  //       );
  //
  //       // Register method
  //       bool status = await _authService.register(user.toJson());
  //       _loading.value = false;
  //
  //       // Invoke success callback with status and optional error message
  //       success(status, errorMessage: status ? null : 'Failed to register user.');
  //     } catch (e) {
  //       _loading.value = false;
  //
  //       // Invoke success callback with false status and the error message
  //       success(false, errorMessage: e.toString());
  //     } finally {
  //       await Future.delayed(const Duration(milliseconds: 300));
  //     }
  //   }
  // }
  //



  Future<void> register(Function(User?, {String? errorMessage})? onRegister) async {
    final valid = validate();
    if (valid) {
      _loading.value = true;
      try {
        await Future.delayed(const Duration(seconds: 2));

        // Create a User object
        User user = User(
          name: _nameTextController.text,
          email: _emailController.text,
          password: _passwordController.text,
          confirmPassword: _conformPasswordController.text,
          avatar: "data:image/png;base64,$avatarBase64",
          otherPermissions: OtherPermissions(),
        );

        // Register method
        User? registeredUser = await _authService.register(user.toJson());

        _loading.value = false;

        // Call the onRegister callback with the registered user
        if (onRegister != null) {
          onRegister(registeredUser);
        }
      } catch (e) {
        _loading.value = false;
        // Handle any errors
        if (onRegister != null) {
          onRegister(null, errorMessage: e.toString());
        }
      }
    }
  }




}
