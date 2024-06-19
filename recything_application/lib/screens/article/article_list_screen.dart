import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/article/article_controller.dart';
import 'package:recything_application/controllers/article/article_search_controller.dart';
import 'package:recything_application/screens/article/article_detail/article_detail_screen.dart';
import 'package:recything_application/screens/article/article_search/article_search_screen.dart';
import 'package:recything_application/screens/article/widget/article_app_bar_search_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';
import 'package:recything_application/models/article/list_article_model.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({super.key});

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  List<String> menuWidget = [
    'Semua',
    'Tips',
    'Tutorial',
    'Kampanye',
    'Daur Ulang',
  ];

  int index = 0;
  final ArticleController articleController = Get.put(ArticleController());
  final TextEditingController searchController = TextEditingController();

  final ArticleSearchController articleSearchController = Get.put(
    ArticleSearchController(),
  );

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
                  DefaultTabController(
                    initialIndex: index,
                    length: menuWidget.length,
                    child: Container(
                      color: ColorConstant.whiteColor,
                      height: 42,
                      width: double.infinity,
                      child: TabBar(
                        labelStyle: TextStyleConstant.boldParagraph.copyWith(
                          fontSize: 16,
                        ),
                        unselectedLabelStyle: TextStyleConstant.boldParagraph
                            .copyWith(fontWeight: FontWeight.w400),
                        unselectedLabelColor: ColorConstant.netralColor900,
                        tabAlignment: TabAlignment.start,
                        labelColor: ColorConstant.secondaryColor500,
                        indicatorColor: ColorConstant.secondaryColor500,
                        dividerHeight: 0,
                        onTap: (value) {
                          setState(() {
                            index = value;
                            articleController.setKeyword(menuWidget[index]);
                          });
                        },
                        isScrollable: true,
                        tabs: menuWidget
                            .map((e) => Tab(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(e),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ArticleDetailScreen(),
                                      settings: RouteSettings(
                                        arguments: article.id,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    bottom: 32,
                                    top: 20,
                                    right: 16,
                                    left: 16,
                                  ),
                                  height: 180,
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
                                                Text(article.author!.name ??
                                                    'Unknown'),
                                              ],
                                            ),
                                            SpacingConstant.verticalSpacing100,
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
                                            SpacingConstant.verticalSpacing100,
                                            Text(
                                              article.description ?? '',
                                              style: TextStyleConstant
                                                  .regularParagraph
                                                  .copyWith(
                                                color: ColorConstant
                                                    .netralColor900,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            Text(
                                              article.createdAt != null
                                                  ? article.createdAt!
                                                      .toString()
                                                  : '',
                                              style: TextStyleConstant
                                                  .regularFooter
                                                  .copyWith(
                                                color: ColorConstant
                                                    .netralColor900,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SpacingConstant.horizontalSpacing200,
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          decoration: const BoxDecoration(
                                            color: ColorConstant.netralColor500,
                                          ),
                                          child: article.thumbnailUrl != null &&
                                                  article
                                                      .thumbnailUrl!.isNotEmpty
                                              ? Image.network(
                                                  article.thumbnailUrl!)
                                              : const Icon(
                                                  Icons
                                                      .image_not_supported_outlined,
                                                  size: 40,
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
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ArticleSearchScreen(),
                            settings: RouteSettings(
                              arguments: value,
                            ),
                          ),
                        );
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
