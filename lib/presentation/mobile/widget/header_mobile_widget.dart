import 'package:desoto_web/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeaderMobileWidget extends StatelessWidget {
  const HeaderMobileWidget({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 40),
        const Text(
          'DESOTO',
          style: AppStyles.s32w700,
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  _scrollController.animateTo(
                    3780,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: const Text(
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
            const Text(
              'Регистрация',
              style: AppStyles.s16w500,
            )
          ],
        )
      ],
    );
  }
}
