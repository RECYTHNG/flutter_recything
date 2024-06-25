import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/map_litter_controller.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class CurrentLocationButtonMapsReportLitterWidget extends StatelessWidget {
  const CurrentLocationButtonMapsReportLitterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MapLitterController controller = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: controller.getCurrentPosition,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstant.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: ColorConstant.blackColor.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Obx(
              () {
                return Padding(
                  padding: const EdgeInsets.all(11),
                  child: controller.isGettingCurrentLocation.value == false
                      ? SvgPicture.asset(
                          IconConstant.currentLocation,
                          colorFilter: const ColorFilter.mode(
                            ColorConstant.netralColor900,
                            BlendMode.srcIn,
                          ),
                        )
                      : const MyLoading(),
                );
              },
            ),
          ),
        ),
        SpacingConstant.horizontalSpacing100,
      ],
    );
  }
}
