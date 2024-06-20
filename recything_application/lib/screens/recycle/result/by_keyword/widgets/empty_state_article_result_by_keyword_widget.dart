import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/article/article_controller.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/models/recycle/article_recycle_model.dart';
import 'package:recything_application/screens/article/article_detail/article_detail_screen.dart';
import 'package:recything_application/screens/recycle/widgets/item_article_recycle_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class EmptyStateArticleResultByKeywordWidget extends StatelessWidget {
  const EmptyStateArticleResultByKeywordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecycleController controller = Get.find();
    final ArticleController articleController = Get.put(ArticleController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchSortedArticle();
    });
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageConstant.notFound, width: 268),
            ],
          ),
          SpacingConstant.verticalSpacing075,
          Text(
            'Waduhh, pencarianmu tidak ada nih!',
            style: TextStyleConstant.boldParagraph.copyWith(
              color: ColorConstant.netralColor900,
            ),
          ),
          Text(
            'Kami tidak mendapatkan apa yang kamu maksud :(',
            style: TextStyleConstant.mediumCaption.copyWith(
              color: ColorConstant.netralColor900,
            ),
          ),
          Text(
            'Lakukan Search ulang, yuk!',
            style: TextStyleConstant.boldCaption.copyWith(
              color: ColorConstant.netralColor900,
            ),
          ),
          SpacingConstant.verticalSpacing500,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Saran Lain yang Mungkin Sesuai',
                  style: TextStyleConstant.boldSubtitle.copyWith(
                    color: ColorConstant.netralColor900,
                  ),
                ),
              ],
            ),
          ),
          SpacingConstant.verticalSpacing100,
          Obx(
            () {
              if (controller.isLoadingFetchSortedArticle.value ||
                  controller.articleSortedData.value == null) {
                return const SizedBox(
                  height: 250,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyLoading(),
                      ],
                    ),
                  ),
                );
              } else {
                final List<Article> data = controller
                    .articleSortedData.value!.data.articles
                    .take(2)
                    .toList();
                return ListView.separated(
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Divider(
                      height: 1,
                      color: Color(0XFFE6E6E6),
                    ),
                  ),
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.only(top: 0),
                  itemCount: data.length,
                  clipBehavior: Clip.none,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final article = data[index];
                    return ItemArticleRecycleWidget(
                      authorImage: article.author.imageUrl,
                      authorName: article.author.name,
                      thumbnail: article.thumbnailUrl,
                      title: article.title,
                      desc: article.description,
                      date: article.createdAt,
                      onTap: () {
                        articleController.fetchArticleById(id: article.id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ArticleDetailScreen(),
                            settings: RouteSettings(
                              arguments: article.id,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
