import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FifthDesktopWidget extends StatelessWidget {
  const FifthDesktopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(32),
      child: const Column(
        children: [
          Text(
            'Тариф для твоего роста',
            style: AppStyles.s56w700,
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // PricePlanWidget(
              //   backroundColor: Color.fromRGBO(233, 240, 253, 1),
              //   frontColor: AppColors.primary,
              //   plan: 'Lite',
              //   title: 'Твой 33 дневный спринт Web-design challange',
              //   subtitle:
              //       'Серия веб-дизайн заданий  сгенерированные на основе Искусственного интеллекта',
              //   price: '15 000тг',
              // ),
              PricePlanWidget(
                backroundColor: Color.fromRGBO(86, 86, 225, 1),
                frontColor: AppColors.white,
                plan: 'PRO',
                title: 'Твой 33 дневный спринт Web-design challange',
                subtitle:
                    'Серия веб-дизайн заданий  сгенерированные на основе Искусственного интеллекта',
                price: 'Путь к твоей цели всего за\n45 000тг',
              ),
              SizedBox(width: 15),
              PricePlanWidget(
                backroundColor: Color.fromRGBO(254, 248, 225, 1),
                frontColor: AppColors.primary,
                plan: 'Enterprise',
                title: 'Для школ по UXUI/WEB design',
                subtitle:
                    'Подними уровень практики своих учеников на новый этап',
                price: 'Индивидуальное предложение',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PricePlanWidget extends StatelessWidget {
  const PricePlanWidget(
      {super.key,
      required this.plan,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.frontColor,
      required this.backroundColor});

  final String plan;
  final String title;
  final String subtitle;
  final String price;
  final Color frontColor;
  final Color backroundColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: Container(
          padding: const EdgeInsets.all(48),
          width: 400,
          height: 500,
          color: backroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(plan, style: AppStyles.s40w700.copyWith(color: frontColor)),
              const SizedBox(height: 10),
              Text(title, style: AppStyles.s24w600.copyWith(color: frontColor)),
              const SizedBox(height: 30),
              Text(subtitle,
                  style: AppStyles.s16w500.copyWith(color: frontColor)),
              const SizedBox(height: 20),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onPressed: () {
                    context.go('/auth');
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Получить',
                      style: AppStyles.s24w700,
                    ),
                  )),
              const SizedBox(height: 20),
              Text(price, style: AppStyles.s18w700.copyWith(color: frontColor)),
            ],
          )),
    );
  }
}
