import 'package:app2/myspace_module/controller/exp_intro_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

double mobilesize = 1100;

class IntroExp extends GetWidget<ExpIntroController> {
  IntroExp({super.key});

  @override
  Widget build(BuildContext context) {
    final _gridcontroller = ScrollController();
    final _controller = ExpIntroController();

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Get.width < mobilesize
          ? _buildMobile(_controller, context)
          : _buildWeb(_controller, context),
    );
  }

  Container _buildWeb(ExpIntroController c, BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildanimeWeb(
              w: MediaQuery.of(context).size.width * 0.4, context: context),
          Container(
              child: _buildExpDetails(
                  w: MediaQuery.of(context).size.width * 0.4,
                  context: context,
                  c: c,
                  crossAx: CrossAxisAlignment.center,
                  mainAx: MainAxisAlignment.center))
        ],
      ),
    );
  }

  Container _buildMobile(ExpIntroController c, BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildanimeWeb(
            w: MediaQuery.of(context).size.width * 0.8,
            context: context,
          ),
          Container(
            child: _buildExpDetails(
              w: MediaQuery.of(context).size.width * 0.83,
              context: context,
              c: c,
              crossAx: CrossAxisAlignment.center,
              mainAx: MainAxisAlignment.center,
            ),
          )
        ],
      ),
    );
  }

  Container _buildExpDetails({
    required double w,
    required BuildContext context,
    required ExpIntroController c,
    CrossAxisAlignment crossAx = CrossAxisAlignment.center,
    MainAxisAlignment mainAx = MainAxisAlignment.center,
  }) {
    return Container(
      width: w,
      child: _buildEXP(c, crossAx, mainAx, context),
    );
  }

  _buildanimeWeb({required double w, required BuildContext context}) {
    return Card(
      elevation: 30,
      child: Container(
        width: w,
        color: Colors.white,
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: Container(
            //color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.purple,
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.blue,
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.cartShopping,
                                size: Get.width < mobilesize ? 16 : 32,
                                color: Colors.amber,
                              )
                                  .animate(
                                    onPlay: (controller) => controller.repeat(),
                                  )
                                  .shake(
                                    duration: 700.ms,
                                    delay: 700.ms,
                                  )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          //color: Colors.amber,
                          child: Container(
                            margin: EdgeInsets.all(20.0),
                            //color: Colors.white,
                            child: _buildSlide(
                              context,
                              (MediaQuery.of(context).size.width * 2 / 3) * 0.4,
                            ), //defaut 0.2
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CarouselSlider _buildSlide(BuildContext context, double h) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlayInterval: 100.ms,
        autoPlayAnimationDuration: Duration(milliseconds: 1200),
        autoPlayCurve: Curves.linear,
        autoPlay: true,
        aspectRatio: 0.5 / 2,
        height: h,
      ),
      items: listicon.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  elevation: 3,
                  color: Colors.grey,
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: Container(
                      color: Colors.grey,
                      // margin: EdgeInsets.symmetric(horizontal: 5.0),
                      //decoration: BoxDecoration(color: Colors.amber),
                      child: _buildColumnMiniCard(i),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }

  Column _buildEXP(ExpIntroController c, CrossAxisAlignment crossAx,
      MainAxisAlignment mainAx, BuildContext context) {
    return Column(
      crossAxisAlignment: crossAx,
      mainAxisAlignment: mainAx,
      children: [
        Center(
          child: Container(
              //color: Colors.amber,
              margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: AutoSizeText(
                "My Experience",
                style: GoogleFonts.sarabun(
                  fontSize: Get.width < mobilesize ? 24 : 40,
                ),
                maxLines: 1,
                minFontSize: 14,
              )),
        ),
        Padding(padding: EdgeInsets.all(Get.width < mobilesize ? 0 : 20)),
        Container(
          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
          //color: Colors.amber,
          child: AutoSizeText(
            c.model.details,
            style: GoogleFonts.sarabun(
              fontSize: Get.width < mobilesize ? 18 : 26,
              fontWeight: FontWeight.w200,
            ),
            maxLines: 9,
            minFontSize: 10,
          ),
        ),
        Padding(padding: EdgeInsets.all(Get.width < mobilesize ? 10 : 20)),
        GestureDetector(
          onTap: () {},
          child: Card(
            elevation: 10,
            color: Theme.of(context).cardColor,
            child: Container(
              width: 100,
              height: 60,
              child: Center(
                child: Text(
                  'More Info',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _buildColumnMiniCard(IconData icon) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: Container(
            alignment: Alignment.center,
            child: FaIcon(
              icon,
              color: Colors.white,
              size: Get.width < mobilesize ? 16 : 24,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: 30,
            child: Row(
              children: [
                Expanded(
                  child: Container(color: Colors.purple),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    color: Colors.pink,
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  List<IconData> listicon = [
    FontAwesomeIcons.book,
    FontAwesomeIcons.car,
    FontAwesomeIcons.phone,
    FontAwesomeIcons.ticket,
    FontAwesomeIcons.plane
  ];
}
