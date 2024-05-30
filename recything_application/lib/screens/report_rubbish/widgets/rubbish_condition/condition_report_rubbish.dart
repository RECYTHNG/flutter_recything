import 'package:flutter/material.dart';

class RubbishConditionReportRubbish extends StatelessWidget {
  const RubbishConditionReportRubbish({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Ceritakan Kondisi Sampah di Sekitarmu'),
        Container(
          width: double.infinity,
          height: 134,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const TextField(
            expands: true,
            maxLines: null,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16.0),
              border: InputBorder.none,
              hintText:
                  'Cth : Lingkungan saya sangat berbau sampah. Ada sampah disekitar yang membuat suasana lingkungan tidak enak.',
            ),
          ),
        ),
      ],
    );
  }
}
