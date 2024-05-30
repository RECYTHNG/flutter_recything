import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ItemVideoSearchWidget extends StatelessWidget {
  const ItemVideoSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      // height: 184,
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.blackColor.withOpacity(0.25),
            offset: const Offset(1, 2),
            blurRadius: 10.9,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT5WSf9nOxTU8XJuqAw0fH_LCsmMoHbGVQPer_6kXTyA&s',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cara Mudah Memilah Sampah di Rumah',
                      // maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleConstant.boldParagraph.copyWith(
                        color: ColorConstant.netralColor900,
                      ),
                    ),
                    Text(
                      '11 rb ditonton',
                      style: TextStyleConstant.mediumFooter.copyWith(
                        color: ColorConstant.netralColor900,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset(
                      'assets/icons/more.svg',
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
