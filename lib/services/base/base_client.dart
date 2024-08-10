import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:karmalab_assignment/models/user_model.dart';
import '../../constants/network_constants.dart';
import 'package:karmalab_assignment/services/base/app_exceptions.dart';

class BaseClient {
  var client = http.Client();

  // GET method
  Future<dynamic> get(String api, {dynamic header}) async {
    var uri = Uri.parse(NetworkConstants.baseURL + api);
    try {
      var response = await client.get(uri, headers: header);
      _printAndSaveCookies(response); // Print and save cookies
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection", uri.toString());
    }
  }

  // POST method
  Future<dynamic> post(String api, dynamic object, {dynamic header}) async {
    var payload = jsonEncode(object);
    var uri = Uri.parse(NetworkConstants.baseURL + api);
    try {
      var response = await client.post(uri, body: payload, headers: header);
      _printAndSaveCookies(response); // Print and save cookies
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection", uri.toString());
    }
  }

  // PUT method
  Future<dynamic> put(String api, dynamic object, {dynamic header}) async {
    var payload = jsonEncode(object);
    var uri = Uri.parse(NetworkConstants.baseURL + api);
    try {
      var response = await client.put(uri, body: payload, headers: header);
      _printAndSaveCookies(response); // Print and save cookies
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection", uri.toString());
    }
  }

  // PATCH method
  Future<dynamic> patch(String api, dynamic object, {dynamic header}) async {
    var payload = jsonEncode(object);
    var uri = Uri.parse(NetworkConstants.baseURL + api);
    try {
      var response = await client.patch(uri, body: payload, headers: header);
      _printAndSaveCookies(response); // Print and save cookies
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection", uri.toString());
    }
  }

  // DELETE method
  Future<dynamic> delete(String api, {dynamic header}) async {
    var uri = Uri.parse(NetworkConstants.baseURL + api);
    try {
      var response = await client.delete(uri, headers: header);
      _printAndSaveCookies(response); // Print and save cookies
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection", uri.toString());
    }
  }

  // Process response method
  dynamic _processResponse(http.Response response) {
    var bodyBytes = utf8.decode(response.bodyBytes);
    var responseJson = json.decode(bodyBytes);
    switch (response.statusCode) {
      case 200:
        return responseJson;
      case 201:
        return responseJson;
      case 400:
        var errors = json.decode(bodyBytes)["errors"];

        throw BadRequestException(
            errors[errors.keys.elementAt(0)][0].toString(),
            response.request!.url.toString());
      case 401:
        throw InternalServerException(
            "something went wrong, code: 401", response.request?.url.toString());
      case 403:
        var errors = json.decode(bodyBytes)["errors"];

        throw UnAuthorizedException(
            errors[errors.keys.elementAt(0)][0].toString(),
            response.request?.url.toString());

      case 500:
        throw InternalServerException(
            "something went wrong, code: 500", response.request?.url.toString());
      default:
        throw FetchDataException(
            "Error occur with code : ${response.statusCode}",
            response.request!.url.toString());
    }
  }

  // Print and save cookies
  void _printAndSaveCookies(http.Response response) async {
    var setCookie = response.headers['set-cookie'];
    if (setCookie != null) {
      debugPrint("Set-Cookie Header: $setCookie"); // Print the cookies
      await _saveSessionId(setCookie);
    }
  }

  // Save session ID to shared preferences
  Future<void> _saveSessionId(String setCookie) async {
    // Extract the session ID from the set-cookie header
    var cookies = setCookie.split(';');
    for (var cookie in cookies) {
      if (cookie.startsWith('connect.sid=')) {
        // Check for the session ID cookie
        var sessionId = cookie.split('=')[1]; // Get the session ID value
        break;
      }
    }
  }
}



//
//
//
//
//
//
//
//
//
