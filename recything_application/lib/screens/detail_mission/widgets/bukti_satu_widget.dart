import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recything_application/constants/icon_constant.dart';

class BuktiSatuWidget extends StatelessWidget {
  final List<String> selectedBukti;
  final Function(int) pickFiles;
  final Function(int) removeBukti;

  const BuktiSatuWidget({
    super.key,
    required this.selectedBukti,
    required this.pickFiles,
    required this.removeBukti,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            crossAxisCount: 3,
            childAspectRatio: 1 / 1,
          ),
          itemCount: selectedBukti.length + 1,
          itemBuilder: (context, index) {
            if (index == selectedBukti.length) {
              return GestureDetector(
                onTap: () => pickFiles(1),
                child: SvgPicture.asset(
                  IconConstant.uploadButtonAfter,
                ),
              );
            } else {
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.file(
                        File(selectedBukti[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -6,
                    right: -6,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        removeBukti(index);
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
