import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:recything_application/env/env.dart';
import 'package:recything_application/utils/shared_pref.dart';

class PostImageProofService {
  var baseUrl = Env.recythingBaseUrl;
  final Dio dio = Dio();

  Future<void> uploadFiles(
      String taskId, List<String> imagePaths, String description, String statusAccept) async {
    var url = '$baseUrl/user-current/tasks/$taskId';

    FormData formData = FormData();
    formData.fields
        .add(MapEntry('json_data', jsonEncode({'description': description})));

    for (var path in imagePaths) {
      String fileName = path.split('/').last;
      formData.files.add(
        MapEntry(
          'images',
          await MultipartFile.fromFile(path,
              filename: fileName, contentType: MediaType("image", "jpeg")),
        ),
      );
    }

    if (kDebugMode) {
      print(formData);
    }

    try {
      String? authToken = await SharedPref.getToken();
      if (authToken == null) {
        throw Exception('Tidak ada token yang ditemukan');
      }

      Options options = Options(
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $authToken',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'multipart/form-data',
        },
      );

      Response response;

      if (statusAccept == 'rejected') {
        response = await dio.put(url, data: formData, options: options);
      } else {
        response = await dio.post(url, data: formData, options: options);
      }

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Upload successful');
        }
        if (kDebugMode) {
          print(response.data);
        }
        return response.data;
      } else {
        if (kDebugMode) {
          print('Upload failed with status: ${response.statusCode}');
        }
        if (kDebugMode) {
          print('Response data: ${response.data}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred: $e');
      }
    }
  }
}
