import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/screens/video_content/widgets/back_and_serach_widget.dart';
import 'package:recything_application/screens/video_content/widgets/list_empty_widget.dart';
import 'package:recything_application/screens/video_content/widgets/search_content_widget.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/video_content_controller.dart';
import 'package:recything_application/screens/video_content/widgets/tab_bar_and_content_widget.dart';

class VideoContentScreen extends StatefulWidget {
  VideoContentScreen({Key? key}) : super(key: key);

  @override
  _VideoContentScreenState createState() => _VideoContentScreenState();
}

class _VideoContentScreenState extends State<VideoContentScreen> {
  final VideoContentController videoContentController =
      Get.put(VideoContentController());
  String searchQuery = '';
  List<String> searchResults = [];
  bool isSearching = false;
  bool searchSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackAndSearchWidget(
                onSearch: (query) {
                  setState(() {
                    searchQuery = query;
                    isSearching = query.isNotEmpty;
                    searchSubmitted = false;
                  });
                },
                onSearchResults: (results) {
                  setState(() {
                    searchResults = results;
                  });
                },
                onSearchSubmit: (query) {
                  setState(() {
                    searchQuery = query;
                    isSearching = query.isNotEmpty;
                    searchSubmitted = true;
                  });
                  videoContentController.getSearchVideoContent(query);
                },
              ),
              SpacingConstant.verticalSpacing300,
              Expanded(
                child: searchQuery.isEmpty
                    ? TabBarAndContentWidget()
                    : searchSubmitted && searchResults.isNotEmpty
                        ? SearchContentWidget()
                        : searchResults.isEmpty
                            ? const ItemListEmpty()
                            : TabBarAndContentWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
