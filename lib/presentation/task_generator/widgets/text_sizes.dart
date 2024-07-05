import 'package:desoto_web/core/constants/app_colors_const.dart';
import 'package:desoto_web/core/constants/app_styles_const.dart';
import 'package:flutter/material.dart';

class Text24 extends StatelessWidget {
  const Text24({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppStyles.s24w600);
  }
}

class TextS14W500 extends StatelessWidget {
  const TextS14W500({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.s14w500,
    );
  }
}

class TextS16W500 extends StatelessWidget {
  const TextS16W500({
    super.key,
    required this.text,
    this.color = AppColors.dark,
  });
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.s16w500.copyWith(color: color),
    );
  }
}
