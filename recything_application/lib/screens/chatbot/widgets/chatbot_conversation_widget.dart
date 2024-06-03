import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/shadow_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ChatbotConversationWidget extends StatefulWidget {
  const ChatbotConversationWidget({super.key});

  @override
  State<ChatbotConversationWidget> createState() =>
      _ChatbotConversationWidgetState();
}

class _ChatbotConversationWidgetState extends State<ChatbotConversationWidget> {
  ChatUser currentUser = ChatUser(
    id: "0",
    firstName: "Zulfan",
  );

  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "ReMin",
    profileImage:
        "https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/106/2024/03/28/202403271806-maincropped_1711537586-457414092.jpg",
  );

  List<ChatMessage> messages = [];

  void sendMessage(ChatMessage chatMessage) async {
    setState(() {
      messages.insert(0, chatMessage);
    });

    try {} catch (e) {
      print(e);
    }
  }

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
            child: DashChat(
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
                showTime: true,
                currentUserContainerColor: ColorConstant.whiteColor,
                currentUserTextColor: ColorConstant.primaryColor900,
              ),
              currentUser: currentUser,
              onSend: sendMessage,
              messages: messages,
            ),
          ),
        ),
      ],
    );
  }
}
