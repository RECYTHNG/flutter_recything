import 'dart:convert';

SearchCustomerServiceModel searchCustomerServiceModelFromJson(String str) =>
    SearchCustomerServiceModel.fromJson(json.decode(str));

String searchCustomerServiceModelToJson(SearchCustomerServiceModel data) =>
    json.encode(data.toJson());

class SearchCustomerServiceModel {
  int? code;
  String? message;
  List<DatumSearch>? data;

  SearchCustomerServiceModel({
    this.code,
    this.message,
    this.data,
  });

  factory SearchCustomerServiceModel.fromJson(Map<String, dynamic> json) =>
      SearchCustomerServiceModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DatumSearch>.from(
                json["data"]!.map((x) => DatumSearch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DatumSearch {
  String? id;
  String? category;
  String? question;
  String? answer;

  DatumSearch({
    this.id,
    this.category,
    this.question,
    this.answer,
  });

  factory DatumSearch.fromJson(Map<String, dynamic> json) => DatumSearch(
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
