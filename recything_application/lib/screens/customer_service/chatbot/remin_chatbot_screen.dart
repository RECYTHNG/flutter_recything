import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/screens/customer_service/chatbot/widgets/chatbot_conversation_widget.dart';
import 'package:recything_application/screens/customer_service/chatbot/widgets/chatbot_welcome_card_widget.dart';
import 'package:recything_application/widgets/global_app_bar.dart';

class ReMinChatbotScreen extends StatefulWidget {
  const ReMinChatbotScreen({super.key});

  @override
  State<ReMinChatbotScreen> createState() => _ReMinChatbotScreenState();
}

class _ReMinChatbotScreenState extends State<ReMinChatbotScreen> {
  bool isChatbotVisible = false;

  void _showChatbot() {
    setState(() {
      isChatbotVisible = true;
    });
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
        child: isChatbotVisible
            ? ChatbotConversationWidget()
            : ChatbotWelcomeCard(onStartChat: _showChatbot),
      ),
    );
  }
}
