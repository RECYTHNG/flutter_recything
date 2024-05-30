import 'package:flutter/material.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/screens/search/widgets/app_bar_search_widget.dart';
import 'package:recything_application/screens/search/widgets/pencarian_terkini/item_pencarian_terkini_search_widget.dart';
import 'package:recything_application/screens/search/widgets/pencarian_terkini/subheader_pencarian_terkini_search_widget.dart';
import 'package:recything_application/screens/search/widgets/tampilan_terkini_artikel/item_artikel_search_widget.dart';
import 'package:recything_application/screens/search/widgets/tampilan_terkini_artikel/subheader_tampilan_terkini_artikel_search_widget.dart';
import 'package:recything_application/screens/search/widgets/tampilan_terkini_video/item_video_search_widget.dart';
import 'package:recything_application/screens/search/widgets/tampilan_terkini_video/subheader_tampilan_terkini_video_search_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 0,
            child: Image.asset(
              ImageConstant.vectorBackgroundSearch,
              width: 300,
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppBarSearchWidget(),
                    SizedBox(height: 17),
                    SubHeaderPencarianTerkiniSearchWidget(),
                    SizedBox(height: 5),
                    ItemPencarianTerkiniSearchWidget(),
                    SizedBox(height: 12),
                    SubheaderTampilanTerkiniVideoSearchWidget(),
                    SizedBox(height: 7),
                    ItemVideoSearchWidget(),
                    SizedBox(height: 20),
                    SubheaderTampilanTerkiniArtikelSearchWidget(),
                    SizedBox(height: 7),
                    ItemArtikelSearchWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}