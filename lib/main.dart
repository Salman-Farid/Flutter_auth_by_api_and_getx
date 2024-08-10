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
// void testUserModel() {
//   // Sample JSON string
//   String jsonString = '''{
//     "avatar": {
//       "public_id": "sample_public_id",
//       "secure_url": "https://example.com/image.jpg"
//     },
//     "location": {
//       "address1": "123 Main St",
//       "address2": "Apt 4B",
//       "city": "Springfield",
//       "state": "IL",
//       "postcode": 62704,
//       "country": "USA"
//     },
//     "status": "active",
//     "_id": "user123",
//     "name": "John Doe",
//     "email": "johndoe@example.com",
//     "password": "password123",
//     "role": "user",
//     "isActive": true,
//     "isVerified": true,
//     "phone": "555-1234",
//     "gender": "male",
//     "likes": ["product1", "product2"],
//     "createdAt": "2024-08-09T00:00:00.000Z",
//     "updatedAt": "2024-08-09T00:00:00.000Z",
//     "__v": 0
//   }''';
//
//   // Parse the JSON string to a User object
//   User user = userFromJson(jsonString);
//
//   // Print the User object to verify
//   print('User Name: ${user.name}');
//   print('User Email: ${user.email}');
//   print('User Avatar URL: ${user.avatar}');
//   print('User Location: ${user.location.city}, ${user.location.country}');
// }
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
