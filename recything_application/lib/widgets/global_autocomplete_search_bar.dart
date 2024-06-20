import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:substring_highlight/substring_highlight.dart';

class GlobalAutocompleteSearchBar extends StatelessWidget {
  final List? matchedSearchData;
  final String? query;
  final String hintText;
  final Color? fillColor;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function(String)? onResultSelected;
  final double height;
  final double width;
  final Function()? handleClearedController;

  const GlobalAutocompleteSearchBar({
    super.key,
    this.matchedSearchData,
    this.query,
    required this.hintText,
    this.fillColor,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onResultSelected,
    required this.height,
    required this.width,
    this.handleClearedController,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (query != '')
          Container(
            width: width,
            height: matchedSearchData!.length > 5 ? 250 : null,
            decoration: BoxDecoration(
              color: ColorConstant.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: ColorConstant.blackColor.withOpacity(0.06),
                  offset: const Offset(0, 4),
                  blurRadius: 12,
                ),
              ],
              border: Border.all(
                color: ColorConstant.netralColor500,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox.fromSize(
                  size: Size.fromHeight(height - 1),
                ),
                ...matchedSearchData!.map((element) {
                  return Material(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    color: ColorConstant.whiteColor,
                    child: InkWell(
                      onTap: () {
                        onResultSelected!(element);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: SubstringHighlight(
                                term: query,
                                text: element.toString(),
                                textStyle:
                                    TextStyleConstant.regularParagraph.copyWith(
                                  color: ColorConstant.netralColor600,
                                ),
                                textStyleHighlight:
                                    TextStyleConstant.regularParagraph.copyWith(
                                  color: ColorConstant.netralColor900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        SizedBox(
          height: height,
          width: width,
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            style: const TextStyle(
              fontSize: 14.0,
            ),
            cursorColor: ColorConstant.blackColor,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                color: ColorConstant.netralColor600,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: ColorConstant.netralColor900,
              ),
              suffixIcon: controller?.text.isNotEmpty ?? false
                  ? IconButton(
                      onPressed: () {
                        controller?.clear();
                        handleClearedController!();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: ColorConstant.netralColor900,
                      ),
                    )
                  : null,
              filled: true,
              fillColor: fillColor ?? ColorConstant.netralColor500,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
