import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/models/recycle/article_recycle_model.dart';
import 'package:recything_application/screens/recycle/widgets/item_article_recycle_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ArticleCurrentSearchRecycleWidget extends StatelessWidget {
  const ArticleCurrentSearchRecycleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecycleController controller = Get.find();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchSortedArticle();
    });
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Tampilan Terkini Artikel',
                style: TextStyleConstant.boldSubtitle.copyWith(
                  color: ColorConstant.netralColor900,
                ),
              ),
            ],
          ),
        ),
        SpacingConstant.verticalSpacing150,
        Obx(
          () {
            if (controller.isLoadingFetchSortedArticle.value || controller.articleSortedData.value == null) {
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
                  .take(3)
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
                    onTap: () {},
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
