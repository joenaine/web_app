import 'package:desoto_web/core/constants/app_colors_const.dart';
import 'package:desoto_web/core/constants/app_styles_const.dart';
import 'package:flutter/material.dart';

class TextSize {
  static Widget s18w700(String text) {
    return Text(text, style: AppStyles.s18w700);
  }

  static Widget s24w700(String text) {
    return Text(text, style: AppStyles.s24w700);
  }

  static Widget s56w700(String text) {
    return Text(
      text,
      style: AppStyles.s56w700,
      textAlign: TextAlign.center,
    );
  }

  static Widget s32w700(String text, {TextAlign textAlign = TextAlign.center}) {
    return SelectableText(
      text,
      style: AppStyles.s32w700,
      textAlign: textAlign,
    );
  }

  static Widget s40w700(String text, {TextAlign textAlign = TextAlign.center}) {
    return SelectableText(
      text,
      style: AppStyles.s40w700,
      textAlign: textAlign,
    );
  }

  static Widget s14w500(String text,
      {Color? color = AppColors.gray, TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      style: AppStyles.s14w500.copyWith(color: color),
      textAlign: textAlign,
    );
  }

  static Widget s12w400(String text, {Color? color = AppColors.gray}) {
    return Text(text, style: AppStyles.s12w400.copyWith(color: color));
  }

  static Widget s12w500(String text,
      {Color? color = AppColors.gray, TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      style: AppStyles.s12w500.copyWith(color: color),
      textAlign: textAlign,
    );
  }

  static Widget s14w700(String text, {Color? color = AppColors.gray}) {
    return Text(text, style: AppStyles.s14w700.copyWith(color: color));
  }

  static Widget s16w500(String text, {Color? color = AppColors.dark}) {
    return Text(text, style: AppStyles.s16w500.copyWith(color: color));
  }

  static Widget s16w700(String text) {
    return Text(text, style: AppStyles.s16w700);
  }

  static Widget s16w400(String text,
      {Color? color = AppColors.gray, TextAlign? textAlign}) {
    return SelectableText(
      text,
      style: AppStyles.s16w400.copyWith(
        color: color,
      ),
      textAlign: textAlign,
    );
  }

  static Widget s10w400(String text, {Color? color = AppColors.gray}) {
    return Text(text, style: AppStyles.s10w400.copyWith(color: color));
  }

  static Widget s8w400(String text, {Color? color = AppColors.gray}) {
    return Text(text, style: AppStyles.s8w400.copyWith(color: color));
  }
}
