import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/models/on_boarding/on_boarding_model.dart';
import 'package:recything_application/screens/on_boarding/widgets/dot_animation_widget.dart';
import 'package:recything_application/screens/welcome/welcome_screen.dart';
import 'package:recything_application/widgets/global_button_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late CarouselController _carouselController;
  int currentIndex = 0;

  @override
  void initState() {
    _carouselController = CarouselController();
    super.initState();
  }

  final List<OnBoardingModel> _onBoardingModel = [
    OnBoardingModel(
      image: ImageConstant.onBoardingImage1,
      title1: 'Jelajahi ',
      title2: 'Recything',
      description:
          'Laporkan pembuangan sampah sembarangan, dapatkan informasi tentang daur ulang, dan ikuti tantangan seru untuk hidup lebih ramah lingkungan.',
    ),
    OnBoardingModel(
      image: ImageConstant.onBoardingImage2,
      title1: 'Laporkan Penumpukan ',
      title2: 'Sampah',
      description:
          'Laporkan Penumpukan sampah sembarangan dengan mudah dan cepat di lokasi sekitar \nAnda\n',
    ),
    OnBoardingModel(
      image: ImageConstant.onBoardingImage3,
      title1: 'Temukan Informasi ',
      title2: 'Daur Ulang',
      description:
          'Pelajari cara mendaur ulang berbagai jenis sampah berupa artikel dan video dengan mudah di fitur recycle.\n',
    ),
    OnBoardingModel(
      image: ImageConstant.onBoardingImage4,
      title1: 'Ikuti ',
      title2: 'Challenge',
      description:
          'Ikuti challenge daur ulang, kumpulkan poin, bersaing dengan pengguna lain, naikkan peringkatmu, dan jadilah pahlawan \nlingkungan.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.netralColor50,
      body: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: _onBoardingModel.length,
            itemBuilder: (context, index, realIndex) {
              return Stack(
                children: [
                  Image.asset(
                    _onBoardingModel[index].image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Positioned(
                    top: 60.0,
                    right: 20.0,
                    left: 20.0,
                    child: Image.asset(
                      ImageConstant.logo,
                      width: 165.0,
                      height: 30.0,
                    ),
                  ),
                ],
              );
            },
            carouselController: _carouselController,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              aspectRatio: MediaQuery.of(context).size.aspectRatio,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: false,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: ColorConstant.primaryColor50,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SpacingConstant.verticalSpacing200,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _onBoardingModel.length,
                        (index) => DotAnimationWidget(
                          isActive: index == currentIndex,
                        ),
                      ),
                    ),
                    SpacingConstant.verticalSpacing400,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _onBoardingModel[currentIndex].title1,
                          style: TextStyleConstant.semiboldHeading4.copyWith(
                            color: ColorConstant.netralColor700,
                          ),
                        ),
                        Text(
                          _onBoardingModel[currentIndex].title2,
                          style: TextStyleConstant.semiboldHeading4.copyWith(
                            color: ColorConstant.secondaryColor500,
                          ),
                        ),
                      ],
                    ),
                    SpacingConstant.verticalSpacing300,
                    Text(
                      _onBoardingModel[currentIndex].description,
                      style: TextStyleConstant.regularSubtitle.copyWith(
                        color: ColorConstant.netralColor700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SpacingConstant.verticalSpacing400,
                    GlobalButtonWidget(
                      onTap: () {
                        if (currentIndex == _onBoardingModel.length - 1) {
                          Get.off(
                            () => const WelcomeScreen(),
                          );
                        } else {
                          _carouselController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      width: double.infinity,
                      height: 40.0,
                      backgroundColor: ColorConstant.primaryColor500,
                      title: currentIndex == _onBoardingModel.length - 1
                          ? 'Get Started'
                          : 'Next',
                      isBorder: false,
                      textColor: ColorConstant.whiteColor,
                      fontSize: 16.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
