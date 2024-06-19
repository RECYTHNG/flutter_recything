import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ItemSimpleArticleRecycleWidget extends StatelessWidget {
  final String authorImage;
  final String authorName;
  final String thumbnail;
  final String title;
  final String desc;
  final String date;
  final Function() onTap;
  const ItemSimpleArticleRecycleWidget({
    super.key,
    required this.authorImage,
    required this.authorName,
    required this.thumbnail,
    required this.title,
    required this.desc,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 375,
        height: 142,
        decoration: BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: const Color(0XFF64646F).withOpacity(0.2),
              offset: const Offset(0, 7),
              blurRadius: 29,
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  authorImage,
                                ),
                              ),
                            ),
                            SpacingConstant.horizontalSpacing100,
                            Expanded(
                              child: Text(
                                authorName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyleConstant.mediumFooter.copyWith(
                                  color: ColorConstant.blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SpacingConstant.verticalSpacing200,
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleConstant.boldParagraph.copyWith(
                            color: ColorConstant.blackColor,
                          ),
                        ),
                        SpacingConstant.verticalSpacing100,
                        Text(
                          desc,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleConstant.mediumFooter.copyWith(
                            color: const Color(0XFF4D4D4D),
                          ),
                        ),
                        SpacingConstant.verticalSpacing075,
                        Text(
                          date,
                          style: TextStyleConstant.mediumFooter.copyWith(
                            color: const Color(0XFF999999),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SpacingConstant.horizontalSpacing100,
                  SizedBox(
                    width: 164,
                    height: 124,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
