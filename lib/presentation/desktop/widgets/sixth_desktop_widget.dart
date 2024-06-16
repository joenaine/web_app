import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:flutter/material.dart';

class SixthDesktopWidget extends StatefulWidget {
  const SixthDesktopWidget({
    super.key,
  });

  @override
  State<SixthDesktopWidget> createState() => _SixthDesktopWidgetState();
}

class _SixthDesktopWidgetState extends State<SixthDesktopWidget> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50.0),
      height: 500,
      child: Center(
        child: Column(
          children: [
            const Text('Стань лучшим дизайнером', style: AppStyles.s56w700),
            const SizedBox(height: 30),
            Text(
              'Присоединяйся к рассылке\nБудь в курсе всех обновлений',
              style: AppStyles.s24w600.copyWith(color: AppColors.primary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: emailController,
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
