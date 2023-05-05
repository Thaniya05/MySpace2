import 'package:app2/myspace_module/controller/introduce_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

double mobilesize = 820;

class Introduce extends GetWidget<IntroduceController> {
  final PageController pCon;
  const Introduce({required this.pCon, super.key});

  @override
  Widget build(BuildContext context) {
    final introController = Get.put(IntroduceController());

    mobilesize = introController.model.$mobile_size;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Get.width < mobilesize
          ? Mobile(introController, context, pCon)
          : Web(introController, context, pCon),
    );
  }
}

Container Mobile(
  IntroduceController introController,
  BuildContext context,
  PageController p,
) {
  return Container(
    margin: const EdgeInsets.all(50),
    //color: Color.fromARGB(230, 231, 255, 240),
    child: Column(
      children: [
        Expanded(
          flex: 1,
          child: _buildSlide(introController, context),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHelloWorld(context, introController),
              _buildRole(introController, context),
              _buildStatus(introController, context),
              _buildblank(),
              _buildButtonRow(context, p),
            ],
          ),
        )
      ],
    ),
  );
}

Container Web(
  IntroduceController introController,
  BuildContext context,
  PageController p,
) {
  return Container(
    margin: const EdgeInsets.fromLTRB(100, 100, 100, 100),
    //color: Color.fromARGB(230, 231, 255, 240),
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: _buildSlide(introController, context),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHelloWorld(context, introController),
              _buildRole(introController, context),
              _buildStatus(introController, context),
              _buildblank(),
              _buildButtonRow(context, p)
            ],
          ),
        )
      ],
    ),
  );
}

Padding _buildblank([double d = 20.0]) => Padding(padding: EdgeInsets.all(d));

Row _buildStatus(IntroduceController c, BuildContext context) {
  double wfont = c.model.$web_fontsize_status;
  double mfont = c.model.$mobile_fontsize_status;

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AutoSizeText(
        'Status : ',
        maxLines: 1,
        minFontSize: 12,
        style: GoogleFonts.sarabun(
            fontSize: Get.width < mobilesize ? mfont : wfont,
            color: Colors.amber),
      ),
      AutoSizeText(
        c.model.status,
        maxLines: 1,
        minFontSize: 12,
        style: GoogleFonts.sarabun(
            fontSize: Get.width < mobilesize ? mfont : wfont),
      ),
    ],
  );
}

Row _buildRole(IntroduceController c, BuildContext context) {
  double wfont = c.model.$web_fontsize_status;
  double mfont = c.model.$mobile_fontsize_status;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AutoSizeText(
        'Role : ',
        maxLines: 1,
        minFontSize: 12,
        style: GoogleFonts.sarabun(
            color: Colors.amber,
            fontSize: Get.width < mobilesize ? mfont : wfont),
      ),
      AutoSizeText(
        c.model.role,
        maxLines: 1,
        minFontSize: 12,
        style: GoogleFonts.sarabun(
            fontSize: Get.width < mobilesize ? mfont : wfont),
      ),
    ],
  );
}

Row _buildHelloWorld(BuildContext context, IntroduceController c) {
  double wfont = c.model.$web_fontsize_hello;
  double mfont = c.model.$mobile_fontsize_hello;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AutoSizeText(
        'Hello World',
        maxLines: 1,
        minFontSize: 12,
        style: GoogleFonts.sarabun(
          fontSize: Get.width < mobilesize ? mfont : wfont,
        ),
      ),
      Container(
        alignment: Alignment.bottomLeft,
        //color: Colors.white,
        child: SizedBox(
          width: Get.width < mobilesize ? mfont : wfont,
          height: Get.width < mobilesize ? mfont : wfont,
          child: AnimatedTextKit(
            pause: const Duration(seconds: 0),
            repeatForever: true,
            animatedTexts: [
              TyperAnimatedText(
                '_',
                speed: const Duration(milliseconds: 400),
                textStyle: TextStyle(
                    fontSize: Get.width < mobilesize ? mfont : wfont,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      )
    ],
  );
}

CarouselSlider _buildSlide(IntroduceController c, BuildContext context) {
  double wHeight = c.model.$web_height_logo;
  double mHeight = c.model.$mobile_height_logo;
  return CarouselSlider(
    items: _listSlide(c),
    options: c.options(h: Get.width < mobilesize ? mHeight : wHeight),
  );
}

List<Widget> _listSlide(IntroduceController introController) {
  return introController.model.logolist
      .map(
        (e) => Container(
          child: SvgPicture.asset(
            e,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.7),
              BlendMode.modulate,
            ),
          ),
        ),
      )
      .toList();
}

Row _buildButtonRow(BuildContext context, PageController p) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {
          p.animateToPage(1, duration: 1300.ms, curve: Curves.easeInOutExpo);
        },
        child: Card(
          elevation: 10,
          color: Theme.of(context).cardColor,
          child: Container(
            width: 100,
            height: 60,
            child: Center(
              child: Text(
                'About Me',
                style: GoogleFonts.sarabun(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
      Padding(padding: EdgeInsets.all(20.0)),
      GestureDetector(
        onTap: () {
          p.animateToPage(4, duration: 2000.ms, curve: Curves.easeInOut);
        },
        child: Card(
          elevation: 10,
          color: Theme.of(context).cardColor,
          child: Container(
            width: 100,
            height: 60,
            child: Center(
              child: Text(
                'Work History',
                style: GoogleFonts.sarabun(
                  color: Theme.of(context).textTheme.labelMedium!.color,
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
