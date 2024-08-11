import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:karmalab_assignment/theme/theme.dart';
import 'package:karmalab_assignment/utils/route_util.dart';
import 'package:karmalab_assignment/views/authentication/select_auth/select_auth_view.dart';
import 'package:karmalab_assignment/views/home/home_view.dart';

import 'controllers/user_controller.dart';
import 'models/user_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Learn net',
      initialRoute: SelectAuthView.routeName,
      onGenerateRoute: RouteUtil.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
    );
  }
}
