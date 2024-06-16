import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:flutter/material.dart';

class SixthMobileWidget extends StatefulWidget {
  const SixthMobileWidget({
    super.key,
  });

  @override
  State<SixthMobileWidget> createState() => _SixthMobileWidgetState();
}

class _SixthMobileWidgetState extends State<SixthMobileWidget> {
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(30.0),
      height: 500,
      child: Center(
        child: Column(
          children: [
            const Text('Стань лучшим дизайнером',
                style: AppStyles.s32w700, textAlign: TextAlign.center),
            const SizedBox(height: 30),
            Text(
              'Будь в курсе всех обновлений',
              style: AppStyles.s24w600.copyWith(color: AppColors.primary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(height: 30),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Отправить почту',
                    style: AppStyles.s24w700.copyWith(color: AppColors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
