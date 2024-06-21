import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/utils/date_time_utils.dart';

class ItemArticleRecycleWidget extends StatelessWidget {
  final String authorName;
  final String authorImage;
  final String title;
  final String desc;
  final String date;
  final String thumbnail;
  final Function() onTap;
  const ItemArticleRecycleWidget({
    super.key,
    required this.authorName,
    required this.authorImage,
    required this.title,
    required this.desc,
    required this.date,
    required this.thumbnail,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: 142,
        decoration: const BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
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
                          DateTimeUtils(dateTimeStringInput: date)
                              .convertDate(),
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
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: double.infinity,
                            height: 200,
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 48,
                              ),
                            ),
                          );
                        },
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
