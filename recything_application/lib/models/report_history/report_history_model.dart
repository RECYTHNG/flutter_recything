class ReportHistoryModel {
  final String id;
  final String authorId;
  final String reportType;
  final String title;
  final String description;
  final String wasteType;
  final double latitude;
  final double longitude;
  final String address;
  final String city;
  final String province;
  final String status;
  final List<WasteMaterial> wasteMaterials;
  final dynamic reportImages;
  final String? createdAt;

  ReportHistoryModel({
    required this.id,
    required this.authorId,
    required this.reportType,
    required this.title,
    required this.description,
    required this.wasteType,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.city,
    required this.province,
    required this.status,
    required this.wasteMaterials,
    required this.reportImages,
    required this.createdAt,
  });


  factory ReportHistoryModel.fromJson(Map<String, dynamic> json) {
    return ReportHistoryModel(
      id: json["id"] ?? "",
      authorId: json["author_id"] ?? "",
      reportType: json["report_type"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      wasteType: json["waste_type"] ?? "",
      latitude: json["latitude"] ?? 0.0,
      longitude: json["longitude"] ?? 0.0,
      address: json["address"] ?? "",
      city: json["city"] ?? "",
      province: json["province"] ?? "",
      status: json["status"] ?? "",
      wasteMaterials: json["waste_materials"] == null
          ? []
          : List<WasteMaterial>.from(
              json["waste_materials"]!.map((x) => WasteMaterial.fromJson(x))),
      reportImages: json["report_images"],
      createdAt: json["created_at"] ?? "",
    );
  }
}

class WasteMaterial {
  WasteMaterial({
    required this.id,
    required this.type,
  });

  final String id;
  final String type;

  factory WasteMaterial.fromJson(Map<String, dynamic> json) {
    return WasteMaterial(
      id: json["id"] ?? "",
      type: json["type"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
      };
}
