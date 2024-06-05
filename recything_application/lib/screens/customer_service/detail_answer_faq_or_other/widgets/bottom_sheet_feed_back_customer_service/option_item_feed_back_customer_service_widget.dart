import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class FeedBackOptionCustomerServiceWidget extends StatefulWidget {
  final String caption;
  final VoidCallback handleDissatisfied;
  const FeedBackOptionCustomerServiceWidget({
    super.key,
    required this.handleDissatisfied,
    required this.caption,
  });

  @override
  State<FeedBackOptionCustomerServiceWidget> createState() =>
      _FeedBackOptionCustomerServiceWidgetState();
}

class _FeedBackOptionCustomerServiceWidgetState
    extends State<FeedBackOptionCustomerServiceWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        Navigator.pop(context);
        widget.handleDissatisfied();
      },
      child: Container(
        height: 46.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected
              ? ColorConstant.netralColor500
              : ColorConstant.whiteColor,
          borderRadius: isSelected
              ? BorderRadius.circular(10.0)
              : BorderRadius.circular(0.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Text(
            widget.caption,
            style: TextStyleConstant.regularCaption.copyWith(
              fontSize: 12.0,
              color: ColorConstant.netralColor900,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
