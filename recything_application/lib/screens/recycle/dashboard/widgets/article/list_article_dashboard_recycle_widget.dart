import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/article/article_controller.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/models/recycle/article_recycle_model.dart';
import 'package:recything_application/screens/article/article_detail/article_detail_screen.dart';
import 'package:recything_application/screens/recycle/dashboard/widgets/article/subheader_article_dashboard_recycle_widget.dart';
import 'package:recything_application/screens/recycle/widgets/item_simple_article_recycle_widget.dart';
import 'package:recything_application/utils/date_time_utils.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ListArticleDashboardRecycleWidget extends StatelessWidget {
  const ListArticleDashboardRecycleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecycleController controller = Get.find();
    final ArticleController articleController = Get.put(ArticleController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchArticle();
    });
    return Column(
      children: [
        const SubheaderArticleDashboardRecycleWidget(),
        SpacingConstant.verticalSpacing150,
        Obx(
          () {
            if (controller.isLoadingFetchArticle.value) {
              return const SizedBox(
                height: 142,
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
              final List<Article> dataToShow = controller
                  .articleDashboardData.value!.data.articles
                  .take(3)
                  .toList();
              return SizedBox(
                height: 142,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      SpacingConstant.horizontalSpacing200,
                  scrollDirection: Axis.horizontal,
                  itemCount: dataToShow.length,
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    final article = dataToShow[index];
                    return ItemSimpleArticleRecycleWidget(
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
                      authorImage: article.author.imageUrl,
                      authorName: article.author.name,
                      thumbnail: article.thumbnailUrl,
                      title: article.title,
                      desc: article.description,
                      date:
                          DateTimeUtils(dateTimeStringInput: article.createdAt)
                              .convertDate(),
                    );
                  },
                ),
              );
            }
          },
        )
      ],
    );
  }
}
