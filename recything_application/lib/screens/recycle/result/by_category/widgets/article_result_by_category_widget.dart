import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/article_controller.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/models/recycle/category/article_category_recycle_model.dart';
import 'package:recything_application/screens/article/article_detail/article_detail_screen.dart';
import 'package:recything_application/screens/recycle/widgets/item_article_recycle_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ArticleResultByCategoryWidget extends StatelessWidget {
  const ArticleResultByCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecycleController controller = Get.find();
    final ArticleController articleController = Get.put(ArticleController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchArticleByCategory();
    });
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: Column(
        children: [
          SpacingConstant.verticalSpacing050,
          Expanded(
            child: Obx(
              () {
                if (controller.isLoadingFetchArticleByCategory.value ||
                    controller.resultArticleByCategory.value == null) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyLoading(),
                      ],
                    ),
                  );
                } else {
                  final List<Article> data =
                      controller.resultArticleByCategory.value!.data;
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
          ),
          SpacingConstant.verticalSpacing050,
        ],
      ),
    );
  }
}
