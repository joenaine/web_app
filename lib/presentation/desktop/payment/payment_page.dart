import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:desoto_web/infrastructure/payment/payment_repository.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 350,
        child: Column(
          children: [
            MaterialButton(
                minWidth: 400,
                padding: const EdgeInsets.all(16),
                color: AppColors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onPressed: () async {
                  await PaymentRepository.makeRequest();
                },
                child: Text('Pay',
                    style: AppStyles.s18w500.copyWith(color: AppColors.white))),
          ],
        ),
      ),
    );
  }
}
