import 'package:another_flushbar/flushbar_helper.dart';
import 'package:desoto_web/core/app_colors.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:desoto_web/infrastructure/payment/one_vision_service.dart';
import 'package:desoto_web/infrastructure/payment/payment_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

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
                  // await PaymentRepository.makeRequestVoid(
                  //     email: FirebaseAuth.instance.currentUser!.email!,
                  //     orderId: '25');
                  final result = await OneVisionPayService().makePayment(
                    email: FirebaseAuth.instance.currentUser!.email!,
                  );

                  result.fold(
                      (l) =>
                          FlushbarHelper.createError(message: l).show(context),
                      (r) {
                    html.window.open(r, 'new tab');
                  });
                },
                child: Text('Pay',
                    style: AppStyles.s18w500.copyWith(color: AppColors.white))),
          ],
        ),
      ),
    );
  }
}
