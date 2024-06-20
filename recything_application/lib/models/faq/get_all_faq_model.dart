import 'dart:convert';

GetAllFaqModel getAllFaqModelFromJson(String str) =>
    GetAllFaqModel.fromJson(json.decode(str));

String getAllFaqModelToJson(GetAllFaqModel data) => json.encode(data.toJson());

class GetAllFaqModel {
  int? code;
  String? message;
  List<Datum>? data;

  GetAllFaqModel({
    this.code,
    this.message,
    this.data,
  });

  factory GetAllFaqModel.fromJson(Map<String, dynamic> json) => GetAllFaqModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? category;
  String? question;
  String? answer;

  Datum({
    this.id,
    this.category,
    this.question,
    this.answer,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        category: json["category"],
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "question": question,
        "answer": answer,
      };
}
