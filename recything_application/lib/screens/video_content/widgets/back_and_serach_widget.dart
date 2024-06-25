import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/video_content_controller.dart';
import 'package:recything_application/screens/video_content/detail_video_content_screen.dart';
import 'package:recything_application/widgets/global_search_bar.dart';
import 'package:substring_highlight/substring_highlight.dart';

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
  late TextEditingController textEditingController;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
  }

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
                    fieldViewBuilder:
                        (context, controller, node, onFieldSubmitted) {
                      textEditingController = controller;
                      focusNode = node;
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
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: ColorConstant.whiteColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            width: constraints.maxWidth,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: options.length * 48.0,
                                ),
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  shrinkWrap: true,
                                  itemCount: options.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final String option =
                                        options.elementAt(index);
                                    return GestureDetector(
                                      onTap: () {
                                        onSelected(option);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SubstringHighlight(
                                          text: option,
                                          term: textEditingController.text,
                                          textStyle: TextStyleConstant
                                              .regularParagraph
                                              .copyWith(
                                            color: ColorConstant.netralColor600,
                                          ),
                                          textStyleHighlight: TextStyleConstant
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