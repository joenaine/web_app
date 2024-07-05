import 'package:desoto_web/core/constants/app_colors_const.dart';
import 'package:desoto_web/core/constants/app_styles_const.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.passwordController,
    required this.hintText,
    this.validator,
    this.onChanged,
    this.formKey,
    this.onSaved,
    this.focusNode,
    this.onFieldSubmitted,
  });

  final TextEditingController? passwordController;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final Key? formKey;
  final FormFieldSetter<String>? onSaved;
  final FocusNode? focusNode;
  final ValueChanged<String?>? onFieldSubmitted;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late final TextEditingController controller;
  late final FocusNode focusNode;

  @override
  void initState() {
    controller = widget.passwordController ?? TextEditingController();
    focusNode = widget.focusNode ?? FocusNode();
    controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
          color: AppColors.form, borderRadius: BorderRadius.circular(4)),
      child: TextFormField(
        onFieldSubmitted: widget.onFieldSubmitted,
        focusNode: focusNode,
        onSaved: widget.onSaved,
        key: widget.formKey,
        onChanged: widget.onChanged,
        validator: widget.validator,
        controller: widget.passwordController,
        textAlign: TextAlign.start,
        obscureText: !isVisible,
        decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            alignLabelWithHint: false,
            labelText: widget.hintText,
            border: const UnderlineInputBorder(),
            labelStyle: AppStyles.s16w400.copyWith(color: AppColors.gray)),
        style: AppStyles.s16w400,
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.suffixIcon,
      this.isEnabled = false,
      this.prefixIcon,
      this.keyboardType,
      this.maxlines = 1,
      this.onTap,
      this.initialValue,
      this.inputFormatters,
      this.onChanged,
      this.bottom = 16,
      this.onSaved,
      this.hintTextWithoutLabel,
      this.isLabelEnabled = true,
      this.maxLength,
      this.autofocus = false,
      this.verticalPadding = 9,
      this.isDisabled = false,
      this.validator,
      this.onFieldSubmitted,
      this.focusNode,
      this.borderRadius});
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final bool isEnabled;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final int? maxlines;
  final GestureTapCallback? onTap;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final double? bottom;
  final FormFieldSetter<String>? onSaved;
  final String? hintTextWithoutLabel;
  final bool? isLabelEnabled;
  final double? verticalPadding;
  final int? maxLength;
  final bool autofocus;
  final bool? isDisabled;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onFieldSubmitted;
  final FocusNode? focusNode;
  final BorderRadiusGeometry? borderRadius;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.bottom!),
      padding: const EdgeInsets.only(left: 12, right: 12),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.grayLight),
          color: AppColors.form,
          borderRadius: widget.borderRadius),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        validator: widget.validator,
        autofocus: widget.autofocus,
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        inputFormatters: widget.inputFormatters,
        initialValue: widget.initialValue,
        onTap: widget.onTap,
        maxLines: widget.maxlines,
        keyboardType: widget.keyboardType,
        readOnly: widget.isEnabled,
        maxLength: widget.maxLength,
        controller: widget.controller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: widget
                  .verticalPadding!), //Change this value to custom as you like
          isDense: true,
          prefixIconConstraints:
              const BoxConstraints(minHeight: 20, minWidth: 20),
          suffixIconConstraints:
              const BoxConstraints(minHeight: 24, minWidth: 24),
          prefixIcon: widget.prefixIcon,
          disabledBorder: InputBorder.none,
          suffixIcon: widget.suffixIcon,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          alignLabelWithHint: false,
          labelText: (widget.isLabelEnabled!) ? widget.hintText : null,
          hintText: widget.hintTextWithoutLabel,
          border: const UnderlineInputBorder(),
          labelStyle: AppStyles.s16w400.copyWith(color: AppColors.gray),
        ),
        style: AppStyles.s16w400.copyWith(
            color: !widget.isDisabled! ? AppColors.dark : AppColors.grayLight),
      ),
    );
  }
}
