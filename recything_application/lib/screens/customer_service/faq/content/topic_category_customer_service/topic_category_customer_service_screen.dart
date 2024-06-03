import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/models/faq/category_faq_model.dart';
import 'package:recything_application/screens/customer_service/faq/content/detail_answer_faq_or_other/detail_answer_faq_or_other_screen.dart';
import 'package:recything_application/screens/customer_service/faq/widgets/item_list_faq_widget.dart';
import 'package:recything_application/services/faq_services/category_faq_service.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class TopicCategoryCustomerServiceScreen extends StatefulWidget {
  final String title;
  final String category;
  const TopicCategoryCustomerServiceScreen({
    super.key,
    required this.title,
    required this.category,
  });

  @override
  State<TopicCategoryCustomerServiceScreen> createState() =>
      _TopicCategoryCustomerServiceScreenState();
}

class _TopicCategoryCustomerServiceScreenState
    extends State<TopicCategoryCustomerServiceScreen> {
  List<Datum>? _faqCategoryData;

  Future<void> _fetchFaqData() async {
    try {
      final faqCategoryData =
          await CategoryFaqService().getCategoryFaq(name: widget.category);
      setState(() {
        _faqCategoryData = faqCategoryData.data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchFaqData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        title: Text(
          'Topik : ${widget.title}',
          style: TextStyleConstant.boldTitle.copyWith(
            fontSize: 16.0,
            color: ColorConstant.netralColor800,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: ColorConstant.whiteColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _faqCategoryData == null
            ? const Center(child: MyLoading())
            : ListView.builder(
                itemCount: _faqCategoryData!.length,
                itemBuilder: (context, index) {
                  final faq = _faqCategoryData![index];
                  return ItemListFaqWidget(
                    question: faq.question ?? '',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailAnswerFAQorOtherScreen(
                            question: faq.question ?? '',
                            answer: faq.answer ?? '',
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
