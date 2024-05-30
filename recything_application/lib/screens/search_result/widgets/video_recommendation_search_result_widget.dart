import 'package:flutter/material.dart';
import 'package:recything_application/screens/search/widgets/tampilan_terkini_video/item_video_search_widget.dart';
import 'package:recything_application/screens/search_result/widgets/global_simple_subheader_widget.dart';

class VideoRecommendationSearchResultWidget extends StatelessWidget {
  const VideoRecommendationSearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GlobalSimpleSubheaderWidget(title: 'Saran Lain yang Mungkin Sesuai'),
        SizedBox(height: 10),
        ItemVideoSearchWidget(),
      ],
    );
  }
}