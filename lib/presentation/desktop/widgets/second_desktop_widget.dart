import 'package:desoto_web/core/app_assets.dart';
import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:flutter/material.dart';

class SecondDesktopWidget extends StatelessWidget {
  const SecondDesktopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgS,
      width: double.maxFinite,
      padding: const EdgeInsets.all(100),
      child: Column(
        children: [
          const Text(
            'Начни работу с Desoto уже сегодня',
            style: AppStyles.s56w700,
          ),
          const SizedBox(height: 40),
          Row(
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
                ],
              ),
              const SizedBox(width: 100),
              Column(
                children: [
                  Image.asset(AppAssets.images.demo, height: 500),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TaskStepsWidget(
                        imageAsset: AppAssets.images.fillportfolio,
                        number: '3',
                        text: 'Пополняйте свое портфолио',
                      ),
                      const SizedBox(width: 100),
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
          )
        ],
      ),
    );
  }
}

class TaskStepsWidget extends StatelessWidget {
  const TaskStepsWidget({
    super.key,
    required this.imageAsset,
    required this.number,
    required this.text,
  });
  final String imageAsset;
  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Image.asset(imageAsset, height: 150),
            ),
            Positioned(
              top: 0,
              child: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Text(
                  number,
                  style: AppStyles.s14w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(text,
            style: AppStyles.s16w500.copyWith(color: AppColors.textColors)),
      ],
    );
  }
}

class GenerateTaskWidget extends StatelessWidget {
  const GenerateTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.images.generatetasks,
          height: 150,
        ),
        const Positioned(
          top: 0,
          child: CircleAvatar(
            backgroundColor: AppColors.primary,
            child: Text(
              '1',
              style: AppStyles.s14w700,
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 70,
          child: Image.asset(
            AppAssets.images.school,
            height: 56,
          ),
        )
      ],
    );
  }
}

class SecondRightSideWidget extends StatelessWidget {
  const SecondRightSideWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 30),
        ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Image.asset(AppAssets.images.studentHackathon, height: 250),
        ),
        const SizedBox(height: 30),
        ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Image.asset(AppAssets.images.startupIncubator, height: 250),
        ),
      ],
    );
  }
}

class SecondLeftSideWidget extends StatelessWidget {
  const SecondLeftSideWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // RichText(
        //   textAlign: TextAlign.center,
        //   text:
        //       TextSpan(text: 'Реальными ', style: AppStyles.s32w700, children: [
        //     TextSpan(
        //       text: 'кейсами от наших\nпартнеров',
        //       style: AppStyles.s32w700
        //           .copyWith(color: AppColors.secondary, height: 1.5),
        //     )
        //   ]),
        // ),
        const SizedBox(height: 30),
        ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Image.asset(AppAssets.images.sportPlatform, height: 400),
        )
      ],
    );
  }
}
