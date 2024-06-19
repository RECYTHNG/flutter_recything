class VideoRecycleModel {
  final int code;
  final String message;
  final List<Video> data;

  VideoRecycleModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory VideoRecycleModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List<dynamic>? ?? [];
    List<Video> articleList = list.map((e) => Video.fromJson(e)).toList();

    return VideoRecycleModel(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      data: articleList,
    );
  }
}

class Video {
  final int id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String videoUrl;
  final int viewer;
  final List<Category> contentCategories;
  final List<Category> wasteCategories;

  Video({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.viewer,
    required this.contentCategories,
    required this.wasteCategories,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    var contentCategoriesList = json['content_categories'] as List<dynamic>? ?? [];
    var wasteCategoriesList = json['waste_categories'] as List<dynamic>? ?? [];

    return Video(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      thumbnailUrl: json['url_thumbnail'] ?? '',
      videoUrl: json['link_video'] ?? '',
      viewer: json['viewer'] ?? 0,
      contentCategories: contentCategoriesList.map((e) => Category.fromJson(e)).toList(),
      wasteCategories: wasteCategoriesList.map((e) => Category.fromJson(e)).toList(),
    );
  }
}

class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}
