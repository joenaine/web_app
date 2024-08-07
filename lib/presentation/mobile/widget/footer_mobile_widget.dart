import 'package:desoto_web/core/app_assets.dart';
import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:desoto_web/presentation/desktop/widgets/footer_desktop_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:html' as html;

class FooterMobileWidget extends StatelessWidget {
  const FooterMobileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FooterInfoMobileWidget(
            title: 'О нас',
            subtitle:
                'Ответы на часто задаваемые вопросы о Desoto, о том, как он работает, и многое другое.',
            agreementText: 'Политика конфиденциальности',
            onTap: () {
              html.window.open(politikaConf, 'new tab');
            },
          ),
          FooterInfoMobileWidget(
            title: 'Партнерам',
            subtitle:
                'Узнайте, как мы можем помочь вашей компании привлечь к разработке талантливых Web-дизайнеров',
            agreementText: 'Публичная оферта',
            onTap: () {
              html.window.open(oferta, 'new tab');
            },
          ),
          FooterInfoMobileWidget(
            title: 'PR поддержка',
            subtitle:
                'У вас есть дизайн, которым вы хотели бы поделиться со всем миром? Поделитесь с нами, и мы расскажем о нем.',
            agreementText: 'Условия подписки',
            onTap: () {
              html.window.open(usloviyaPodpiski, 'new tab');
            },
          ),
          SizedBox(
            height: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Присоединяйтесь',
                      style: AppStyles.s32w700, textAlign: TextAlign.center),
                  const SizedBox(height: 30),
                  Material(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        html.window.open(
                            'https://www.instagram.com/desoto.ai', 'new tab');
                      },
                      child: SvgPicture.asset(AppAssets.svg.instagram,
                          height: 60, color: AppColors.red),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
                onTap: () {
                  html.window.open(politikaConf, 'new tab');
                },
                child: const Text('Политика \nконфиденциальности',
                    textAlign: TextAlign.center)),
            InkWell(
                onTap: () {
                  html.window.open(oferta, 'new tab');
                },
                child: const Text('Публичная оферта',
                    textAlign: TextAlign.center)),
            InkWell(
                onTap: () {
                  html.window.open(usloviyaPodpiski, 'new tab');
                },
                child:
                    const Text('Условия подписки', textAlign: TextAlign.center))
          ]),
          const SizedBox(height: 50),
          const SizedBox(
            width: 300,
            child: Text(
                'Контактные сведения:\narebro.eth@gmail.com\nАдрес: Казахстан, Зеленый Бор, УЛИЦА ШКОЛЬНАЯ, дом 4, кв/офис 2\nБИН (ИИН): 040313550642'),
          ),
          const SizedBox(height: 50),
          Center(
            child: Text('DESOTO 2024',
                style: AppStyles.s16w500.copyWith(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}

class FooterInfoMobileWidget extends StatelessWidget {
  const FooterInfoMobileWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.agreementText,
      required this.onTap});
  final String title;
  final String subtitle;
  final String agreementText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppStyles.s32w700, textAlign: TextAlign.center),
          const SizedBox(height: 20),
          Text(subtitle, style: AppStyles.s18w700, textAlign: TextAlign.center),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
