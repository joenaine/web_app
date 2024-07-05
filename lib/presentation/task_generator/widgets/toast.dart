import 'package:desoto_web/core/constants/app_assets.dart';
import 'package:desoto_web/core/constants/app_colors_const.dart';
import 'package:desoto_web/core/constants/app_styles_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ToastContainer extends StatelessWidget {
  const ToastContainer({
    super.key,
    required this.text,
    this.color = AppColors.dark,
  });
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.svg.checkSuccess),
          const SizedBox(width: 8),
          Flexible(
            child: Text(text,
                style: AppStyles.s16w500.copyWith(color: AppColors.white),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
