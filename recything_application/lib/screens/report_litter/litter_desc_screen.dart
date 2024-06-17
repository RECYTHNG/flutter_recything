import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';

class LitterDescScreen extends StatefulWidget {
  const LitterDescScreen({super.key});

  @override
  State<LitterDescScreen> createState() => LitterDescScreenState();
}

class LitterDescScreenState extends State<LitterDescScreen> {
  List<XFile>? _mediaFiles = [];
  late ImagePicker _picker;

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
  }

  Future<void> _pickMedia(bool isImage) async {
    final XFile? media = await _picker.pickImage(
      source: ImageSource.gallery,
      preferredCameraDevice: CameraDevice.rear,
    );
    if (media != null) {
      setState(() {
        _mediaFiles = (_mediaFiles ?? [])..add(media);
      });
    }
  }

  void _showBottomSheet(XFile media) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 108,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: ColorConstant.netralColor600,
                ),
              ),
              SpacingConstant.verticalSpacing400,
              Text(
                'Preview Media',
                style: TextStyleConstant.semiboldHeading4,
              ),
              SpacingConstant.verticalSpacing200,
              Image.file(
                File(media.path),
                width: 300,
                fit: BoxFit.cover,
              ),
              SpacingConstant.verticalSpacing200,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: ColorConstant.primaryColor500,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        final XFile? newMedia = await _picker.pickImage(
                          source: ImageSource.gallery,
                          preferredCameraDevice: CameraDevice.rear,
                        );
                        if (newMedia != null) {
                          setState(() {
                            _mediaFiles = _mediaFiles!
                                .map((m) => m == media ? newMedia : m)
                                .toList();
                          });
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Ganti Foto/Video',
                        style: TextStyle(
                          color: ColorConstant.netralColor50,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: ColorConstant.netralColor500,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _mediaFiles!.remove(media);
                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Hapus',
                        style: TextStyle(
                          color: ColorConstant.primaryColor500,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Deskripsi Sampah',
          style: TextStyleConstant.boldHeading4,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstant.netralColor50,
                    boxShadow: [
                      BoxShadow(
                        color: ColorConstant.netralColor900,
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lokasi Sampah',
                        style: TextStyleConstant.semiboldTitle,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: ColorConstant.primaryColor500,
                          ),
                          SpacingConstant.horizontalSpacing200,
                          Flexible(
                            child: Text(
                              'Cibeureum, Kec. Cimahi Sel., Kota Cimahi, Jawa Barat 40535',
                              softWrap: true,
                              style: TextStyleConstant.regularSubtitle,
                            ),
                          ),
                        ],
                      ),
                      SpacingConstant.verticalSpacing200,
                      Text(
                        'Jenis Sampah',
                        style: TextStyleConstant.semiboldTitle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.recycling,
                                color: ColorConstant.secondaryColor500,
                              ),
                              SpacingConstant.horizontalSpacing100,
                              Text(
                                'Organik',
                                style: TextStyleConstant.regularSubtitle,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 2,
                                height: 36,
                                color: ColorConstant.netralColor600,
                              ),
                              SpacingConstant.horizontalSpacing100,
                              Icon(
                                Icons.edit,
                                color: ColorConstant.netralColor600,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SpacingConstant.verticalSpacing400,
                Row(
                  children: [
                    Text('Judul Laporan'),
                    Text(
                      '*',
                      style: TextStyle(
                        color: ColorConstant.dangerColor500,
                      ),
                    ),
                  ],
                ),
                CustomTextFieldWidget(
                  label: 'Judul Laporan',
                  hint: 'Contoh: Sampah Pinggir Jalan',
                  isFloatingLabel: false,
                ),
                Row(
                  children: [
                    Text('Deskripsi Laporan'),
                    Text(
                      '*',
                      style: TextStyle(
                        color: ColorConstant.dangerColor500,
                      ),
                    ),
                  ],
                ),
                CustomTextFieldWidget(
                  label: 'Contoh : Sampah ini mengganggu lingkungan sekitar',
                  hint: 'Laporan',
                  isFloatingLabel: false,
                  isTextArea: true,
                ),
                SpacingConstant.verticalSpacing200,
                Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    if (_mediaFiles != null && _mediaFiles!.isNotEmpty)
                      ..._mediaFiles!.map((media) {
                        return GestureDetector(
                          onTap: () => _showBottomSheet(media),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: media.mimeType != null &&
                                    media.mimeType!.contains('video')
                                ? Icon(Icons.play_circle_fill,
                                    size: 50, color: Colors.black)
                                : Image.file(
                                    File(media.path),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        );
                      }),
                    GestureDetector(
                      onTap: () => _pickMedia(true),
                      child: DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 2,
                        dashPattern: [4, 4],
                        borderType: BorderType.RRect,
                        radius: Radius.circular(4),
                        child: Container(
                          width: 100,
                          height: 100,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.add_box_sharp,
                            color: ColorConstant.primaryColor500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorConstant.primaryColor500,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Kirim Laporan',
                  style: TextStyle(
                    color: ColorConstant.netralColor50,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
