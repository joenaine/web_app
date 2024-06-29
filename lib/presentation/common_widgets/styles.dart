import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'colors.dart';

class FormStyle {
  static List<TextSpan> get requireField {
    return [
      TextSpan(
          text: ' *',
          style: const TextStyle(color: RED_COLOR)
              .merge(FormStyle.defaultFontStyle))
    ];
  }

  static TextStyle get defaultFontStyle {
    return const TextStyle(
      letterSpacing: -0.05,
    );
  }

  static TextStyle get labelInput {
    return const TextStyle(
      color: Colors.grey,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.05,
    );
  }

  static TextStyle get textStyle {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.05,
    );
  }

  static BoxDecoration infoBlocDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.05),
          offset: Offset(0, 4),
          blurRadius: 4,
        )
      ],
      color: Colors.grey[200],
    );
  }

  static InputDecoration inputDecoration({
    bool enable = true,
    // bool hasIcon = false,
    String? hintText = "",
    String? label,
    bool isRequired = false,
    // bool isDisabled = false,
    String? suffix,
    bool isDropDown = false,
    Function? onPressed,
    Color? fillColor,
    Function? clearButtonOnPressed,
  }) {
    return InputDecoration(
      counterText: "",
      filled: enable,
      enabled: enable,
      label: label == null
          ? null
          : FittedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: RichText(
                  text: TextSpan(
                    text: label,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    children: isRequired ? FormStyle.requireField : null,
                  ),
                ),
              ),
            ),
      errorStyle: const TextStyle(fontSize: 10),
      prefix: const SizedBox(width: 13),
      suffixIcon: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          clearButtonOnPressed != null
              ? IconButton(
                  onPressed: () => clearButtonOnPressed(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  splashRadius: 10,
                  iconSize: 20,
                  icon: const Icon(
                    Icons.close,
                    color: blackFormColor,
                  ),
                )
              : const SizedBox.shrink(),
          clearButtonOnPressed != null
              ? const SizedBox(width: 5)
              : const SizedBox.shrink(),
          Flexible(
            child: GestureDetector(
              onTap: onPressed == null ? null : () => onPressed(),
              child: Padding(
                padding: const EdgeInsets.only(right: 13),
                child: isDropDown
                    ? Icon(
                        Icons.arrow_drop_down,
                        color: enable ? Colors.black : Colors.grey,
                      )
                    : suffix == null
                        ? null
                        : SvgPicture.asset(
                            suffix,
                            color: enable ? Colors.black : Colors.grey,
                          ),
              ),
            ),
          ),
        ],
      ),
      suffixIconConstraints: BoxConstraints.loose(clearButtonOnPressed != null
          ? const Size(62, 37)
          : const Size(37, 37)),
      fillColor: fillColor ?? Colors.white,
      isDense: true,
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: blackFormColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      errorMaxLines: 2,
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: blackFormColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      contentPadding: const EdgeInsets.only(top: 13, bottom: 13, right: 13),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: blackFormColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: blackFormColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      hintText: hintText,
      hintStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
    );
  }

  static InputDecoration phoneInputDecoration(
      {bool enable = true, bool hasIcon = false}) {
    return InputDecoration(
      counterText: "",
      filled: true,
      // hide error message
      fillColor: const Color(0xFFFFE988),
      isDense: true,
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
          color: Color(0xFFFFE988),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      errorMaxLines: 1,
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
          color: Color(0xFFFFE988),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      contentPadding:
          EdgeInsets.only(top: 15, bottom: 15, right: hasIcon ? 5 : 23),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
          color: Color(0xFFFFE988),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
          color: Color(0xFFFFE988),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
          color: Color(0xFFFFE988),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      hintText: '+7 (___) ___-__-__',
    );
  }
}
