class VideoCategoryRecycleModel {
  int code;
  String message;
  List<Video> data;

  VideoCategoryRecycleModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory VideoCategoryRecycleModel.fromJson(Map<String, dynamic> json) {
    return VideoCategoryRecycleModel(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((item) => Video.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class Video {
  int id;
  String title;
  String description;
  String urlThumbnail;
  String linkVideo;
  int viewer;
  List<ContentCategory> contentCategories;
  List<WasteCategory> wasteCategories;

  Video({
    required this.id,
    required this.title,
    required this.description,
    required this.urlThumbnail,
    required this.linkVideo,
    required this.viewer,
    required this.contentCategories,
    required this.wasteCategories,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      urlThumbnail: json['url_thumbnail'] ?? '',
      linkVideo: json['link_video'] ?? '',
      viewer: json['viewer'] ?? 0,
      contentCategories: (json['content_categories'] as List<dynamic>?)
              ?.map((item) => ContentCategory.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      wasteCategories: (json['waste_categories'] as List<dynamic>?)
              ?.map((item) => WasteCategory.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'url_thumbnail': urlThumbnail,
      'link_video': linkVideo,
      'viewer': viewer,
      'content_categories': contentCategories.map((item) => item.toJson()).toList(),
      'waste_categories': wasteCategories.map((item) => item.toJson()).toList(),
    };
  }
}

class ContentCategory {
  int id;
  String name;

  ContentCategory({
    required this.id,
    required this.name,
  });

  factory ContentCategory.fromJson(Map<String, dynamic> json) {
    return ContentCategory(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class WasteCategory {
  int id;
  String name;

  WasteCategory({
    required this.id,
    required this.name,
  });

  factory WasteCategory.fromJson(Map<String, dynamic> json) {
    return WasteCategory(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}