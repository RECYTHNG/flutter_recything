import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/video_content_controller.dart';
import 'package:recything_application/screens/video_content/detail_video_content_screen.dart';
import 'package:recything_application/screens/video_content/widgets/build_tab_content_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

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
                fontFamily: 'Nunito',
              ),
              unselectedLabelStyle: TextStyleConstant.boldParagraph.copyWith(
                fontWeight: FontWeight.w400,
                fontFamily: 'Nunito',
              ),
              unselectedLabelColor: ColorConstant.netralColor900,
              labelColor: ColorConstant.secondaryColor500,
              indicatorColor: ColorConstant.secondaryColor500,
              isScrollable: true,
              dividerHeight: 0,
              tabs: menuWidget
                  .map(
                    (String title) => Padding(
                      padding: const EdgeInsets.all(9),
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
                                Get.to(DetailVideoContentScreen(
                                  id: videoData?.id ?? 0,
                                ));
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
