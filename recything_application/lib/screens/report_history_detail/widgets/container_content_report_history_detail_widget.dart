import 'package:flutter/widgets.dart';
import 'package:recything_application/constants/color_constant.dart';

class ContainerContentReportHistoryDetailWidget extends StatelessWidget {
  final Widget widget;
  const ContainerContentReportHistoryDetailWidget({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConstant.netralColor50,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            blurRadius: 13,
            color: ColorConstant.blackColor.withOpacity(0.15),
          ),
        ],
      ),
      child: widget,
    );
  }
}