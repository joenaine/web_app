import 'package:desoto_web/core/app_assets.dart';
import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:flutter/material.dart';

class PrimaryDesktopWidget extends StatelessWidget {
  const PrimaryDesktopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          AppAssets.images.rocket,
          height: 400,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                    text: 'Тренируйся',
                    style:
                        AppStyles.s56w700.copyWith(color: AppColors.secondary),
                    children: [
                      TextSpan(
                        text: '\n&Пополняй\nПортфолио',
                        style: AppStyles.s56w700.copyWith(height: 1.5),
                      )
                    ]),
              ),
              const SizedBox(height: 50),
              const Text(
                'DESOTO это серия дизайнерских заданий ',
                style: AppStyles.s18w700,
              ),
              const SizedBox(height: 40),
              MaterialButton(
                  onPressed: () {},
                  color: AppColors.primary,
                  padding: const EdgeInsets.all(24),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    'Get Started',
                    style: AppStyles.s24w600.copyWith(color: AppColors.white),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
