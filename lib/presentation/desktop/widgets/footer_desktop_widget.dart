import 'package:desoto_web/core/app_assets.dart';
import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:html' as html;

const String polzovatelSoglashenie =
    "https://docs.google.com/document/d/1MlSjmRNYlY2jiqSDGNuIv4U_LoMdK3inlLVsDGmr-i4/edit?usp=sharing";
const String oferta =
    "https://docs.google.com/document/d/1VowpZLnklgpxcN3HajhTl80nYrGWwyj7wxvwrckh2KA/edit#heading=h.um8sowdi6e84";
const String politikaConf =
    "https://docs.google.com/document/d/1VT2-2pPhLa517Z-LKZ7NqCmohyLVwxMuSBCqjBnSc4A/edit?usp=sharing";

class FooterDesktopWidget extends StatelessWidget {
  const FooterDesktopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FooterInfoWidget(
            title: 'О нас',
            onTap: () {
              html.window.open(politikaConf, 'new tab');
            },
            subtitle:
                'Ответы на часто \nзадаваемые вопросы о\nDesoto, о том, как он\nработает, и многое другое.',
            agreementText: 'Политика конфиденциальности',
          ),
          const SizedBox(height: 30),
          FooterInfoWidget(
            title: 'Партнерам',
            onTap: () {
              html.window.open(oferta, 'new tab');
            },
            subtitle:
                'Узнайте, как мы можем\nпомочь вашей компании\nпривлечь к разработке\nталантливых\nWeb-дизайнеров',
            agreementText: 'Публичная оферта',
          ),
          const SizedBox(height: 30),
          FooterInfoWidget(
            title: 'PR поддержка',
            onTap: () {
              html.window.open(polzovatelSoglashenie, 'new tab');
            },
            subtitle:
                'У вас есть дизайн,\nкоторым вы хотели бы поделиться\nсо всем миром?\nПоделитесь с нами, и мы\nрасскажем о нем.',
            agreementText: 'Пользователькое соглашение',
          ),
          SizedBox(
            height: 280,
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
                // const Text('Условия подписки', textAlign: TextAlign.center)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FooterInfoWidget extends StatelessWidget {
  const FooterInfoWidget(
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
      height: 280,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppStyles.s32w700, textAlign: TextAlign.center),
          const SizedBox(height: 30),
          Text(subtitle, style: AppStyles.s18w700, textAlign: TextAlign.center),
          const SizedBox(height: 40),
          InkWell(
              onTap: onTap,
              child: Text(agreementText, textAlign: TextAlign.center))
        ],
      ),
    );
  }
}
