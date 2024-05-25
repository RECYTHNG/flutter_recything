import 'package:flutter/material.dart';
import 'package:recything_application/constants/app_theme_constant.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeConstant.appTheme,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: CustomTextFieldWidget(label: 'Nama', hint: 'Nama', isInputForPhone: true,),
          ),
        ),
      ),
    );
  }
}