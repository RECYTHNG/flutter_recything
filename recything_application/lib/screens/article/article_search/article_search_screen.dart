import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/article_controller.dart';
import 'package:recything_application/controllers/article_search_controller.dart';
import 'package:recything_application/models/article/list_article_model.dart';
import 'package:recything_application/screens/article/article_detail/article_detail_screen.dart';
import 'package:recything_application/screens/article/widget/article_app_bar_search_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ArticleSearchScreen extends StatefulWidget {
  const ArticleSearchScreen({super.key});

  @override
  State<ArticleSearchScreen> createState() => _ArticleSearchScreenState();
}

class _ArticleSearchScreenState extends State<ArticleSearchScreen> {
  final ArticleController articleController = Get.find();
  final TextEditingController searchController = TextEditingController();

  final ArticleSearchController articleSearchController = Get.find();

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      articleController.fetchArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    articleSearchController.searchController.value.addListener(
      () {
        articleSearchController.onSearchChanged(
            articleSearchController.searchController.value.text);
      },
    );
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80.0,
                  ),
                  SpacingConstant.verticalSpacing300,
                  Expanded(
                    child: Obx(
                      () {
                        if (articleController.isLoading.value) {
                          return const Center(
                            child: MyLoading(),
                          );
                        } else if (articleController
                                .articles.value.data?.isEmpty ??
                            true) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 32.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(ImageConstant.notFound),
                                Text(
                                  'Waduhh, pencarianmu tidak ada nih!',
                                  style: TextStyleConstant.boldTitle,
                                ),
                                Text(
                                  'Kami tidak mendapatkan apa yang kamu maksud :(',
                                  style: TextStyleConstant.regularParagraph,
                                ),
                                Text(
                                  'Lakukan Search ulang, yuk!',
                                  style: TextStyleConstant.boldSubtitle,
                                ),
                              ],
                            ),
                          );
                        } else {
                          return ListView.builder(
                            itemCount:
                                articleController.articles.value.data?.length ??
                                    0,
                            itemBuilder: (context, index) {
                              Data article =
                                  articleController.articles.value.data![index];
                              return GestureDetector(
                                onTap: () {
                                  articleController.setId(article.id ?? '');
                                  Get.to(const ArticleDetailScreen());
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    bottom: 32,
                                    top: 20,
                                    right: 16,
                                    left: 16,
                                  ),
                                  height: 200,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: ColorConstant.netralColor600,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const CircleAvatar(
                                                  radius: 12,
                                                  child: Icon(Icons.person),
                                                ),
                                                SpacingConstant
                                                    .horizontalSpacing100,
                                                Text(
                                                    article.author!.name ??
                                                        'Unknown',
                                                    style: TextStyleConstant
                                                        .regularParagraph),
                                              ],
                                            ),
                                            SpacingConstant.verticalSpacing100,
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    articleController.keyword,
                                                    style: TextStyleConstant
                                                        .boldSubtitle
                                                        .copyWith(
                                                      color: ColorConstant
                                                          .secondaryColor500,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                                SpacingConstant
                                                    .horizontalSpacing100,
                                                Container(
                                                  width: 4,
                                                  height: 4,
                                                  decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .netralColor600,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                  ),
                                                ),
                                                SpacingConstant
                                                    .horizontalSpacing100,
                                                Text(
                                                  article.createdAt != null
                                                      ? timeago.format(
                                                          article.createdAt!)
                                                      : '',
                                                  style: TextStyleConstant
                                                      .semiboldFooter
                                                      .copyWith(
                                                    color: ColorConstant
                                                        .netralColor900,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SpacingConstant.verticalSpacing050,
                                            Text(
                                              article.title ?? '',
                                              style: TextStyleConstant
                                                  .boldSubtitle
                                                  .copyWith(
                                                color: ColorConstant
                                                    .netralColor900,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                            Text(
                                              article.description ?? '',
                                              style: TextStyleConstant
                                                  .regularParagraph
                                                  .copyWith(
                                                color: ColorConstant
                                                    .netralColor900,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SpacingConstant.horizontalSpacing200,
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                            height: double.infinity,
                                            decoration: const BoxDecoration(
                                              color:
                                                  ColorConstant.netralColor500,
                                            ),
                                            child:
                                                article.thumbnailUrl != null &&
                                                        article.thumbnailUrl!
                                                            .isNotEmpty
                                                    ? Image.network(
                                                        article.thumbnailUrl!)
                                                    : const Icon(
                                                        Icons
                                                            .image_not_supported_outlined,
                                                        size: 40,
                                                      ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ArticleAppBarSearchWidget(
                    articleSearchController: articleSearchController,
                    articleController: articleController,
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        articleController.setKeyword(value);
                      } else {
                        Get.snackbar(
                          '',
                          '',
                          padding: const EdgeInsets.all(0),
                          margin: const EdgeInsets.all(12),
                          snackStyle: SnackStyle.FLOATING,
                          backgroundColor: Colors.transparent,
                          barBlur: 0.0,
                          overlayBlur: 0.0,
                          snackPosition: SnackPosition.BOTTOM,
                          messageText: AwesomeSnackbarContent(
                            title: 'Gagal',
                            message: 'Tidak Boleh Kosong',
                            contentType: ContentType.failure,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
