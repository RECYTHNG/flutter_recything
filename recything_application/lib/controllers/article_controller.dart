import 'package:get/get.dart';
import 'package:recything_application/models/article/article_model.dart';
import 'package:recything_application/models/article/list_article_model.dart';
import 'package:recything_application/services/article/article_service.dart';

class ArticleController extends GetxController {
  var articles = ListArticleModel().obs;
  var article = ArticleModel().obs;
  var queryResults = <String>[].obs;
  var isLoading = false.obs;
  String keyword = '';
  String id = '';

  final ArticleService _articleService = ArticleService();

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }

  void fetchArticles() async {
    isLoading.value = true;
    articles.value = await _articleService.getAllArticles(keyword: keyword);
    isLoading.value = false;
  }

  void setKeyword(String newKeyword) {
    if (newKeyword == 'Semua') {
      keyword = '';
    } else {
      keyword = newKeyword;
    }
    fetchArticles();
  }

  void setId(String newId) {
    id = newId;
  }

  void fetchArticleById({required String id}) async {
    isLoading.value = true;
    var fetchedArticle = await _articleService.getArticleById(id: id);
    article.value = fetchedArticle;
    isLoading.value = false;
  }

  void postComment({required String id, required String comment}) async {
    try {
      var response = await _articleService.postComment(
        id: id,
        comment: comment,
      );
      print("Response: ${response['message']}");
    } catch (e) {
      print("Error updating user profile: $e");
    }
  }

  void getqueryResults(String query) async {
    var data = await _articleService.getAllArticles(keyword: query);
    queryResults.value = data.data
            ?.where((article) =>
                article.title?.toLowerCase().contains(query.toLowerCase()) ??
                false)
            .map((article) => article.title ?? '')
            .toList() ??
        [];
  }
}
