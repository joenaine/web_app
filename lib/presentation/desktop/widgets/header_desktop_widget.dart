import 'package:desoto_web/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeaderDesktopWidget extends StatelessWidget {
  const HeaderDesktopWidget({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'DESOTO',
          style: AppStyles.s24w700,
        ),
        Row(
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  scrollController.animateTo(
                    3500,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Тарифы',
                    style: AppStyles.s16w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 40),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  context.go('/auth');
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Войти',
                    style: AppStyles.s16w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 40),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  context.go('/registration');
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Регистрация',
                    style: AppStyles.s16w500,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
