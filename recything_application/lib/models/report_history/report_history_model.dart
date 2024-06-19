class ReportHistoryModel {
  final int code;
  final String message;
  final List<Report> data;

  ReportHistoryModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ReportHistoryModel.fromJson(Map<String, dynamic> json) {
    return ReportHistoryModel(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((item) => Report.fromJson(item))
          .toList(),
    );
  }
}

class Report {
  final String id;
  final Author author;
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
  final String reason;
  final List<WasteMaterial> wasteMaterials;
  final List<String> reportImages;
  final String createdAt;

  Report({
    required this.id,
    required this.author,
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
    required this.reason,
    required this.wasteMaterials,
    required this.reportImages,
    required this.createdAt,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id'] ?? '',
      author: Author.fromJson(json['author'] ?? {}),
      reportType: json['report_type'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      wasteType: json['waste_type'] ?? '',
      latitude: (json['latitude'] ?? 0.0).toDouble(),
      longitude: (json['longitude'] ?? 0.0).toDouble(),
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      province: json['province'] ?? '',
      status: json['status'] ?? '',
      reason: json['reason'] ?? '',
      wasteMaterials: (json['waste_materials'] as List<dynamic>? ?? [])
          .map((item) => WasteMaterial.fromJson(item))
          .toList(),
      reportImages: List<String>.from(json['report_images'] ?? []),
      createdAt: json['created_at'] ?? '',
    );
  }

  get data => null;
}

class Author {
  final String id;
  final String name;
  final String imageUrl;

  Author({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }
}

class WasteMaterial {
  final String id;
  final String type;

  WasteMaterial({
    required this.id,
    required this.type,
  });

  factory WasteMaterial.fromJson(Map<String, dynamic> json) {
    return WasteMaterial(
      id: json['id'] ?? '',
      type: json['type'] ?? '',
    );
  }
}
