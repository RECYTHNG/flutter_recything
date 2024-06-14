import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/article/article_detail/widget/content_section_widget.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

class ArticleDetailScreen extends StatefulWidget {
  const ArticleDetailScreen({super.key});

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  final List<Map<String, String>> comments = [
    {
      "name": "Alfredo Schleifer",
      "comment": "ini panduan termudah dari yang pernah aku coba nih 👍"
    },
    {
      "name": "Alfredo Schleifer",
      "comment": "ini panduan termudah dari yang pernah aku coba nih 👍"
    },
    {
      "name": "Alfredo Schleifer",
      "comment": "ini panduan termudah dari yang pernah aku coba nih 👍"
    },
    {"name": "John Doe", "comment": "Great guide, really helpful!"},
    {"name": "Jane Smith", "comment": "Thanks for the tips!"},
  ];

  void _showAllComments(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SpacingConstant.verticalSpacing300,
              Text(
                'Komentar',
                style: TextStyleConstant.boldHeading3,
              ),
              SpacingConstant.verticalSpacing200,
              Row(
                children: [
                  Icon(
                    Icons.arrow_upward,
                    color: ColorConstant.secondaryColor500,
                  ),
                  SpacingConstant.horizontalSpacing150,
                  Text('Urut Komentar Terbaru'),
                ],
              ),
              SpacingConstant.verticalSpacing200,
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final comment = comments[index];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 24,
                        child: Icon(Icons.person),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            comment['name']!,
                            style: TextStyleConstant.boldSubtitle,
                          ),
                          Text(
                            '7 menit',
                            style: TextStyle(
                              color: ColorConstant.netralColor600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(comment['comment']!),
                    );
                  },
                ),
              ),
              SpacingConstant.verticalSpacing150,
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: GlobalSearchBar(
                  prefixIcon: Icon(
                    Icons.person,
                    size: 24,
                  ),
                  suffixIcon: Icon(
                    Icons.send,
                    size: 16,
                    color: ColorConstant.netralColor600,
                  ),
                  height: 40,
                  width: double.infinity,
                  hintText: "Tuliskan sesuatu ..",
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        color: ColorConstant.netralColor900,
                        size: 28,
                      ),
                    ),
                    SpacingConstant.horizontalSpacing200,
                    CircleAvatar(
                      radius: 24,
                      child: Icon(
                        Icons.person,
                      ),
                    ),
                    SpacingConstant.horizontalSpacing150,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'full name',
                          style: TextStyleConstant.mediumSubtitle,
                        ),
                        Text(
                          'Job ',
                          style: TextStyleConstant.boldTitle,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SpacingConstant.verticalSpacing200,
              Image.asset(
                'assets/images/your_image.png',
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey[300],
                    child: Center(
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 48,
                      ),
                    ),
                  );
                },
              ),
              SpacingConstant.verticalSpacing100,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: TextStyleConstant.boldHeading1,
                    ),
                    SpacingConstant.verticalSpacing100,
                    Text('8 Okt 2021'),
                    SpacingConstant.verticalSpacing300,
                    ContentSectionWidget(
                      title:
                          "Tips dan Trik Mengolah Sampah Organik dengan Tepat",
                      contentTexts: [
                        "Isu lingkungan saat ini semakin mengemuka, ya. Kamu bisa, loh menjadi bagian “penyelamat lingkungan” dengan melakukan pengolahan sampah rumah tangga dengan lebih tepat. Khususnya, kamu bisa memanfaatkan sampah rumah tangga yang kebanyakan berupa sampah organik dari limbah memasak untuk dijadikan pupuk kompos ataupun bahan pel yang ramah lingkungan",
                        "Namun, untuk bisa menghasilkan manfaat dari sampah organik rumah tersebut, tentu pengelolaannya nggak bisa sembarangan. Ada beberapa hal yang perlu kamu perhatikan dalam menyimpan sampah organik tersebut sebelum memanfaatnya."
                      ],
                      imagePath: "assets/images/your_image.png",
                    ),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: ColorConstant.primaryColor500,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Organik',
                            style: TextStyle(
                              color: ColorConstant.whiteColor,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                    SpacingConstant.verticalSpacing200,
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Text(
                                'Komentar',
                                style: TextStyleConstant.boldHeading4,
                              ),
                              SpacingConstant.horizontalSpacing200,
                              Text(comments.length.toString()),
                            ],
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: comments.length > 2 ? 2 : comments.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                radius: 24,
                                child: Icon(Icons.person),
                              ),
                              title: Text(comments[index]['name']!),
                              subtitle: Text(comments[index]['comment']!),
                            );
                          },
                        ),
                        if (comments.length > 2) ...[
                          SpacingConstant.verticalSpacing100,
                          GestureDetector(
                            onTap: () => _showAllComments(context),
                            child: Text(
                              "Lihat Semua Komentar",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: ColorConstant.infoColor500,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              SpacingConstant.verticalSpacing200,
            ],
          ),
        ),
      ),
    );
  }
}
