import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/video_content_controller.dart';
import 'package:recything_application/screens/video_content/detail_video_content_screen.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

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

class BackAndSearchWidget extends StatefulWidget {
  final ValueChanged<String> onSearch;
  final ValueChanged<List<String>> onSearchResults;
  final ValueChanged<String> onSearchSubmit;

  BackAndSearchWidget({
    Key? key,
    required this.onSearch,
    required this.onSearchResults,
    required this.onSearchSubmit,
  }) : super(key: key);

  @override
  _BackAndSearchWidgetState createState() => _BackAndSearchWidgetState();
}

class _BackAndSearchWidgetState extends State<BackAndSearchWidget> {
  final VideoContentController videoContentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 5.5),
      height: 40,
      width: double.infinity,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 24,
            ),
          ),
          SpacingConstant.horizontalSpacing300,
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Obx(() {
                  List<Map<String, dynamic>> idAndTitleList =
                      videoContentController.idAndTitle;
                  List<String> suggestions = idAndTitleList
                      .map((item) => item['title'] as String)
                      .toList();

                  return Autocomplete<String>(
                    fieldViewBuilder: (context, textEditingController,
                        focusNode, onFieldSubmitted) {
                      textEditingController.addListener(() {
                        String query = textEditingController.text;
                        widget.onSearch(query);
                        if (query.isEmpty) {
                          widget.onSearchResults(suggestions);
                        } else {
                          var results = suggestions.where((item) {
                            return item
                                .toLowerCase()
                                .contains(query.toLowerCase());
                          }).toList();
                          widget.onSearchResults(results);
                        }
                      });
                      return GlobalSearchBar(
                        onSubmitted: (query) {
                          widget.onSearchSubmit(query);
                          videoContentController.getSearchVideoContent(query);
                          Map<String, dynamic>? selectedItem =
                              idAndTitleList.firstWhere(
                            (item) => item['title'] == query,
                            orElse: () => {},
                          );
                          if (selectedItem.isNotEmpty) {
                            Get.to(() => DetailVideoContentScreen(
                                  id: selectedItem['id'],
                                ));
                            videoContentController
                                .getDetailVideoContent(selectedItem['id']);
                          }
                        },
                        suffixIcon: textEditingController.text.isEmpty
                            ? null
                            : IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  textEditingController.clear();
                                },
                              ),
                        hintText: "Search",
                        height: 40,
                        width: constraints.maxWidth,
                        prefixIcon: const Icon(Icons.search),
                        controller: textEditingController,
                        focusNode: focusNode,
                      );
                    },
                    optionsBuilder: (textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      } else {
                        return suggestions.where(
                          (String item) {
                            return item
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase());
                          },
                        );
                      }
                    },
                    onSelected: (String option) {
                      print("selected $option");
                    },
                    optionsViewBuilder: (context, Function(String) onSelected,
                        Iterable<String> options) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          elevation: 4.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: ColorConstant.whiteColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            width: constraints.maxWidth,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: options.length * 48.0,
                              ),
                              child: ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                shrinkWrap: true,
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final String option =
                                      options.elementAt(index);
                                  return GestureDetector(
                                    onTap: () {
                                      onSelected(option);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        option,
                                        style: TextStyleConstant
                                            .regularParagraph
                                            .copyWith(
                                          color: ColorConstant.netralColor900,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchContentWidget extends StatelessWidget {
  SearchContentWidget({super.key});
  final VideoContentController videoContentController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpacingConstant.horizontalSpacing300,
        Expanded(
          child: Obx(
            () {
              if (videoContentController.isLoading.value) {
                return const Center(
                  child: MyLoading(),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(bottom: 16, top: 7),
                      child: Divider(
                        color: ColorConstant.netralColor500,
                      ),
                    ),
                    itemCount: videoContentController
                            .searchVideoContentData.value?.data?.length ??
                        0,
                    itemBuilder: (context, index) {
                      var videoData = videoContentController
                          .searchVideoContentData.value?.data?[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailVideoContentScreen(
                                id: videoData?.id ?? 0,
                              ),
                            ),
                          );
                          videoContentController
                              .getDetailVideoContent(videoData?.id ?? 0);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 155.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: videoData?.urlThumbnail == ""
                                    ? Image.asset(
                                        "assets/images/video_content/placeholder_video_content.png",
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        "${videoData?.urlThumbnail}",
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            SpacingConstant.verticalSpacing150,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  videoData?.title ?? "Unknown title",
                                  style:
                                      TextStyleConstant.boldParagraph.copyWith(
                                    color: ColorConstant.netralColor900,
                                  ),
                                ),
                                SpacingConstant.verticalSpacing100,
                                Text(
                                  "${videoContentController.formatNumber(videoData?.viewer ?? 0)} ditonton",
                                  style:
                                      TextStyleConstant.regularFooter.copyWith(
                                    color: ColorConstant.netralColor900,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class TabBarAndContentWidget extends StatefulWidget {
  TabBarAndContentWidget({super.key});

  @override
  State<TabBarAndContentWidget> createState() => _TabBarAndContentWidgetState();
}

class _TabBarAndContentWidgetState extends State<TabBarAndContentWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: menuWidget.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<String> menuWidget = [
    'Semua',
    'Tips',
    'Tutorial',
    'Kampanye',
    'Daur Ulang',
  ];

  final VideoContentController videoContentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: menuWidget.length,
      child: Column(
        children: [
          Container(
            color: ColorConstant.whiteColor,
            height: 42,
            width: double.infinity,
            child: TabBar(
              tabAlignment: TabAlignment.start,
              controller: _tabController,
              labelStyle: TextStyleConstant.boldParagraph.copyWith(
                fontSize: 16,
              ),
              unselectedLabelStyle: TextStyleConstant.boldParagraph
                  .copyWith(fontWeight: FontWeight.w400),
              unselectedLabelColor: ColorConstant.netralColor900,
              labelColor: ColorConstant.secondaryColor500,
              indicatorColor: ColorConstant.secondaryColor500,
              isScrollable: true,
              dividerHeight: 0,
              tabs: menuWidget
                  .map(
                    (String title) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Tab(text: title),
                    ),
                  )
                  .toList(),
            ),
          ),
          SpacingConstant.verticalSpacing300,
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Obx(
                  () {
                    if (videoContentController.isLoading.value) {
                      return const Center(
                        child: MyLoading(),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Padding(
                            padding: EdgeInsets.only(bottom: 16, top: 7),
                            child: Divider(
                              color: ColorConstant.netralColor500,
                            ),
                          ),
                          itemCount: videoContentController
                                  .videoContentData.value?.data?.length ??
                              0,
                          itemBuilder: (context, index) {
                            var videoData = videoContentController
                                .videoContentData.value?.data?[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailVideoContentScreen(
                                      id: videoData?.id ?? 0,
                                    ),
                                  ),
                                );
                                videoContentController
                                    .getDetailVideoContent(videoData?.id ?? 0);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 155.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: videoData?.urlThumbnail == ""
                                          ? Image.asset(
                                              "assets/images/video_content/placeholder_video_content.png",
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              "${videoData?.urlThumbnail}",
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  SpacingConstant.verticalSpacing150,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        videoData?.title ?? "Unknown title",
                                        style: TextStyleConstant.boldParagraph
                                            .copyWith(
                                          color: ColorConstant.netralColor900,
                                        ),
                                      ),
                                      SpacingConstant.verticalSpacing100,
                                      Text(
                                        "${videoContentController.formatNumber(videoData?.viewer ?? 0)} ditonton",
                                        style: TextStyleConstant.regularFooter
                                            .copyWith(
                                          color: ColorConstant.netralColor900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
                BuildTabContent(name: "tips"),
                BuildTabContent(name: "tutorial"),
                BuildTabContent(name: "kampanye"),
                BuildTabContent(name: "daur ulang"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemListEmpty extends StatelessWidget {
  const ItemListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          children: [
            Container(
              height: 248,
              width: 280,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/video_content/not found.png",
                  ),
                ),
              ),
            ),
            Text(
              "Waduhh, pencarianmu tidak ada nih!",
              style: TextStyleConstant.boldParagraph.copyWith(
                color: ColorConstant.netralColor900,
              ),
            ),
            Text(
              "Kami tidak mendapatkan apa yang kamu maksud :(",
              textAlign: TextAlign.center,
              style: TextStyleConstant.mediumCaption.copyWith(
                color: ColorConstant.netralColor900,
              ),
            ),
            Text(
              "Lakukan Search ulang, yuk!",
              style: TextStyleConstant.boldCaption.copyWith(
                color: ColorConstant.netralColor900,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildTabContent extends StatelessWidget {
  BuildTabContent({super.key, required this.name});
  final String name;

  final VideoContentController videoContentController = Get.find();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      videoContentController.getCategoryVideoContent(name);
    });
    return Obx(
      () {
        if (videoContentController.isLoading.value) {
          return const Center(
            child: MyLoading(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(left: 8.5, right: 8.5),
            child: ListView.separated(
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(bottom: 16, top: 7),
                child: Divider(
                  color: ColorConstant.netralColor500,
                ),
              ),
              itemCount: videoContentController
                      .categoryVideoContentData.value?.data?.length ??
                  0,
              itemBuilder: (context, index) {
                var videoData = videoContentController
                    .categoryVideoContentData.value?.data?[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailVideoContentScreen(
                          id: videoData?.id ?? 0,
                        ),
                      ),
                    );
                    videoContentController
                        .getDetailVideoContent(videoData?.id ?? 0);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 155.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: videoData?.urlThumbnail == ""
                              ? Image.asset(
                                  "assets/images/video_content/placeholder_video_content.png",
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  "${videoData?.urlThumbnail}",
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      SpacingConstant.verticalSpacing150,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            videoData?.title ?? "Unknown title",
                            style: TextStyleConstant.boldParagraph.copyWith(
                              color: ColorConstant.netralColor900,
                            ),
                          ),
                          SpacingConstant.verticalSpacing100,
                          Text(
                            "${videoContentController.formatNumber(videoData?.viewer ?? 0)} ditonton",
                            style: TextStyleConstant.regularFooter.copyWith(
                              color: ColorConstant.netralColor900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
