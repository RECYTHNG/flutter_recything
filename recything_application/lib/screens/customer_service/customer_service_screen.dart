import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

class CustomerServiceScreen extends StatefulWidget {
  const CustomerServiceScreen({super.key});

  @override
  State<CustomerServiceScreen> createState() => _CustomerServiceScreenState();
}

class _CustomerServiceScreenState extends State<CustomerServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Kami Siap Membantu Anda',
                style: TextStyleConstant.boldSubtitle.copyWith(
                  fontSize: 16.0,
                  color: ColorConstant.netralColor900,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const GlobalSearchBar(
              height: 40.0,
              width: double.infinity,
              hintText: 'Search',
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
