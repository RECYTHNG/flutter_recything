import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/models/faq/search_faq_model.dart';
import 'package:recything_application/screens/customer_service/detail_answer_faq_or_other/detail_answer_faq_or_other_screen.dart';
import 'package:recything_application/screens/customer_service/search_result_customer_service/widgets/search_not_found_widget.dart';
import 'package:recything_application/screens/customer_service/cutomer_service_faq_main/widgets/item_list_faq_widget.dart';
import 'package:recything_application/services/faq_services/search_faq_service.dart';
import 'package:recything_application/widgets/global_autocomplete_search_bar.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

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
  List<DatumSearch> searchResults = [];
  List<String> matchData = [];
  String? queryInput;
  bool isLoading = false;
  Timer? _debounce;

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
      SnackBar(
        content: Text('Error: ${e.toString()}'),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _searchFaq(query);
    });
  }

  void onChangedQuery(String value) {
    queryInput = value;
    setState(() {});
    if (queryInput == "") {
      matchData.clear();
    } else {
      matchData = searchResults
          .where((element) => element.question!.contains(queryInput!))
          .map((e) => e.question!)
          .toList();
    }
    setState(() {});
  }

  void onClickMatchedResult(newValue) {
    matchData.clear();
    _searchController.text = newValue;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _searchFaq(widget.query);
    _searchController.addListener(() {
      _onSearchChanged(_searchController.text);
    });
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
            Flexible(
              child: GlobalAutocompleteSearchBar(
                height: 48.0,
                width: double.infinity,
                controller: _searchController,
                matchedSearchData: matchData,
                hintText: 'Search',
                query: queryInput,
                onSubmitted: (value) {
                  _searchFaq(value);
                },
                onChanged: (value) {
                  onChangedQuery(value);
                },
                onResultSelected: (newValue) {
                  onClickMatchedResult(newValue);
                },
              ),
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
