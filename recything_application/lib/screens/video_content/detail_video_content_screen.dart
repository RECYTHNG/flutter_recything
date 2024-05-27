import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/video_content/widgets/button_widget.dart';
import 'package:recything_application/screens/video_content/widgets/judul_dan_opsi_widget.dart';

class DetailVideoContentScreen extends StatelessWidget {
  const DetailVideoContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              color: ColorConstant.blackColor,
              child: Image.asset(
                "assets/images/video_content/Cards Video.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const JudulDanOpsiWidget(
                    title: "Cara Mudah Memilah Sampah di Rumah",
                    subTitle: "11 rb ditonton",
                  ),
                  SpacingConstant.verticalSpacing200,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonWidget(
                        imageAsset: "assets/images/video_content/thumb_up.png",
                        text: "5 Ribu",
                      ),
                      ButtonWidget(
                        imageAsset: "assets/images/video_content/share.png",
                        text: "Bagikan",
                      ),
                      ButtonWidget(
                        imageAsset:
                            "assets/images/video_content/file_download.png",
                        text: "Unduh",
                      ),
                    ],
                  ),
                  SpacingConstant.verticalSpacing200,
                  Text(
                    "Deskripsi",
                    style: TextStyleConstant.boldParagraph.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  ),
                  SpacingConstant.verticalSpacing100,
                  Text(
                    "Panduan praktis tentang bagaimana memilah sampah dengan benar di rumah. Mulai dari pengenalan jenis sampah hingga teknik pemilahan yang efektif, Anda akan belajar langkah-langkah mudah untuk meminimalkan limbah dan meningkatkan praktik daur ulang di rumah Anda. Temukan tips dan trik yang berguna dalam memulai langkah-langkah kecil untuk menjaga lingkungan tetap bersih dan sehat.",
                    style: TextStyleConstant.semiboldCaption.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  ),
                  SpacingConstant.verticalSpacing300,
                  Text(
                    "Segmen",
                    style: TextStyleConstant.boldParagraph.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  ),
                  SpacingConstant.verticalSpacing100,
                  SizedBox(
                    height: 63,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(right: 11),
                        height: 63.5,
                        width: 113,
                        decoration: BoxDecoration(
                          color: ColorConstant.blackColor,
                          borderRadius: BorderRadius.circular(4),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/images/video_content/Cards Video 3.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SpacingConstant.verticalSpacing300,
                  Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 10,
                    ),
                    height: 44,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Komentar",
                              style: TextStyleConstant.boldParagraph.copyWith(
                                color: ColorConstant.netralColor900,
                              ),
                            ),
                            SpacingConstant.horizontalSpacing150,
                            Text(
                              "120",
                              style: TextStyleConstant.regularCaption.copyWith(
                                color: ColorConstant.netralColor600,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Terbaru",
                              style: TextStyleConstant.regularCaption.copyWith(
                                color: ColorConstant.netralColor600,
                              ),
                            ),
                            SpacingConstant.horizontalSpacing050,
                            SizedBox(
                              height: 16,
                              width: 16,
                              child: Image.asset(
                                  "assets/images/video_content/sort-descending.png"),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 2,
                      right: 2,
                      top: 2,
                    ),
                    child: Container(
                      alignment: Alignment.topLeft,
                      height: 63,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/video_content/Ellipse 339.png"),
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SpacingConstant.horizontalSpacing250,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Alfredo Schleifer",
                                style:
                                    TextStyleConstant.semiboldCaption.copyWith(
                                  color: ColorConstant.netralColor900,
                                ),
                              ),
                              Text(
                                "ini panduan termudah dari yang pernah aku coba nih 👍 ",
                                style: TextStyleConstant.regularFooter.copyWith(
                                  color: ColorConstant.netralColor900,
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/video_content/thumb_up_white.png",
                                    height: 14,
                                  ),
                                  SpacingConstant.horizontalSpacing200,
                                  Image.asset(
                                    "assets/images/video_content/thumb_down.png",
                                    height: 14,
                                  ),
                                  SpacingConstant.horizontalSpacing200,
                                  Image.asset(
                                    "assets/images/video_content/chat.png",
                                    height: 14,
                                  ),
                                  SpacingConstant.horizontalSpacing200,
                                  Image.asset(
                                    "assets/images/video_content/emoji_flags.png",
                                    height: 14,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
