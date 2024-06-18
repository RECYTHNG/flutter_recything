import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:recything_application/env/env.dart';

class PostImageProofService {
  var baseUrl = Env.recythingBaseUrl;
  final Dio _dio = Dio();

  Future<void> uploadFiles(
      String taskId, List<String> imagePaths, String description) async {
    var url = '$baseUrl/user-current/tasks/$taskId';

    FormData formData = FormData();
    formData.fields
        .add(MapEntry('json_data', jsonEncode({'description': description})));

    for (var path in imagePaths) {
      String fileName = path.split('/').last;
      print(fileName);
      formData.files.add(
        MapEntry(
          'images',
          await MultipartFile.fromFile(path,
              filename: fileName, contentType: MediaType("image", "jpeg")),
        ),
      );
    }

    print(formData);

    try {
      var response = await _dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader:
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVVNSMDAzNCIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIxMzA1ODMwfQ.ZQJ-KErnUGP8R8F2RWY6YYhRpCpkpx1T1AWwuY0JHls',
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Upload successful');
      } else {
        print('Upload failed with status: ${response.statusCode}');
        print('Response data: ${response.data}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
