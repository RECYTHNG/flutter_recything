import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class LeaderboardList extends StatelessWidget {
  final List<Map<String, String>> leaderboardList;

  const LeaderboardList({super.key, required this.leaderboardList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: leaderboardList.length,
      itemBuilder: (context, index) {
        final item = leaderboardList[index];
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListTile(
                title: Row(
                  children: [
                    Text(
                      (index + 1).toString(),
                      style: TextStyleConstant.boldParagraph.copyWith(
                        color: ColorConstant.whiteColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ColorConstant.whiteColor,
                          width: 2,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          item['picture_url'] ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey,
                              child: const Icon(
                                Icons.person,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      item['name'] ?? '',
                      style: TextStyleConstant.boldParagraph.copyWith(
                        color: ColorConstant.whiteColor,
                      ),
                    ),
                  ],
                ),
                trailing: Text(
                  item['point'] ?? '',
                  style: TextStyleConstant.boldCaption.copyWith(
                    color: ColorConstant.warningColor500,
                  ),
                ),
              ),
            ),
            const Divider(
              height: 12,
              color: ColorConstant.primaryColor300,
            ),
          ],
        );
      },
    );
  }
}
