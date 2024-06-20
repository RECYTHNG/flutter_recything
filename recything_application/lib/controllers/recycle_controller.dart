import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/models/recycle/article_recycle_model.dart';
import 'package:recything_application/models/recycle/category/article_category_recycle_model.dart';
import 'package:recything_application/models/recycle/category/video_category_recycle_model.dart';
import 'package:recything_application/models/recycle/video_recycle_model.dart';
import 'package:recything_application/screens/recycle/result/by_keyword/result_by_keyword_recycle_screen.dart';
import 'package:recything_application/services/recycle/article_recycle_service.dart';
import 'package:recything_application/services/recycle/search_by_category_recycle_service.dart';
import 'package:recything_application/services/recycle/search_by_keyword_recycle_service.dart';
import 'package:recything_application/services/recycle/video_recycle_service.dart';
import 'package:recything_application/utils/shared_pref.dart';

class RecycleController extends GetxController {
  Rxn<ArticleRecycleModel> articleDashboardData = Rxn<ArticleRecycleModel>();
  Rxn<VideoRecycleModel> videoDashboardData = Rxn<VideoRecycleModel>();
  Rxn<ArticleRecycleModel> articleSortedData = Rxn<ArticleRecycleModel>();
  Rxn<ArticleCategoryRecycleModel> resultArticleByCategory = Rxn<ArticleCategoryRecycleModel>();
  Rxn<VideoCategoryRecycleModel> resultVideoByCategory = Rxn<VideoCategoryRecycleModel>();
  RxnString selectedCategory = RxnString();
  RxBool isLoadingFetchArticle = RxBool(false);
  RxBool isLoadingFetchVideo = RxBool(false);
  RxBool isLoadingFetchArticleByCategory = RxBool(false);
  RxBool isLoadingFetchVideoByCategory = RxBool(false);
  RxBool isLoadingFetchSortedArticle = RxBool(false);
  TextEditingController searchByCategoryController = TextEditingController();
  TextEditingController searchByKeywordController = TextEditingController();
  TextEditingController resultByKeywordController = TextEditingController();
  RxnString searchKeyword = RxnString();
  RxBool isLoadingFetchArticleByKeyword = RxBool(false);
  RxBool isLoadingFetchVideoByKeyword = RxBool(false);
  Rxn<ArticleCategoryRecycleModel> resultArticleByKeyword = Rxn<ArticleCategoryRecycleModel>();
  Rxn<VideoCategoryRecycleModel> resultVideoByKeyword = Rxn<VideoCategoryRecycleModel>();
  RxList<String> searchHistory = RxList<String>([]);

  RxString searchQuery = RxString('');
  RxList<String> matchedData = RxList<String>([]);
  RxList<String> dataForSearchAutocomplete = RxList<String>([]);

  @override
  void onInit() {
    super.onInit();
    fetchArticle();
    fetchVideo();
  }

  void dataForAutocomplete() {
    List<String> article = articleDashboardData.value!.data.articles
        .map((articles) => articles.title)
        .toList();
    List<String> video =
        videoDashboardData.value!.data.map((data) => data.title).toList();
    List<String> data = [...article, ...video];
    dataForSearchAutocomplete.value = data;
  }

  void onClickMatchedResult(String title) {
    matchedData.clear();
    searchByKeywordController.text = title;
    resultByKeywordController.text = title;
  }

  void onChangedQuerySearchBar(String query) {
    searchQuery.value = query;
    if (searchQuery.value == '') {
      matchedData.clear();
    } else {
      matchedData.value = dataForSearchAutocomplete
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void onSelectedHistory(String history) {
    searchKeyword.value = history;
    resultByKeywordController.text = history;
    searchByKeywordController.clear();
    Get.to(() => const ResultByKeywordRecycleScreen());
  }

  void getSearchHistory() async {
    searchHistory.value = await SharedPref.getSearchHistory();
  }

  void deleteSearchHistory(int index) async {
    await SharedPref.deleteHistory(index);
    getSearchHistory();
  }

  void searchByRecommendation(String recommendation) async {
    searchKeyword.value = recommendation;
    resultByKeywordController.text = recommendation;
    Get.to(() => const ResultByKeywordRecycleScreen());
    await SharedPref.addHistory(recommendation);
    getSearchHistory();
  }

  void onSubmittedSearch(String keyword) async {
    resultByKeywordController.text = keyword;
    searchByKeywordController.clear();
    searchKeyword.value = keyword;
    Get.to(() => const ResultByKeywordRecycleScreen());
    await SharedPref.addHistory(keyword);
    getSearchHistory();
  }

  void onSubmittedSearchResultPage(String keyword) async {
    resultByKeywordController.text = keyword;
    searchByKeywordController.clear();
    searchKeyword.value = keyword;
    fetchArticleByKeyword();
    fetchVideoByKeyword();
    await SharedPref.addHistory(keyword);
    getSearchHistory();
  }

  Future<void> fetchArticle() async {
    isLoadingFetchArticle.value = true;
    try {
      final response = await ArticleRecycleService().getArticle();
      articleDashboardData.value = response;
    } catch (e) {
      if (kDebugMode) {
        print('Error $e');
      }
    } finally {
      isLoadingFetchArticle.value = false;
    }
  }

  Future<void> fetchSortedArticle() async {
    isLoadingFetchSortedArticle.value = true;
    try {
      final response = await ArticleRecycleService().getArticle(isSorted: true);
      articleSortedData.value = response;
    } catch (e) {
      if (kDebugMode) {
        print('Error $e');
      }
    } finally {
      isLoadingFetchSortedArticle.value = false;
    }
  }

  Future<void> fetchVideo() async {
    isLoadingFetchVideo.value = true;
    try {
      final response = await VideoRecycleService().getVideo();
      videoDashboardData.value = response;
    } catch (e) {
      if (kDebugMode) {
        print('Error $e');
      }
    } finally {
      isLoadingFetchVideo.value = false;
    }
  }

  Future<void> fetchArticleByCategory() async {
    isLoadingFetchArticleByCategory.value = true;
    try {
      final response = await SearchByCategoryRecycleService()
          .getArticleByCategory(selectedCategory.value!);
      resultArticleByCategory.value = response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoadingFetchArticleByCategory.value = false;
    }
  }

  Future<void> fetchVideoByCategory() async {
    isLoadingFetchVideoByCategory.value = true;
    try {
      final response = await SearchByCategoryRecycleService()
          .getVideoByCategory(selectedCategory.value!);
      resultVideoByCategory.value = response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoadingFetchVideoByCategory.value = false;
    }
  }

  Future<void> fetchArticleByKeyword() async {
    isLoadingFetchArticleByKeyword.value = true;
    try {
      final response = await SearchByKeywordyRecycleService()
          .getArticleByKeyword(searchKeyword.value!);
      resultArticleByKeyword.value = response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoadingFetchArticleByKeyword.value = false;
    }
  }

  Future<void> fetchVideoByKeyword() async {
    isLoadingFetchVideoByKeyword.value = true;
    try {
      final response = await SearchByKeywordyRecycleService()
          .getVideoByKeyword(searchKeyword.value!);
      resultVideoByKeyword.value = response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoadingFetchVideoByKeyword.value = false;
    }
  }
}
