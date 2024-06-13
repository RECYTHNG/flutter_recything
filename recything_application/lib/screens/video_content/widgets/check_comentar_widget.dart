import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:recything_application/controllers/video_content_controller.dart';

class CheckComentarWidget extends StatelessWidget {
  CheckComentarWidget(
      {super.key, required this.widgetTrue, required this.widgetFalse});
  final Widget widgetTrue;
  final Widget widgetFalse;

  final VideoContentController videoContentController =
      Get.put(VideoContentController());

  @override
  Widget build(BuildContext context) {
    var detailVideoData =
        videoContentController.detailVideoContentData.value?.data;
    return detailVideoData?.comments == null ? widgetTrue : widgetFalse;
  }
}
