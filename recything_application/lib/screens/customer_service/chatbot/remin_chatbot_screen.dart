import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/screens/customer_service/chatbot/widgets/chatbot_conversation_widget.dart';
import 'package:recything_application/screens/customer_service/chatbot/widgets/chatbot_welcome_card_widget.dart';
import 'package:recything_application/widgets/global_app_bar.dart';
import 'package:recything_application/controllers/customer_service_remin_chatbot_controller.dart';

class ReMinChatbotScreen extends StatelessWidget {
  ReMinChatbotScreen({super.key});

  final CustomerServiceReminChatbotController controller = Get.put(CustomerServiceReminChatbotController());

  void _showChatbot() {
    controller.isChatbotVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: const GlobalAppBar(
        title: Text('ReMin AI'),
        backgroundColor: ColorConstant.whiteColor,
      ),
      body: Center(
        child: Obx(() {
          return controller.isChatbotVisible.value
              ? ChatbotConversationWidget()
              : ChatbotWelcomeCard(onStartChat: _showChatbot);
        }),
      ),
    );
  }
}
