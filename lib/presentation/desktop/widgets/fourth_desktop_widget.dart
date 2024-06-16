import 'package:desoto_web/core/app_assets.dart';
import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:flutter/material.dart';

class FourthDesktopWidget extends StatelessWidget {
  const FourthDesktopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: double.maxFinite,
      child: Column(
        children: [
          const SizedBox(height: 50),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(text: 'Твой&', style: AppStyles.s56w700, children: [
              TextSpan(
                text: 'путь',
                style: AppStyles.s56w700
                    .copyWith(color: AppColors.secondary, height: 1.5),
              )
            ]),
          ),
          const SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FourthRoadWidget(
                  icon: AppAssets.images.mag,
                  title: 'Приступай к\nзадаче',
                  subtitle:
                      'Ты получишь уникальные задачи по разработке пользовательского интерфейса'),
              FourthRoadWidget(
                  icon: AppAssets.images.medal,
                  title: 'Делись своими\nработами',
                  subtitle: 'Получи внимание, пользовательских симпатий'),
              FourthRoadWidget(
                  icon: AppAssets.images.tada,
                  title: 'Зарабатывай\nнаграды',
                  subtitle:
                      'Случайным образом получайте вознаграждения, такие как премиум-ресурсы для дизайна, скидки на курсы'),
            ],
          ),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}

class FourthRoadWidget extends StatelessWidget {
  const FourthRoadWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  final String icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        children: [
          Image.asset(icon, height: 48),
          const SizedBox(height: 30),
          Text(
            title,
            style: AppStyles.s32w700,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          Text(
            subtitle,
            style: AppStyles.s24w500,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
