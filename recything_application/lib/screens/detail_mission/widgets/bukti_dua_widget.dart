import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuktiDuaWidget extends StatelessWidget {
  final List<String> selectedBukti;
  final Function(int) pickFiles;
  final Function(int) removeBukti;

  const BuktiDuaWidget({
    Key? key,
    required this.selectedBukti,
    required this.pickFiles,
    required this.removeBukti,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return selectedBukti.isNotEmpty
        ? Column(
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
                      onTap: () => pickFiles(2),
                      child: SvgPicture.asset(
                        'assets/images/detail_mission_image/upload_area.svg',
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
                              removeBukti(index); // Remove selected bukti
                            },
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          )
        : GestureDetector(
            onTap: () => pickFiles(2),
            child: SvgPicture.asset(
              'assets/images/detail_mission_image/upload_area_start.svg',
            ),
          );
  }
}
