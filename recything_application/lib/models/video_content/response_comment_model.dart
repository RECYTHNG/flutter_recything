// To parse this JSON data, do
//
//     final responsePostCommentModel = responsePostCommentModelFromJson(jsonString);

import 'dart:convert';

ResponsePostCommentModel responsePostCommentModelFromJson(String str) =>
    ResponsePostCommentModel.fromJson(json.decode(str));

String responsePostCommentModelToJson(ResponsePostCommentModel data) =>
    json.encode(data.toJson());

class ResponsePostCommentModel {
  int? code;
  String? message;

  ResponsePostCommentModel({
    this.code,
    this.message,
  });

  factory ResponsePostCommentModel.fromJson(Map<String, dynamic> json) =>
      ResponsePostCommentModel(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
