import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ContainerNumberOTPWidget extends StatefulWidget {
  final TextEditingController? controller;

  const ContainerNumberOTPWidget({
    super.key,
    this.controller,
  });

  @override
  State<ContainerNumberOTPWidget> createState() =>
      _ContainerNumberOTPWidgetState();
}

class _ContainerNumberOTPWidgetState extends State<ContainerNumberOTPWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 46.0,
      child: TextFormField(
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        controller: widget.controller,
        style: TextStyleConstant.semiboldTitle,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        cursorColor: ColorConstant.primaryColor500,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          hintText: '-',
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: ColorConstant.netralColor600,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: ColorConstant.primaryColor500,
            ),
          ),
        ),
      ),
    );
  }
}
