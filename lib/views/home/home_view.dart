import 'package:flutter/material.dart';
import '../../constants/network_constants.dart';
import '../../controllers/user_controller.dart';

import 'package:get/get.dart';


class HomeView extends StatelessWidget {
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    // Get the instance of UserController
    final UserController userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Obx(() {
        final user = userController.user.value;

        return user == null
            ? const Center(child: Text('No data!'))
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              if (user.avatar != null)

                CircleAvatar(
                  radius: 40,

                  backgroundImage: NetworkImage(
                    '${NetworkConstants.baseURL}/${user.avatar}',
                  ),

                ),
              const SizedBox(height: 16),
              Text(
                'Name: ${user.name}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                'Email: ${user.email}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        );
      }),
    );
  }
}
