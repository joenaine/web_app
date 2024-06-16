import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:desoto_web/presentation/desktop/widgets/second_desktop_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';

class SecondMobileWidget extends StatelessWidget {
  const SecondMobileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgS,
      width: double.maxFinite,
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            'Начни работу с Desoto \nуже сегодня',
            style: AppStyles.s32w700,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Column(
            children: [
              Column(
                children: [
                  const GenerateTaskWidget(),
                  const SizedBox(height: 20),
                  Text('Генерируй задачи',
                      style: AppStyles.s16w500
                          .copyWith(color: AppColors.textColors)),
                  const SizedBox(height: 50),
                  TaskStepsWidget(
                    imageAsset: AppAssets.images.starttasks,
                    number: '2',
                    text: 'Приступай к выполнению',
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: 230,
                    child: TaskStepsWidget(
                      imageAsset: AppAssets.images.fillportfolio,
                      number: '3',
                      text: 'Пополняйте свое портфолио',
                    ),
                  ),
                  const SizedBox(height: 50),
                  TaskStepsWidget(
                    imageAsset: AppAssets.images.shareresults,
                    number: '4',
                    text: 'Делись результатами',
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
