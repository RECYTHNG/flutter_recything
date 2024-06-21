import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/article_controller.dart';
import 'package:recything_application/screens/article/article_detail/widget/content_section_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

class ArticleDetailScreen extends StatefulWidget {
  const ArticleDetailScreen({super.key});

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  final ArticleController articleController = Get.put(ArticleController());
  final TextEditingController commentController = TextEditingController();
  late String articleId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    articleId = ModalRoute.of(context)!.settings.arguments as String;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      articleController.fetchArticleById(id: articleId);
    });
  }

  void _showAllComments(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        bool sortOldestFirst = true;

        return StatefulBuilder(
          builder: (context, setModalState) {
            void toggleSortOrder() {
              setModalState(() {
                sortOldestFirst = !sortOldestFirst;
              });
            }

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Wrap(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 72,
                              height: 4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: ColorConstant.netralColor600,
                              ),
                            ),
                          ],
                        ),
                        SpacingConstant.verticalSpacing200,
                        Text(
                          'Komentar',
                          style: TextStyleConstant.boldHeading3,
                        ),
                        SpacingConstant.verticalSpacing200,
                        GestureDetector(
                          onTap: toggleSortOrder,
                          child: Row(
                            children: [
                              Icon(
                                sortOldestFirst
                                    ? Icons.arrow_downward
                                    : Icons.arrow_upward,
                                color: ColorConstant.secondaryColor500,
                              ),
                              SpacingConstant.horizontalSpacing100,
                              Text(sortOldestFirst
                                  ? 'Urut Komentar Terlama'
                                  : 'Urut Komentar Terbaru'),
                            ],
                          ),
                        ),
                        SpacingConstant.verticalSpacing200,
                        if (articleController
                                .article.value.data?.comments?.isEmpty ??
                            true)
                          const Text(
                            'Belum Ada Komentar',
                            textAlign: TextAlign.center,
                          ),
                        if (!(articleController
                                .article.value.data?.comments?.isEmpty ??
                            true))
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: articleController
                                    .article.value.data?.comments?.length ??
                                0,
                            itemBuilder: (context, index) {
                              final comments = articleController
                                      .article.value.data?.comments ??
                                  [];
                              final sortedComments = List.from(comments);
                              sortedComments.sort((a, b) => sortOldestFirst
                                  ? a.createdAt!.compareTo(b.createdAt!)
                                  : b.createdAt!.compareTo(a.createdAt!));

                              final comment = sortedComments[index];
                              final createdAt = comment.createdAt!;
                              final timeAgo =
                                  timeago.format(createdAt, locale: 'en_short');

                              return ListTile(
                                leading: CircleAvatar(
                                  radius: 24,
                                  backgroundImage: NetworkImage(
                                      comment.user?.imageUrl ?? ''),
                                  child: comment.user?.imageUrl == null
                                      ? const Icon(Icons.person)
                                      : null,
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      comment.user?.name ?? '',
                                      style: TextStyleConstant.boldSubtitle,
                                    ),
                                    Text(
                                      timeAgo,
                                      style: const TextStyle(
                                        color: ColorConstant.netralColor600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Text(comment.comment ?? ''),
                              );
                            },
                          ),
                        SpacingConstant.verticalSpacing200,
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: GlobalSearchBar(
                            controller: commentController,
                            prefixIcon: const Icon(
                              Icons.person,
                              size: 28,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                articleController.postComment(
                                  id: articleId,
                                  comment: commentController.text,
                                );
                                commentController.clear();
                                articleController.fetchArticleById(
                                    id: articleId);
                                Get.back();
                              },
                              child: const Icon(
                                Icons.send,
                                size: 24,
                                color: ColorConstant.netralColor600,
                              ),
                            ),
                            height: 40,
                            width: double.infinity,
                            hintText: "Tuliskan sesuatu ..",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: Obx(() {
          if (articleController.isLoading.value) {
            return const Center(child: MyLoading());
          }

          final article = articleController.article.value.data;

          if (article == null) {
            return const Center(child: Text('Article not found'));
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back,
                          color: ColorConstant.netralColor900,
                          size: 28,
                        ),
                      ),
                      SpacingConstant.horizontalSpacing200,
                      const CircleAvatar(
                        radius: 24,
                        backgroundColor: ColorConstant.netralColor500,
                        child: Icon(Icons.person),
                      ),
                      SpacingConstant.horizontalSpacing150,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Author',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: ColorConstant.blackColor,
                              ),
                            ),
                            Text(
                              article.author?.name ?? 'Author',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: ColorConstant.blackColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SpacingConstant.verticalSpacing200,
                Image.network(
                  article.thumbnailUrl ?? '',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 48,
                        ),
                      ),
                    );
                  },
                ),
                SpacingConstant.verticalSpacing250,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title ?? 'Title',
                        style: TextStyleConstant.boldHeading3,
                      ),
                      SpacingConstant.verticalSpacing100,
                      Text(
                        article.createdAt != null
                            ? DateFormat('dd MMM yyyy').format(
                                article.createdAt!.toLocal(),
                              )
                            : '',
                        style: TextStyleConstant.mediumFooter.copyWith(
                          color: const Color(0XFF999999),
                        ),
                      ),
                      SpacingConstant.verticalSpacing300,
                      ...?article.sections?.map(
                        (section) {
                          return ContentSectionWidget(
                            title: section.title ?? "",
                            contentTexts: section.description ?? '',
                            imagePath: section.imageUrl,
                          );
                        },
                      ),
                      Row(
                        children: [
                          ...?article.contentCategories?.map((category) {
                            return Row(
                              children: [
                                Container(
                                  width: 100,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.primaryColor500,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    category.name!.capitalizeFirst!,
                                    style: TextStyleConstant.semiboldParagraph
                                        .copyWith(
                                      color: ColorConstant.whiteColor,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SpacingConstant.horizontalSpacing100,
                              ],
                            );
                          }),
                        ],
                      ),
                      SpacingConstant.verticalSpacing200,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text(
                              'Komentar',
                              style: TextStyleConstant.boldHeading4,
                            ),
                            SpacingConstant.horizontalSpacing200,
                            Text(article.comments!.length.toString()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (article.comments!.isEmpty) ...[
                              const Text(
                                'Belum Ada Komentar',
                              ),
                              SpacingConstant.verticalSpacing200,
                              GestureDetector(
                                onTap: () => _showAllComments(context),
                                child: Text(
                                  'Tambahkan Komentar',
                                  style: TextStyleConstant.boldTitle.copyWith(
                                    color: ColorConstant.infoColor500,
                                  ),
                                ),
                              ),
                            ] else ...[
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: article.comments!.length > 2
                                    ? 2
                                    : article.comments!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: const CircleAvatar(
                                      radius: 24,
                                      child: Icon(Icons.person),
                                    ),
                                    title: Text(
                                        article.comments?[index].user?.name ??
                                            ''),
                                    subtitle: Text(
                                        article.comments?[index].comment ?? ''),
                                  );
                                },
                              ),
                              if (article.comments!.length > 2) ...[
                                SpacingConstant.verticalSpacing100,
                                GestureDetector(
                                  onTap: () => _showAllComments(context),
                                  child: const Text(
                                    "Lihat Semua Komentar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: ColorConstant.infoColor500,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ],
                        ),
                      ),
                      SpacingConstant.verticalSpacing200,
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
