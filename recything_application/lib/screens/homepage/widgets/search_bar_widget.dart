import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorConstant.netralColor500,
          prefixIcon: Icon(Icons.search),
          hintText: 'Search',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
        ),
      ),
    );
  }
}
