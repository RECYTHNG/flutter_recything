import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/article_controller.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/models/recycle/category/article_category_recycle_model.dart';
import 'package:recything_application/screens/article/article_detail/article_detail_screen.dart';
import 'package:recything_application/screens/recycle/result/by_keyword/widgets/empty_state_article_result_by_keyword_widget.dart';
import 'package:recything_application/screens/recycle/widgets/item_article_recycle_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ArticleResultByKeywordWidget extends StatelessWidget {
  const ArticleResultByKeywordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecycleController controller = Get.find();
    final ArticleController articleController = Get.put(ArticleController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchArticleByKeyword();
    });
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: Column(
        children: [
          SpacingConstant.verticalSpacing050,
          Expanded(
            child: Obx(
              () {
                if (controller.isLoadingFetchArticleByKeyword.value) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyLoading(),
                      ],
                    ),
                  );
                } else if (controller
                        .resultArticleByKeyword.value?.data.isEmpty ??
                    true) {
                  return const EmptyStateArticleResultByKeywordWidget();
                } else {
                  final List<Article> data =
                      controller.resultArticleByKeyword.value!.data;
                  return ListView.separated(
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Divider(
                        height: 1,
                        color: Color(0XFFE6E6E6),
                      ),
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: data.length,
                    clipBehavior: Clip.none,
                    padding: const EdgeInsets.only(top: 0),
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
                          articleController.setId(article.id);
                          Get.to(() => const ArticleDetailScreen());
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
          SpacingConstant.verticalSpacing050,
        ],
      ),
    );
  }
}
