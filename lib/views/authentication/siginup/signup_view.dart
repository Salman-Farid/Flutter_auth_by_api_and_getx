import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karmalab_assignment/constants/color_constants.dart';
import 'package:karmalab_assignment/constants/size_constants.dart';
import 'package:karmalab_assignment/controllers/sign_up_controller.dart';
import 'package:karmalab_assignment/helper/dialog_helper.dart';
import 'package:karmalab_assignment/utils/dimension.dart';
import 'package:karmalab_assignment/views/authentication/login/login_view.dart';
import 'package:karmalab_assignment/views/authentication/siginup/widgets/sign_up_form.dart';
import 'package:karmalab_assignment/views/authentication/widget/auth_header.dart';
import 'package:karmalab_assignment/views/home/home_view.dart';
import 'package:karmalab_assignment/widgets/custom_button.dart';
import 'package:karmalab_assignment/widgets/fancy2_text.dart';
import 'package:karmalab_assignment/widgets/social_media_log.dart';

import '../../../models/user_model.dart';

class SignUpView extends StatelessWidget {
  static const routeName = '/sign-up';

  final SignUpController _signUpController = Get.put(SignUpController());
  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.defaultPadding,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => _signUpController.pickAvatarImage(),
                    child: Obx(() => _signUpController.avatarBase64.isEmpty
                        ? Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(Icons.add_a_photo),
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundImage: MemoryImage(
                                base64Decode(_signUpController.avatarBase64)),
                          )),
                  ),
                  context.spacing(height: 2),
                  const AuthHeader(
                    subTitle: "Create an account",
                    title: "Sign Up",
                  ),
                  const SizedBox(height: 25),
                  signUpForm(_signUpController),
                  const SizedBox(height: 5),
                  Obx(() {
                    return CustomButton(
                      label: "Sign Up",
                      isLoading: _signUpController.loading,
                      onTap: () async {
                        try {
                          await _signUpController.register((User? user, {String? errorMessage}) {
                            if (user != null) {
                              Get.offNamedUntil(
                                HomeView.routeName,
                                    (_) => false,
                              );
                            } else {
                              DialogHelper.showSnackBar(description: 'Register failed!!! $errorMessage ');
                            }
                          });
                        } catch (e) {
                          DialogHelper.showSnackBar(description: 'An unexpected error occurred: ${e.toString()}');
                        }
                      },
                    );
                  }),



                  // Obx(() {
                  //   return CustomButton(
                  //       label: "Sign Up",
                  //       isLoading: _signUpController.loading,
                  //       onTap: () async {
                  //         await _signUpController.register(
                  //           (status, {String? errorMessage}) async {
                  //             try {
                  //               if (status) {
                  //                 // If sign-up is successful, navigate to the login page
                  //                 await Navigator.pushNamed(
                  //                   context,
                  //                   LoginView.routeName,
                  //                 );
                  //               } else {
                  //                 // If sign-up failed, show the actual error message
                  //                 DialogHelper.showSnackBar(
                  //                   description: errorMessage ??
                  //                       'An unexpected error occurred',
                  //                 );
                  //               }
                  //             } catch (error) {
                  //               // Handle any errors that occur during the navigation or sign-up process
                  //               DialogHelper.showSnackBar(
                  //                 description:
                  //                     'An unexpected error occurred: $error',
                  //               );
                  //             }
                  //           },
                  //         );
                  //       });
                  // }),
                  const SizedBox(height: 5),
                  Fancy2Text(
                    first: "Already have an account? ",
                    second: " Login",
                    isCenter: true,
                    onTap: () => Navigator.pushNamed(
                      context,
                      LoginView.routeName,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SocialMediaAuthArea(),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
