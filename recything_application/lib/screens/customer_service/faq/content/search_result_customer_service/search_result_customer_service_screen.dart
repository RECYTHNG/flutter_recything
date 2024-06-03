import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/models/faq/search_faq_model.dart';
import 'package:recything_application/screens/customer_service/faq/content/detail_answer_faq_or_other/detail_answer_faq_or_other_screen.dart';
import 'package:recything_application/screens/customer_service/faq/content/search_result_customer_service/widgets/search_not_found_widget.dart';
import 'package:recything_application/screens/customer_service/faq/widgets/item_list_faq_widget.dart';
import 'package:recything_application/services/faq_services/search_faq_service.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

class SearchResultCustomerService extends StatefulWidget {
  final String query;
  const SearchResultCustomerService({
    super.key,
    required this.query,
  });

  @override
  State<SearchResultCustomerService> createState() =>
      _SearchResultCustomerServiceState();
}

class _SearchResultCustomerServiceState
    extends State<SearchResultCustomerService> {
  final TextEditingController _searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String search = '';
  List<DatumSearch> searchResults = [];
  bool isLoading = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _searchFaq(String query) async {
    setState(() {
      isLoading = true;
    });

    try {
      final searchResult = await SearchFaqService().getSearchFaq(query: query);
      setState(() {
        searchResults = searchResult.data ?? [];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        searchResults = [];
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

   @override
  void initState() {
    super.initState();
    _searchFaq(widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        title: Text(
          'Pencarian',
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
        child: Column(
          children: [
            GlobalSearchBar(
              height: 40.0,
              width: double.infinity,
              hintText: 'Search',
              controller: _searchController,
              onSubmitted: (query) {
                setState(() {
                  search = query;
                });
                _searchFaq(query);
              },
            ),
            SpacingConstant.verticalSpacing200,
            if (isLoading) const Center(child: MyLoading()),
            if (!isLoading && searchResults.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    final faq = searchResults[index];
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
            if (!isLoading && searchResults.isEmpty)
              const SearchingNotFoundWidget()
          ],
        ),
      ),
    );
  }
}
