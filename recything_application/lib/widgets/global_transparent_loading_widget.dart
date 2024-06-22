import 'package:flutter/material.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class TransparentLoadingScreen extends StatelessWidget {
  const TransparentLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: const Center(
        child: MyLoading(),
      ),
    );
  }
}
