class ArticleCategoryRecycleModel {
  final int code;
  final String message;
  final List<Article> data;

  ArticleCategoryRecycleModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ArticleCategoryRecycleModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List<dynamic>? ?? [];
    List<Article> articleList = dataList.map((i) => Article.fromJson(i)).toList();

    return ArticleCategoryRecycleModel(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      data: articleList,
    );
  }
}

class Article {
  final String id;
  final Author author;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String createdAt;
  final List<Category> wasteCategories;
  final List<Category> contentCategories;
  final List<dynamic> sections;
  final List<dynamic> comments;

  Article({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.createdAt,
    required this.wasteCategories,
    required this.contentCategories,
    required this.sections,
    required this.comments,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    var wasteCategoriesList = json['waste_categories'] as List<dynamic>? ?? [];
    var contentCategoriesList = json['content_categories'] as List<dynamic>? ?? [];

    return Article(
      id: json['id'] ?? '',
      author: Author.fromJson(json['author'] ?? {}),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      thumbnailUrl: json['thumbnail_url'] ?? '',
      createdAt: json['created_at'] ?? '',
      wasteCategories: wasteCategoriesList.map((i) => Category.fromJson(i)).toList(),
      contentCategories: contentCategoriesList.map((i) => Category.fromJson(i)).toList(),
      sections: json['sections'] ?? [],
      comments: json['comments'] ?? [],
    );
  }
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