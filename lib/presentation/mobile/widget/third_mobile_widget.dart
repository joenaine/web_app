import 'package:desoto_web/core/app_assets.dart';
import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ThirdMobileWidget extends StatelessWidget {
  const ThirdMobileWidget({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bg,
      width: double.maxFinite,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(height: 70),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Совершенствуй навыки\n& Пополни ',
                style: AppStyles.s24w700,
                children: [
                  TextSpan(
                    text: 'свое портфолио',
                    style: AppStyles.s24w700
                        .copyWith(color: AppColors.secondary, height: 1.5),
                  )
                ]),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.maxFinite,
            height: 300,
            child: PageView(
              allowImplicitScrolling: true,
              controller: _pageController,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child:
                      Image.asset(AppAssets.images.sportPlatform, height: 300),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(AppAssets.images.studentHackathon,
                      height: 300),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(AppAssets.images.startupIncubator,
                      height: 300),
                ),
              ],
            ),
          ),
          SmoothPageIndicator(controller: _pageController, count: 3),
          // const SizedBox(height: 100),
          // RichText(
          //   textAlign: TextAlign.center,
          //   text: TextSpan(
          //       text: 'Реальными ',
          //       style: AppStyles.s24w700,
          //       children: [
          //         TextSpan(
          //           text: 'кейсами от наших\nпартнеров',
          //           style: AppStyles.s24w700
          //               .copyWith(color: AppColors.secondary, height: 1.5),
          //         )
          //       ]),
          // ),
          // const SizedBox(height: 50),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Image.asset(AppAssets.images.gds, height: 90),
          //     const SizedBox(height: 30),
          //     Image.asset(AppAssets.images.desoto, height: 90),
          //     const SizedBox(height: 30),
          //     Image.asset(AppAssets.images.impro, height: 90),
          //     const SizedBox(height: 30),
          //     Image.asset(AppAssets.images.izidosmob, height: 90)
          //   ],
          // ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
