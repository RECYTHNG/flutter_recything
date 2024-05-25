import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/about_us/widgets/tim_content_widget.dart';
import 'package:recything_application/screens/about_us/widgets/title_and_subtitle_widget.dart';
import 'package:recything_application/widgets/global_app_bar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: const GlobalAppBar(
        title: Text(
          " About Us",
        ),
        backgroundColor: ColorConstant.whiteColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ContainedTabBarView(
              tabBarProperties: TabBarProperties(
                background: Container(
                  color: ColorConstant.whiteColor,
                ),
                labelStyle: TextStyleConstant.boldParagraph
                    .copyWith(color: ColorConstant.netralColor900),
                indicatorColor: ColorConstant.primaryColor500,
                unselectedLabelStyle: TextStyleConstant.boldParagraph.copyWith(
                  color: ColorConstant.netralColor600,
                ),
              ),
              tabs: const [
                Text("Perusahaan"),
                Text("Kenali Tim"),
                Text("Contact Us"),
              ],
              views: const [
                SingleChildScrollView(
                  child: PerusahaanContent(),
                ),
                SingleChildScrollView(
                  child: KenaliTimContent(),
                ),
                SingleChildScrollView(
                  child: ContactUsContent(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PerusahaanContent extends StatelessWidget {
  const PerusahaanContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacingConstant.verticalSpacing250,
              Text(
                "Tentang Siapa Kami",
                style: TextStyleConstant.boldSubtitle.copyWith(
                  color: ColorConstant.netralColor900,
                ),
              ),
              SizedBox(
                height: 98,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/about_us_image/logo_app.png",
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "RecyThing adalah pemimpin di industri daur ulang sampah yang berkomitmen untuk menjaga lingkungan hidup yang lebih bersih dan lebih berkelanjutan.",
                style: TextStyleConstant.mediumCaption
                    .copyWith(color: ColorConstant.netralColor900),
              ),
              SpacingConstant.verticalSpacing300,
              const TitleAndSubtitleWidget(
                  title: "Visi Kami",
                  subTitle:
                      "Menciptakan masyarakat yang sadar lingkungan di mana setiap individu berperan aktif dalam melestarikan bumi kita."),
              SpacingConstant.verticalSpacing300,
              const TitleAndSubtitleWidget(
                  title: "Komitmen Kami",
                  subTitle:
                      "Prioritaskan penggunaan teknologi terbaru dan praktik terbaik dalam proses daur ulang untuk mengurangi dampak lingkungan."),
              SpacingConstant.verticalSpacing300,
              const TitleAndSubtitleWidget(
                  title: "Pelayanan Pelanggan Unggul",
                  subTitle:
                      "Tim ahli yang berpengalaman memberikan solusi tepat dan responsif sesuai dengan kebutuhan klien."),
              SpacingConstant.verticalSpacing300,
              Text(
                "Pendidikan Masyarakat",
                style: TextStyleConstant.boldSubtitle.copyWith(
                  color: ColorConstant.netralColor900,
                ),
              ),
              SpacingConstant.verticalSpacing100,
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SizedBox(
            height: 160,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 13),
                  height: 160,
                  width: 312,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage(
                          "assets/images/about_us_image/image 1.png"),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SpacingConstant.verticalSpacing100,
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Text(
            "Berperan aktif dalam mendidik masyarakat tentang pentingnya daur ulang dan pengelolaan limbah yang berkelanjutan.",
            style: TextStyleConstant.mediumCaption
                .copyWith(color: ColorConstant.netralColor900),
          ),
        ),
        SpacingConstant.verticalSpacing200,
      ],
    );
  }
}

class KenaliTimContent extends StatelessWidget {
  const KenaliTimContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpacingConstant.verticalSpacing250,
          const TimContentWidget(
            title: "Tim Manajemen",
            subTitle:
                "Lorem ipsum dolor sit amet consectetur. Faucibus ultricies neque pellentesque tempus eros nulla ultrices laoreet. Posuere placerat cras fames egestas. Turpis odio molestie nec viverra nam justo risus. Suspendisse eget id hac diam faucibus adipiscing.",
          ),
          SpacingConstant.verticalSpacing250,
          const TimContentWidget(
            title: "Tim Manajemen",
            subTitle:
                "Lorem ipsum dolor sit amet consectetur. Faucibus ultricies neque pellentesque tempus eros nulla ultrices laoreet. Posuere placerat cras fames egestas. Turpis odio molestie nec viverra nam justo risus. Suspendisse eget id hac diam faucibus adipiscing.",
          ),
          SpacingConstant.verticalSpacing250,
          const TimContentWidget(
            title: "Tim Manajemen",
            subTitle:
                "Lorem ipsum dolor sit amet consectetur. Faucibus ultricies neque pellentesque tempus eros nulla ultrices laoreet. Posuere placerat cras fames egestas. Turpis odio molestie nec viverra nam justo risus. Suspendisse eget id hac diam faucibus adipiscing.",
          ),
          SpacingConstant.verticalSpacing200,
        ],
      ),
    );
  }
}

class ContactUsContent extends StatelessWidget {
  const ContactUsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpacingConstant.verticalSpacing250,
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Text(
            "Hubungi Kami",
            style: TextStyleConstant.boldSubtitle.copyWith(
              color: ColorConstant.netralColor900,
            ),
          ),
        ),
        SizedBox(
          height: 214,
          width: double.infinity,
          child: Image.asset(
            "assets/images/about_us_image/image 3.png",
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jika Anda memiliki pertanyaan, masukan, atau ingin bermitra dengan kami, jangan ragu untuk menghubungi tim kami. Kami siap membantu Anda dengan segala kebutuhan terkait daur ulang dan pengelolaan limbah.",
                style: TextStyleConstant.mediumCaption
                    .copyWith(color: ColorConstant.netralColor900),
              ),
              SpacingConstant.verticalSpacing250,
              const TitleAndSubtitleWidget(
                title: "Alamat Kantor",
                subTitle:
                    "[Nama Perusahaan]\n[Alamat Perusahaan]\n[Kota, Kode Pos]\n[Negara]",
              ),
              SpacingConstant.verticalSpacing250,
              const TitleAndSubtitleWidget(
                title: "Jam Operasional",
                subTitle: "Senin-Jumat: 08.00 - 17.00 WIB",
              ),
              SpacingConstant.verticalSpacing250,
              const TitleAndSubtitleWidget(
                title: "Telepon",
                subTitle: "{Nomor Telepon}",
              ),
              SpacingConstant.verticalSpacing250,
              const TitleAndSubtitleWidget(
                title: "Social Media",
                subTitle:
                    "Facebook: [Link Facebook]\nTwitter: [Link Twitter]\nInstagram: [Link Instagram]\nLinkedIn: [Link LinkedIn]",
              ),
              SpacingConstant.verticalSpacing200,
            ],
          ),
        )
      ],
    );
  }
}
