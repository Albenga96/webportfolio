import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_portfolio/controllers/menu_controller.dart';
import 'package:web_portfolio/pages/home/components/carousel.dart';
import 'package:web_portfolio/pages/home/components/cv_section.dart';
import 'package:web_portfolio/pages/home/components/education_section.dart';
import 'package:web_portfolio/pages/home/components/footer.dart';
import 'package:web_portfolio/pages/home/components/header.dart';
import 'package:web_portfolio/pages/home/components/ios_app_ad.dart';
import 'package:web_portfolio/pages/home/components/portfolio_stats.dart';
import 'package:web_portfolio/pages/home/components/skill_section.dart';
import 'package:web_portfolio/pages/home/components/website_ad.dart';
import 'package:web_portfolio/pages/intro/intro_elements.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/globals.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

import 'components/menu_item.dart';

class Home extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: Obx(
              () => ScreenHelper.isMobile(context)
                  ? Column(
                      children: List.generate(
                        _controller.menuItems.length,
                        (index) => MenuItem(
                          text: _controller.menuItems[index],
                          isActive: index == _controller.selectedIndex,
                          press: () => _controller.setMenuIndex(index),
                        ),
                      ),
                    )
                  : Container(),
            ),
          ),
        ),
      ),
      body: Container(
        color: kBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Header(),
              ),
              GetX<MenuController>(
                init: MenuController(),
                builder: (ctrl) {
                  return ctrl.selectedIndex == 0
                      ? HomeElements()
                      : IntroElements();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeElements extends StatelessWidget {
  const HomeElements({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Carousel(),
        SizedBox(
          height: 20.0,
        ),
        CvSection(),
        IosAppAd(),
        SizedBox(
          height: 70.0,
        ),
        WebsiteAd(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 28.0),
          child: PortfolioStats(),
        ),
        SizedBox(
          height: 50.0,
        ),
        EducationSection(),
        SizedBox(
          height: 50.0,
        ),
        SkillSection(),
        SizedBox(
          height: 50.0,
        ),
        //Sponsors(),
        //SizedBox(
        //  height: 50.0,
        //),
        //TestimonialWidget(),
        Footer(),
      ],
    );
  }
}
