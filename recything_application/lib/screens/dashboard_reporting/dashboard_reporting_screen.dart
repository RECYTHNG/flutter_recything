import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class DashboardReporting extends StatelessWidget {
  const DashboardReporting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00476D),
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Lottie.asset('assets/dashboard_reporting.json'),
          ),
          Positioned(
            top: 257,
            left: 0,
            right: 0,
            child: Container(
              height: 700,
              decoration: const BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Pilih Jenis Pelaporan'),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 222,
                      child: ListView(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 328,
                            height: 220,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 25.2,
                                  offset: const Offset(0, 7),
                                  color:
                                      const Color(0xff64646F).withOpacity(0.2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 160,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        child: Image.network(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR54bDmC19aiqcNeUAb2LL3Y5v-qevhoSyDLGzVNWH9Ow&s',
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        width: double.infinity,
                                        height: 38,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff00476D)
                                              .withOpacity(0.75),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 8,
                                            horizontal: 10,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Penumpukan Sampah',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 18),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 116,
                                        height: 4,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff303030),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        width: 40,
                                        height: 4,
                                        decoration: const BoxDecoration(
                                          color: Color(0xffEFEFEF),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15),
                          Container(
                            width: 328,
                            height: 220,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 25.2,
                                  offset: const Offset(0, 7),
                                  color:
                                      const Color(0xff64646F).withOpacity(0.2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 160,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        child: Image.network(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR54bDmC19aiqcNeUAb2LL3Y5v-qevhoSyDLGzVNWH9Ow&s',
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        width: double.infinity,
                                        height: 38,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff00476D)
                                              .withOpacity(0.75),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 8,
                                            horizontal: 10,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Penumpukan Sampah',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 18),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 116,
                                        height: 4,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff303030),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        width: 40,
                                        height: 4,
                                        decoration: const BoxDecoration(
                                          color: Color(0xffEFEFEF),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Pilih Jenis Pelaporan'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Column(
                      children: [
                        Image.asset('assets/empty_history.png', width: 100),
                        SizedBox(height: 15),
                        const Text('Kamu belum pernah melaporkan')
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 225,
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
              child: Center(child: SvgPicture.asset('assets/reporting.svg')),
            ),
          )
        ],
      ),
    );
  }
}
