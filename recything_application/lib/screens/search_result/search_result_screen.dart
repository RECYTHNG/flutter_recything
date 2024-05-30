import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/search_result/widgets/app_bar_search_result_widget.dart';
import 'package:recything_application/screens/search_result/widgets/not_found_search_result_widget.dart';
import 'package:recything_application/screens/search_result/widgets/video_recommendation_search_result_widget.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const AppBarSearchResultWidget(),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Sesuai Pencarian...',
                      style: TextStyleConstant.boldSubtitle.copyWith(
                        color: ColorConstant.netralColor900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                TabBar(
                  labelStyle: TextStyleConstant.boldParagraph.copyWith(
                    color: ColorConstant.primaryColor900,
                  ),
                  unselectedLabelStyle:
                      TextStyleConstant.boldParagraph.copyWith(
                    color: ColorConstant.netralColor600,
                  ),
                  indicatorColor: ColorConstant.primaryColor500,
                  indicatorWeight: 4,
                  tabs: const [
                    Tab(text: 'Artikel'),
                    Tab(text: 'Video'),
                  ],
                ),
                const NotFoundSearchResultWidget(),
                const SizedBox(height: 30),
                // ArticleRecommendationSearchResultWidget(),
                const VideoRecommendationSearchResultWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
