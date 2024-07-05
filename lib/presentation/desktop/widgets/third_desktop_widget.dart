import 'package:desoto_web/core/app_assets.dart';
import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:desoto_web/presentation/desktop/widgets/second_desktop_widget.dart';
import 'package:flutter/material.dart';

class ThirdDesktopWidget extends StatelessWidget {
  const ThirdDesktopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bg,
      width: double.maxFinite,
      padding: const EdgeInsets.all(100),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Совершенствуй навыки\n& Пополни ',
                style: AppStyles.s56w700,
                children: [
                  TextSpan(
                    text: 'свое портфолио',
                    style: AppStyles.s56w700
                        .copyWith(color: AppColors.secondary, height: 1.5),
                  )
                ]),
          ),
          const SizedBox(height: 30),
          const Row(
            children: [
              SecondLeftSideWidget(),
              SizedBox(width: 50),
              SecondRightSideWidget()
            ],
          ),
          // const SizedBox(height: 100),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Image.asset(AppAssets.images.gds, height: 120),
          //     Image.asset(AppAssets.images.desoto, height: 120),
          //     Image.asset(AppAssets.images.impro, height: 120),
          //     Image.asset(AppAssets.images.izidos, height: 120)
          //   ],
          // )
        ],
      ),
    );
  }
}
