import 'package:desoto_web/core/constants/app_colors_const.dart';
import 'package:desoto_web/core/constants/app_styles_const.dart';
import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = AppColors.primary,
      this.isLoading = false,
      this.vertical = 12});

  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final bool? isLoading;
  final double? vertical;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      onPressed: onPressed,
      minWidth: double.infinity,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      padding: EdgeInsets.symmetric(vertical: vertical!),
      child: (isLoading!)
          ? const SizedBox(
              height: 21,
              width: 21,
              child: CircularProgressIndicator(
                  strokeWidth: 3, color: AppColors.white))
          : Text(text,
              textAlign: TextAlign.center,
              style: AppStyles.s24w600.copyWith(color: AppColors.white)),
    );
  }
}
