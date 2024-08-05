import 'package:desoto_web/presentation/common_widgets/strings.dart';
import 'package:desoto_web/presentation/common_widgets/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldVisiblePassword extends StatefulWidget {
  final FormFieldSetter<String>? onSaved;
  final InputDecoration? decoration;
  final bool? autofocus;
  final bool? enabled;
  final TextStyle? style;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String? label;

  const TextFormFieldVisiblePassword({
    super.key,
    this.onSaved,
    this.decoration,
    this.autofocus,
    this.enabled,
    this.style,
    this.onChanged,
    this.hintText,
    this.label,
  });

  @override
  State<StatefulWidget> createState() => _TextFormFieldVisiblePasswordState();
}

class _TextFormFieldVisiblePasswordState
    extends State<TextFormFieldVisiblePassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (value) => widget.onSaved!(value),
      obscureText: _obscureText,
      enabled: widget.enabled ?? true,
      style: widget.style,
      decoration: FormStyle.inputDecoration(
        hintText: widget.hintText,
        label: widget.label,
      ).copyWith(
        // contentPadding:
        //     const EdgeInsets.only(top: 18, bottom: 18, left: 15, right: 48),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 13),
          child: IconButton(
            splashRadius: 1,
            iconSize: 24,
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            color: Colors.black,
            onPressed: () => toggleShowPassword(),
          ),
        ),
      ),
      autofocus: widget.autofocus!,
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => value!.length < 8 ? formPassError : null,
    );
  }

  void toggleShowPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
