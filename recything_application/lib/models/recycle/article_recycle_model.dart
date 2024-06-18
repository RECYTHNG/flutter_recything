class ArticleRecycleModel {
  final int code;
  final String message;
  final Data data;

  ArticleRecycleModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ArticleRecycleModel.fromJson(Map<String, dynamic> json) {
    return ArticleRecycleModel(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      data: Data.fromJson(json['data'] ?? {}),
    );
  }
}

class Data {
  final int total;
  final int page;
  final int limit;
  final List<Article> articles;

  Data({
    required this.total,
    required this.page,
    required this.limit,
    required this.articles,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['articles'] as List<dynamic>? ?? [];
    List<Article> articleList = list.map((i) => Article.fromJson(i)).toList();

    return Data(
      total: json['total'] ?? 0,
      page: json['page'] ?? 0,
      limit: json['limit'] ?? 0,
      articles: articleList,
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
