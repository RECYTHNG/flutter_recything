import 'package:flutter/material.dart';
import 'package:flutter_tabbar_page/flutter_tabbar_page.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/screens/my_challenge/widgets/active_challenge/list_active_challenge_widget.dart';
import 'package:recything_application/screens/my_challenge/widgets/done_challenge/list_done_challenge_widgte.dart';

class MyChallengeScreen extends StatefulWidget {
  const MyChallengeScreen({super.key});

  @override
  State<MyChallengeScreen> createState() => _MyChallengeScreenState();
}

class _MyChallengeScreenState extends State<MyChallengeScreen> {
  List<PageTabItemModel> lstPages = <PageTabItemModel>[];
  final TabPageController _controller = TabPageController();

  @override
  void initState() {
    super.initState();
    lstPages.add(
      PageTabItemModel(
        title: "Active",
        page: const ListActiveChallengeWidget(),
      ),
    );
    lstPages.add(
      PageTabItemModel(
        title: "Done",
        page: const ListDoneChallengeWidget(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TabBarPage(
              controller: _controller,
              pages: lstPages,
              isSwipable: true,
              tabBackgroundColor: Colors.white,
              tabitemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _controller.onTabTap(index);
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / lstPages.length,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Center(
                          child: Text(
                            lstPages[index].title ?? "",
                            style: TextStyle(
                                fontWeight: _controller.currentIndex == index
                                    ? FontWeight.w700
                                    : FontWeight.w400,
                                color: _controller.currentIndex == index
                                    ? ColorConstant.primaryColor500
                                    : Colors.black26,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                          height: 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _controller.currentIndex == index
                                  ? ColorConstant.primaryColor500
                                  : Colors.transparent),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
