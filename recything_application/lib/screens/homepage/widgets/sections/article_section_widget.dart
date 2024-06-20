import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/home_controller.dart';
import 'package:recything_application/screens/article/article_list_screen.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ArticleSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {
        Get.find<HomeController>().fetchData();
      },
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Artikel Terbaru',
                        style: TextStyleConstant.boldSubtitle,
                      ),
                      Text(
                        'Yuk Baca Artikel Terbaru Disini!',
                        style: TextStyleConstant.regularParagraph,
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(
                        () => const ArticleListScreen(),
                      );
                    },
                    child: Text(
                      'Lihat Semua',
                      style: TextStyleConstant.semiboldCaption.copyWith(
                        color: ColorConstant.primaryColor500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              controller.isLoading.value
                  ? const Center(
                      child:  MyLoading(),
                    )
                  : controller.articles.isEmpty
                      ? const Center(child: Text('Tidak ada artikel tersedia'))
                      : SizedBox(
                          child: SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.articles.length,
                              itemBuilder: (context, index) {
                                var article = controller.articles[index];
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 356,
                                    margin: const EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.whiteColor,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 180,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(article[
                                                                  'author_profile'] ??
                                                              ''),
                                                      radius: 12,
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      article['author_name'] ??
                                                          'Penulis Tidak Diketahui',
                                                      style: TextStyleConstant
                                                          .mediumFooter,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  article['title'] ??
                                                      'Tidak Ada Judul',
                                                  style: TextStyleConstant
                                                      .boldParagraph,
                                                  maxLines: 2,
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  article['description'] ??
                                                      'Tidak Ada Deskripsi',
                                                  style: TextStyleConstant
                                                      .mediumFooter,
                                                  maxLines: 3,
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  article['created_at'] ??
                                                      'Tanggal Tidak Diketahui',
                                                  style: TextStyleConstant
                                                      .mediumFooter,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: AspectRatio(
                                              aspectRatio: 3 / 4,
                                              child: Image.network(
                                                article['thumbnail'] ?? '',
                                                width: 148,
                                                height: 148,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
            ],
          ),
        );
      },
    );
  }
}
