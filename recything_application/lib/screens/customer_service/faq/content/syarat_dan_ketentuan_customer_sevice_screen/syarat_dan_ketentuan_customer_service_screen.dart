import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class SyaratDanKetentuanCustomerServiceScreen extends StatelessWidget {
  const SyaratDanKetentuanCustomerServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        title: Text(
          'Syarat dan Ketentuan',
          style: TextStyleConstant.boldTitle.copyWith(
            fontSize: 16.0,
            color: ColorConstant.netralColor800,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: ColorConstant.whiteColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat datang di Recything! Kami senang Anda telah bergabung dengan komunitas kami untuk menciptakan lingkungan yang lebih bersih dan berkelanjutan. Sebelum Anda mulai menggunakan aplikasi kami, mohon baca dan pahami syarat dan ketentuan penggunaan berikut ini. Dengan mengunduh, mengakses, atau menggunakan aplikasi Recything, Anda menyetujui semua syarat dan ketentuan yang tercantum di bawah ini.',
                style: TextStyleConstant.semiboldCaption.copyWith(
                  fontSize: 12.0,
                  color: ColorConstant.netralColor800,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
              SpacingConstant.verticalSpacing300,
              Text(
                'A. Penerimaan Syarat dan Ketentuan',
                style: TextStyleConstant.semiboldCaption.copyWith(
                  fontSize: 14.0,
                  color: ColorConstant.netralColor900,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                'Dengan mengakses dan menggunakan aplikasi Recything, Anda menyetujui untuk terikat oleh syarat dan ketentuan ini. Jika Anda tidak setuju dengan salah satu bagian dari syarat dan ketentuan ini, Anda tidak diperkenankan menggunakan aplikasi ini.',
                style: TextStyleConstant.semiboldCaption.copyWith(
                  fontSize: 12.0,
                  color: ColorConstant.netralColor800,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
              SpacingConstant.verticalSpacing300,
              Text(
                'B. Layanan yang desediakan',
                style: TextStyleConstant.semiboldCaption.copyWith(
                  fontSize: 14.0,
                  color: ColorConstant.netralColor900,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                'Recything menyediakan layanan untuk melaporkan lokasi sampah, informasi tentang pengelolaan sampah, dan fitur-fitur lainnya yang mendukung tujuan lingkungan. Kami berhak untuk menambah, mengubah, atau menghapus fitur-fitur tertentu sesuai dengan kebijakan kami.',
                style: TextStyleConstant.semiboldCaption.copyWith(
                  fontSize: 12.0,
                  color: ColorConstant.netralColor800,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
              SpacingConstant.verticalSpacing300,
              Text(
                'C. Pendaftaran dan Akun Pengguna',
                style: TextStyleConstant.semiboldCaption.copyWith(
                  fontSize: 14.0,
                  color: ColorConstant.netralColor900,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                '- Anda harus membuat akun untuk menggunakan beberapa fitur di aplikasi Recything.\n- Informasi yang Anda berikan saat pendaftaran harus akurat dan terbaru.\n- Anda bertanggung jawab untuk menjaga kerahasiaan informasi akun Anda dan bertanggung jawab penuh atas semua aktivitas yang terjadi di bawah akun Anda.',
                style: TextStyleConstant.semiboldCaption.copyWith(
                  fontSize: 12.0,
                  color: ColorConstant.netralColor800,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
