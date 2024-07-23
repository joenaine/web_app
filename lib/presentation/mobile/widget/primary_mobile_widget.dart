import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:flutter/material.dart';

class PrimaryMobileWidget extends StatelessWidget {
  const PrimaryMobileWidget({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Тренируйся',
              style: AppStyles.s32w700.copyWith(color: AppColors.secondary),
              children: [
                TextSpan(
                  text: '\n&Пополняй Портфолио',
                  style: AppStyles.s32w700.copyWith(height: 1.5),
                )
              ]),
        ),
        const SizedBox(height: 50),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(text: 'DESOTO', style: AppStyles.s18w700, children: [
            TextSpan(
              text: ' - серия дизайнерских заданий ',
              style: AppStyles.s18w500.copyWith(height: 1.5),
            )
          ]),
        ),
        const SizedBox(height: 40),
        MaterialButton(
            onPressed: () {
              scrollController.animateTo(
                3780,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            },
            color: AppColors.primary,
            padding: const EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Text(
              'Get Started',
              style: AppStyles.s18w700.copyWith(color: AppColors.white),
            )),
        const SizedBox(height: 100),
      ],
    );
  }
}
