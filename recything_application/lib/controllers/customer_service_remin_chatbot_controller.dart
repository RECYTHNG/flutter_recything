import 'package:get/get.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:recything_application/services/chatbot_services/get_remin_answer_service.dart';

class CustomerServiceReminChatbotController extends GetxController {
  RxList<ChatMessage> messages = <ChatMessage>[].obs;
  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser reminUser = ChatUser(
    id: "1",
    firstName: "ReMin",
  );

  final GetReminAnswerService reminAnswer = GetReminAnswerService();
  RxBool isTyping = false.obs;
  RxBool isChatbotVisible = false.obs;

  void sendMessage(ChatMessage chatMessage) async {
    messages.insert(0, chatMessage);
    isTyping.value = true;
    isChatbotVisible.value = true;
    try {
      final response = await reminAnswer.postQuestion(chatMessage.text);

      final reminMessage = ChatMessage(
        user: reminUser,
        text: response,
        createdAt: DateTime.now(),
      );

      messages.insert(0, reminMessage);
    } catch (e) {
      final errorMessage = ChatMessage(
        user: reminUser,
        text: 'Failed to get response from API: $e',
        createdAt: DateTime.now(),
      );
      messages.insert(0, errorMessage);
    } finally {
      isTyping.value = false;
    }
  }
}
