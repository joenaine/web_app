import 'package:desoto_web/core/app_assets.dart';
import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:flutter/material.dart';

class FourthMobileWidget extends StatelessWidget {
  const FourthMobileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: double.maxFinite,
      child: Column(
        children: [
          const SizedBox(height: 30),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(text: 'Твой&', style: AppStyles.s32w700, children: [
              TextSpan(
                text: 'путь',
                style: AppStyles.s32w700
                    .copyWith(color: AppColors.secondary, height: 1.5),
              )
            ]),
          ),
          const SizedBox(height: 80),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FourthRoadMobileWidget(
                  icon: AppAssets.images.mag,
                  title: 'Приступай к задаче',
                  subtitle:
                      'Ты получишь уникальные задачи по разработке пользовательского интерфейса'),
              const SizedBox(height: 40),
              FourthRoadMobileWidget(
                  icon: AppAssets.images.medal,
                  title: 'Делись своими работами',
                  subtitle: 'Получи внимание, пользовательских симпатий'),
              const SizedBox(height: 40),
              FourthRoadMobileWidget(
                  icon: AppAssets.images.tada,
                  title: 'Зарабатывай награды',
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

class FourthRoadMobileWidget extends StatelessWidget {
  const FourthRoadMobileWidget({
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
    return Column(
      children: [
        Image.asset(icon, height: 48),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: AppStyles.s24w700,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            subtitle,
            style: AppStyles.s18w500.copyWith(color: Colors.black87),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
