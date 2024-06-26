import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/profile/widget/appbar_widget.dart';
import 'package:recything_application/screens/profile/widget/image_widget.dart';
import 'package:recything_application/screens/profile/widget/profile_widget.dart';

void main() {
  group('Profile Feature Test ->', () {
    testWidgets('Profile screen harus dapat menampilkan AppbarWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppbarWidget(),
          ),
        ),
      );
      expect(find.text('Profil Pengguna'), findsOneWidget);
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Text &&
              widget.style ==
                  TextStyleConstant.boldSubtitle.copyWith(
                    color: ColorConstant.netralColor900,
                    fontFamily: 'Nunito',
                  ),
        ),
        findsOneWidget,
      );
    });
    testWidgets('Profile screen harus dapat menampilkan ProfileWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: ProfileWidget(),
          ),
        ),
      );
      expect(find.byType(ImageWidget), findsOneWidget);
      expect(find.byType(GestureDetector), findsWidgets);
      expect(find.text('Lengkapi Profil'), findsOneWidget);
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Text &&
              widget.style ==
                  TextStyleConstant.boldCaption.copyWith(
                    color: ColorConstant.infoColor500,
                  ),
        ),
        findsOneWidget,
      );
    });
  });
}