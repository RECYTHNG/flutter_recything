import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

class SearchResultCustomerService extends StatefulWidget {
  const SearchResultCustomerService({super.key});

  @override
  State<SearchResultCustomerService> createState() =>
      _SearchResultCustomerServiceState();
}

class _SearchResultCustomerServiceState
    extends State<SearchResultCustomerService> {
  final TextEditingController _searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String search = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
              onSubmitted: (value) {
                setState(() {
                  search = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
