import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/customer_service_snk_controller.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class SyaratDanKetentuanCustomerServiceScreen extends StatelessWidget {
  SyaratDanKetentuanCustomerServiceScreen({super.key});

  final CustomerServiceSnkController customerServiceSnkController = Get.put(
    CustomerServiceSnkController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        title: Text(
          'Syarat dan Ketentuan',
          style: TextStyleConstant.boldTitle.copyWith(
            fontSize: 16.0,
            color: ColorConstant.netralColor800,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: ColorConstant.whiteColor,
        centerTitle: true,
      ),
      body: Obx(
        () => customerServiceSnkController.isLoading.value
            ? const Center(
                child: MyLoading(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Html(
                    data: customerServiceSnkController.snkData.value,
                    style: {
                      'body': Style(
                        fontFamily: TextStyleConstant.regularCaption.fontFamily,
                        fontSize: FontSize(12.0),
                        color: ColorConstant.netralColor800,
                        textAlign: TextAlign.justify,
                      ),
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
