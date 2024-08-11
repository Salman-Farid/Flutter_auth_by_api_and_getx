import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../services/base/app_exceptions.dart';

class ImageController extends GetxController {
  final _imageBase64 = ''.obs;
  final _fileExtension = ''.obs;
  final _encodedImage = ''.obs;

  String get imageBase64 => _imageBase64.value;
  String get fileExtension => _fileExtension.value;
  String get encodedImage => _encodedImage.value;

  Future<void> imagePickerAndBase64Conversion() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);


    if (pickedFile != null) {
      final filePath = pickedFile.path;
      _fileExtension.value = filePath.split('.').last.toLowerCase(); // File extension

      final file = File(filePath);
      final fileSize = await file.length(); // Get file size in bytes

      // Check if file size is greater than 2 MB (2 * 1024 * 1024 bytes)
      if (fileSize > 2 * 1024 * 1024) throw InvalidException("File size exceeds 2 MB! Please select a smaller image.", false);
      final bytes = await file.readAsBytes();
      _encodedImage.value = base64Encode(bytes);
      // Correctly construct the imageBase64 string
      _imageBase64.value = "data:image/${_fileExtension.value};base64,${_encodedImage.value}";
      print(_imageBase64.value );
    } else {
      throw Exception("No image selected!");
    }
  }
}



// Future<void> pickAvatarImage() async {
//   final picker = ImagePicker();
//   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//   if (pickedFile != null) {
//     final filePath = pickedFile.path;
//     final fileExtension = filePath.split('.').last.toLowerCase();
//     type.value = fileExtension; // Ensure no dot
//
//     final file = File(filePath);
//     final fileSize = await file.length(); // Get file size in bytes
//
//     // Check if file size is greater than 2 MB (2 * 1024 * 1024 bytes)
//     if (fileSize > 2 * 1024 * 1024) throw InvalidException("File size exceeds 2 MB! Please select a smaller image.", false);
//     final bytes = await file.readAsBytes();
//     _avatarBase64.value = base64Encode(bytes);
//   }
//   else {
//     throw InvalidException("No image selected!", false);
//   }
// }

