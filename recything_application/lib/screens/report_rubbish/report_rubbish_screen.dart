import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recything_application/screens/report_rubbish/widgets/rubbish_condition/description_report_rubbish_widget.dart';

class ReportRubbishScreen extends StatelessWidget {
  const ReportRubbishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Stack(
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 205,
                ),
                Container(
                  width: double.infinity,
                  height: 157,
                  decoration: const BoxDecoration(
                    color: Color(0xff00476D),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: const SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Laporan Penumpukan Sampah',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xff7FB23B),
                      border: Border.all(
                        color: const Color(0xffFFFFFF),
                        width: 8,
                        strokeAlign: 0,
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset('assets/reporting.svg'),
                    ),
                  ),
                )
              ],
            ),
            const Expanded(
              child: Column(
                children: [
                  TabBar(
                    indicatorWeight: 4,
                    tabs: [
                      Tab(text: 'Deskripsi Sampah'),
                      Tab(text: 'Unggah Gambar'),
                    ],
                  ),
                  RubbishDescriptionReportRubbishWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
