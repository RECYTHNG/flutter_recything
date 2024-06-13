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
  State<VideoContentScreen> createState() => _VideoContentScreenState();
}

class _VideoContentScreenState extends State<VideoContentScreen> {
  List<Widget> menuWidget = [
    Text('Semua'),
    Text('Tips'),
    Text('Tutorial'),
    Text('Kampanye'),
    Text('Daur Ulang'),
  ];

  int index = 0;
  final VideoContentController videoContentController =
      Get.put(VideoContentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 16,
            right: 16,
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.symmetric(horizontal: 5.5),
                height: 40,
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                    SpacingConstant.horizontalSpacing300,
                    const Expanded(
                      child: GlobalSearchBar(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search",
                        height: 40,
                        width: double.infinity,
                      ),
                    )
                  ],
                ),
              ),
              SpacingConstant.verticalSpacing300,
              DefaultTabController(
                initialIndex: index,
                length: 5,
                child: Container(
                  color: ColorConstant.whiteColor,
                  height: 42,
                  width: double.infinity,
                  child: TabBar(
                    labelStyle: TextStyleConstant.boldParagraph.copyWith(
                      fontSize: 16,
                    ),
                    unselectedLabelStyle: TextStyleConstant.boldParagraph
                        .copyWith(fontWeight: FontWeight.w400),
                    unselectedLabelColor: ColorConstant.netralColor900,
                    tabAlignment: TabAlignment.start,
                    labelColor: ColorConstant.secondaryColor500,
                    indicatorColor: ColorConstant.secondaryColor500,
                    dividerHeight: 0,
                    onTap: (value) {
                      setState(() {
                        index = value;
                      });
                    },
                    isScrollable: true,
                    tabs: const [
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("Semua"),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("Tips"),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("Tutorial"),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("Kampanye"),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("Daur Ulang"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SpacingConstant.verticalSpacing300,
              Expanded(child: Obx(
                () {
                  if (videoContentController.isLoading.value == true) {
                    return const Center(
                      child: MyLoading(),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Padding(
                          padding: EdgeInsets.only(
                            bottom: 16,
                            top: 7,
                          ),
                          child: Divider(
                            color: ColorConstant.netralColor500,
                          ),
                        ),
                        itemCount: videoContentController
                            .videoContentData.value!.data!.length,
                        itemBuilder: (context, index) {
                          var videoData = videoContentController
                              .videoContentData.value!.data?[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailVideoContentScreen(),
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
                                      "${videoData?.title}",
                                      style: TextStyleConstant.boldParagraph
                                          .copyWith(
                                              color:
                                                  ColorConstant.netralColor900),
                                    ),
                                    SpacingConstant.verticalSpacing100,
                                    Text(
                                      "${videoData?.viewer} ditonton",
                                      style: TextStyleConstant.regularFooter
                                          .copyWith(
                                              color:
                                                  ColorConstant.netralColor900),
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
              )),
            ],
          ),
        ),
      ),
    );
  }
}
