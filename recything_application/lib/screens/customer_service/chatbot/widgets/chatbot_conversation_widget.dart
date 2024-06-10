import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/shadow_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/customer_service_remin_chatbot_controller.dart';

class ChatbotConversationWidget extends StatelessWidget {
  ChatbotConversationWidget({super.key});

  final CustomerServiceReminChatbotController controller =
      Get.put(CustomerServiceReminChatbotController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: ShadowConstant.shadowLg,
          ),
          width: 324,
          height: 64,
          child: Text(
            'Saya ReMin, siap membantu Anda memahami daur ulang dan menjaga lingkungan.',
            style: TextStyleConstant.regularCaption.copyWith(
              color: ColorConstant.netralColor700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Obx(
              () => DashChat(
                inputOptions: InputOptions(
                  alwaysShowSend: true,
                  inputDecoration: InputDecoration(
                    filled: true,
                    fillColor: ColorConstant.netralColor500,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Tanyakan ReMin sesuatu ...',
                    hintStyle: TextStyleConstant.regularCaption.copyWith(
                      color: ColorConstant.netralColor600,
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                  sendButtonBuilder: (void Function() onSend) {
                    return IconButton(
                      icon: const Icon(Icons.send),
                      color: ColorConstant.netralColor700,
                      onPressed: onSend,
                    );
                  },
                ),
                messageOptions: const MessageOptions(
                  showOtherUsersName: true,
                  showOtherUsersAvatar: false,
                  showTime: true,
                  currentUserContainerColor: ColorConstant.whiteColor,
                  containerColor: ColorConstant.whiteColor,
                  currentUserTextColor: ColorConstant.primaryColor900,
                ),
                currentUser: controller.currentUser,
                onSend: controller.sendMessage,
                messages: controller.messages.toList(),
                typingUsers:
                    controller.isTyping.value ? [controller.reminUser] : [],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
