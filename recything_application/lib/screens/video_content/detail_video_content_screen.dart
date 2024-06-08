import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/video_content/widgets/komentar_widget.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

class DetailVideoContentScreen extends StatelessWidget {
  const DetailVideoContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
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
                  Text(
                    "Tips Hemat Energi: Praktik Ramah Lingkungan di Rumah",
                    style: TextStyleConstant.boldTitle
                        .copyWith(color: ColorConstant.netralColor900),
                  ),
                  SpacingConstant.verticalSpacing150,
                  const Divider(
                    color: ColorConstant.netralColor500,
                  ),
                  SpacingConstant.verticalSpacing150,
                  Text(
                    "Deskripsi",
                    style: TextStyleConstant.boldSubtitle.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  ),
                  SpacingConstant.verticalSpacing100,
                  Text(
                    "Panduan praktis tentang bagaimana memilah sampah dengan benar di rumah. Mulai dari pengenalan jenis sampah hingga teknik pemilahan yang efektif, Anda akan belajar langkah-langkah mudah untuk meminimalkan limbah dan meningkatkan praktik daur ulang di rumah Anda. Temukan tips dan trik yang berguna dalam memulai langkah-langkah kecil untuk menjaga lingkungan tetap bersih dan sehat.",
                    style: TextStyleConstant.regularParagraph.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SpacingConstant.verticalSpacing150,
                  const Divider(
                    color: ColorConstant.netralColor500,
                  ),
                  SpacingConstant.verticalSpacing075,
                  Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 10,
                    ),
                    height: 44,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text(
                          "Komentar",
                          style: TextStyleConstant.boldSubtitle.copyWith(
                            color: ColorConstant.netralColor900,
                          ),
                        ),
                        SpacingConstant.horizontalSpacing150,
                        Text(
                          "120",
                          style: TextStyleConstant.semiboldCaption.copyWith(
                            color: ColorConstant.netralColor900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SpacingConstant.verticalSpacing100,
                  const KomentarWidget(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    width: 35,
                    height: 35,
                    name: "Alfredo Schleifer",
                    kometar:
                        "ini panduan termudah dari yang pernah aku coba nih 👍 ",
                    image: AssetImage(
                        "assets/images/video_content/Ellipse 339.png"),
                  ),
                  SpacingConstant.verticalSpacing250,
                  const KomentarWidget(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    width: 35,
                    height: 35,
                    name: "Kaylynn George",
                    kometar:
                        "Video yang informatif! Sekarang saya bisa memulai praktiknya",
                    image: AssetImage(
                        "assets/images/video_content/Ellipse 339.png"),
                  ),
                  SpacingConstant.verticalSpacing200,
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        useSafeArea: true,
                        backgroundColor: ColorConstant.whiteColor,
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16,
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Container(
                                      height: 4,
                                      width: 64,
                                      decoration: BoxDecoration(
                                        color: ColorConstant.netralColor600,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Komentar",
                                  style:
                                      TextStyleConstant.boldHeading4.copyWith(
                                    color: ColorConstant.netralColor900,
                                  ),
                                ),
                                SpacingConstant.verticalSpacing200,
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/video_content/arrow_upward.png",
                                      height: 24,
                                    ),
                                    SpacingConstant.horizontalSpacing150,
                                    Text(
                                      "Urut Komentar Terbaru",
                                      style: TextStyleConstant.regularCaption
                                          .copyWith(
                                        color: ColorConstant.netralColor900,
                                      ),
                                    ),
                                  ],
                                ),
                                SpacingConstant.verticalSpacing200,
                                Flexible(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      return const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.5),
                                        child: KomentarWidget(
                                          margin: EdgeInsets.only(bottom: 20),
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          height: 45,
                                          width: 45,
                                          name: "Alfredo Schleifer",
                                          kometar:
                                              "Wah, hasilnya sungguh memuaskan, resepnya patut dicoba!",
                                          image: AssetImage(
                                              "assets/images/video_content/Ellipse 339.png"),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 16),
                                  child: GlobalSearchBar(
                                    prefixIcon: Icon(
                                      Icons.person,
                                      size: 24,
                                    ),
                                    suffixIcon: Icon(
                                      Icons.send,
                                      size: 16,
                                      color: ColorConstant.netralColor600,
                                    ),
                                    height: 40,
                                    width: double.infinity,
                                    hintText: "Tuliskan sesuatu ..",
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 19,
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Lihat Semua Komentar",
                        style: TextStyleConstant.semiboldParagraph.copyWith(
                          color: ColorConstant.infoColor500,
                        ),
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
