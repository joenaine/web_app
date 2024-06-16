import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:desoto_web/presentation/desktop/widgets/fifth_desktop_widget.dart';
import 'package:flutter/material.dart';

class FifthMobileWidget extends StatelessWidget {
  const FifthMobileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(32),
      child: const Column(
        children: [
          Text('Тариф для твоего роста', style: AppStyles.s28w700),
          SizedBox(height: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PricePlanWidget(
                backroundColor: Color.fromRGBO(233, 240, 253, 1),
                frontColor: AppColors.primary,
                plan: 'Lite',
                title: 'Твой 33 дневный спринт Web-design challange',
                subtitle:
                    'Серия веб-дизайн заданий  сгенерированные на основе Искусственного интеллекта',
                price: '15 000тг',
              ),
              SizedBox(height: 30),
              PricePlanWidget(
                backroundColor: Color.fromRGBO(86, 86, 225, 1),
                frontColor: AppColors.white,
                plan: 'PRO',
                title: 'Твой 33 дневный спринт Web-design challange',
                subtitle:
                    'Получай реальные веб-дизайн задачи от именитых IT компаний',
                price: 'Путь к твоей цели всего за\n45 000тг',
              ),
              SizedBox(height: 30),
              PricePlanWidget(
                backroundColor: Color.fromRGBO(254, 248, 225, 1),
                frontColor: AppColors.primary,
                plan: 'Enterprise',
                title: 'Для школ по UXUI/WEB design',
                subtitle:
                    'Подними уровень практикисвоих учеников на новый этап',
                price: 'Индивидуальное предложение',
              ),
            ],
          )
        ],
      ),
    );
  }
}
