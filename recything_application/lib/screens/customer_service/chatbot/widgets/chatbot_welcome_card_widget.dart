import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/shadow_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/widgets/global_button_widget.dart';

class ChatbotWelcomeCard extends StatelessWidget {
  final VoidCallback onStartChat;

  const ChatbotWelcomeCard({required this.onStartChat, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      height: 256,
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: ShadowConstant.shadowLg,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Halo, Senang melihat Anda di sini! Dengan menekan tombol "Mulai Obrolan" Anda setuju untuk memproses data pribadi Anda seperti yang dijelaskan dalam Kebijakan Privasi kami.',
              style: TextStyleConstant.regularParagraph,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            GlobalButtonWidget(
              onTap: onStartChat,
              width: 182,
              height: 40,
              backgroundColor: ColorConstant.primaryColor500,
              isBorder: false,
              title: 'Mulai Obrolan',
              textColor: ColorConstant.whiteColor,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
