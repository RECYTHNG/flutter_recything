import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ItemArtikelSearchWidget extends StatelessWidget {
  const ItemArtikelSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      height: 177,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIAHdp-b9bkzPaEeZb6UXFyGuKn6-VjFr6K76_JK2hPw&s'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Namamu disini',
                    style: TextStyleConstant.mediumCaption.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset('assets/icons/more_horizontal.svg'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Artikel nih cuy baca dong masa iya kaga dibaca aku ngodingnya udh cape2 loh ahahahahahhahaahahah',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleConstant.boldParagraph.copyWith(
                        color: ColorConstant.netralColor900,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'iya apa apppppppppppppppppppppppppppppppaaaaaaa yaaaaaaaaaaaaahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleConstant.mediumFooter.copyWith(
                        color: ColorConstant.netralColor700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '26 mins • 10 mins',
                      style: TextStyleConstant.mediumFooter.copyWith(
                        color: ColorConstant.netralColor600,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 113,
                width: 160,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIAHdp-b9bkzPaEeZb6UXFyGuKn6-VjFr6K76_JK2hPw&s',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
