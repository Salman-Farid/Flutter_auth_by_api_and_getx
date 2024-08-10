import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karmalab_assignment/controllers/sign_up_controller.dart';
import 'package:karmalab_assignment/widgets/custom_input.dart';

Column signUpForm(SignUpController controller) {
  return Column(
    children: [
      CustomInputFelid(
        hint: "Business Name",
        controller: controller.nameTextController,
      ),
      CustomInputFelid(
        hint: "Email",
        controller: controller.emailController,
        keyboardType: TextInputType.emailAddress,
      ),
      Obx(() {
      return CustomInputFelid(
        hint: "Password",
        controller: controller.passwordController,
        isPassWord: true,
        secure: controller.isPasswordVisible.value,
        toggle: controller.togglePasswordVisibility,
      );}),
      Obx(() {
        return CustomInputFelid(
          hint: "Confirm Password",
          controller: controller.conformPasswordController,
          isPassWord: true,
          secure: controller.isConformPasswordVisible.value,
          lowerMargin: true,
          toggle: controller.toggleConformPasswordVisibility,
        );
      }),
    ],
  );
}
