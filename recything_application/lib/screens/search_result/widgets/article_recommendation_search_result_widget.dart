import 'package:flutter/material.dart';
import 'package:recything_application/screens/search/widgets/tampilan_terkini_artikel/item_artikel_search_widget.dart';
import 'package:recything_application/screens/search_result/widgets/global_simple_subheader_widget.dart';

class ArticleRecommendationSearchResultWidget extends StatelessWidget {
  const ArticleRecommendationSearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GlobalSimpleSubheaderWidget(title: 'Saran Lain yang Mungkin Sesuai'),
        SizedBox(height: 5),
        ItemArtikelSearchWidget(),
      ],
    );
  }
}
