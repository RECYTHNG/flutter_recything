import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.close,
                    color: ColorConstant.netralColor600,
                  ),
                  SpacingConstant.horizontalSpacing300
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          child: Icon(
                            Icons.person,
                          ),
                        ),
                        SpacingConstant.horizontalSpacing100,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'full name',
                              style: TextStyleConstant.mediumSubtitle,
                            ),
                            Text(
                              'Job ',
                              style: TextStyleConstant.boldTitle,
                            ),
                          ],
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: ColorConstant.primaryColor500,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Follow',
                          style: TextStyle(color: ColorConstant.netralColor50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SpacingConstant.verticalSpacing200,
              Image.asset(
                'assets/images/your_image.png',
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey[300],
                    child: Center(
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 48,
                      ),
                    ),
                  );
                },
              ),
              SpacingConstant.verticalSpacing100,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: TextStyleConstant.boldHeading1,
                    ),
                    SpacingConstant.verticalSpacing100,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('8 Okt 2021'),
                        SpacingConstant.horizontalSpacing100,
                        Icon(
                          Icons.fiber_manual_record,
                          size: 4,
                          color: Colors.grey,
                        ),
                        SpacingConstant.horizontalSpacing100,
                        Text('4 Min Read'),
                        SpacingConstant.horizontalSpacing200,
                        Icon(
                          Icons.bookmark,
                          color: ColorConstant.primaryColor500,
                        ),
                      ],
                    ),
                    SpacingConstant.verticalSpacing300,
                    Text(
                      'SubTitle',
                      style: TextStyleConstant.boldHeading3,
                    ),
                    Image.asset(
                      'assets/images/your_image.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey[300],
                          child: Center(
                            child: Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 48,
                            ),
                          ),
                        );
                      },
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin in lectus eu felis vestibulum porttitor. Donec mi velit, posuere blandit ornare in, tempor vitae mi. Mauris quis gravida odio. Aenean sit amet purus mollis, congue sapien eget, egestas nunc. Aliquam erat volutpat. Ut sit amet condimentum augue, quis tempus leo. Pellentesque bibendum quam eu ipsum sodales sodales. Nullam rutrum dui eget eleifend molestie. Aenean blandit nunc eget ligula euismod viverra. Integer sed eros ut neque molestie malesuada.',
                      style: TextStyleConstant.mediumSubtitle,
                    ),
                    SpacingConstant.verticalSpacing300,
                    Text(
                      'Morbi vulputate augue eget dictum rhoncus. Nulla facilisi. Integer condimentum euismod imperdiet. Sed fringilla id est at consequat. Donec pharetra bibendum porttitor. Suspendisse pellentesque massa in semper vulputate. Donec turpis est, tristique vel nisi non, interdum elementum lectus. Vestibulum suscipit nulla vel egestas tincidunt. Nam molestie ante non enim viverra, vulputate tincidunt leo pulvinar. Phasellus venenatis fringilla justo, ut accumsan nunc sagittis nec. In congue ante sit amet egestas pellentesque. Vestibulum felis tortor, semper vitae sapien et, tristique efficitur massa. Duis dignissim orci eget est rhoncus sodales. Phasellus pulvinar diam tristique enim dignissim, in molestie neque mattis.',
                      style: TextStyleConstant.mediumSubtitle,
                    ),
                  ],
                ),
              ),
              SpacingConstant.verticalSpacing300,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        color: ColorConstant.primaryColor500,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: ColorConstant.netralColor50,
                            child: Icon(
                              Icons.arrow_downward,
                              color: ColorConstant.primaryColor500,
                              size: 16,
                            ),
                          ),
                          SpacingConstant.horizontalSpacing050,
                          Text(
                            'Download Offline',
                            style:
                                TextStyle(color: ColorConstant.netralColor50),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SpacingConstant.horizontalSpacing150,
                  Icon(Icons.favorite_border),
                  SpacingConstant.horizontalSpacing050,
                  Text('65 Likes'),
                  SpacingConstant.horizontalSpacing250,
                  Icon(
                    Icons.comment,
                    color: ColorConstant.primaryColor500,
                  ),
                  SpacingConstant.horizontalSpacing050,
                  Text('4 Comments'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
