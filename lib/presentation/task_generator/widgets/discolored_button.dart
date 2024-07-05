import 'package:desoto_web/core/constants/app_colors_const.dart';
import 'package:desoto_web/core/constants/app_styles_const.dart';
import 'package:flutter/material.dart';

class DiscoloredButton extends StatelessWidget {
  const DiscoloredButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isAddIcon = false,
    this.color = AppColors.primary,
  });
  final String text;
  final VoidCallback onPressed;
  final bool? isLoading;
  final bool? isAddIcon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: color!)),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: (isLoading!)
          ? const SizedBox(
              height: 21,
              width: 21,
              child: CircularProgressIndicator(
                  strokeWidth: 3, color: AppColors.white))
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppStyles.s16w500.copyWith(color: color),
                ),
              ],
            ),
    );
  }
}
