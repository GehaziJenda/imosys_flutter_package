import 'package:flutter/material.dart';
import 'package:imosys_flutter_package/imosys_flutter_package.dart';

class ImosysTextField extends StatelessWidget {
  final String hint;
  final String? label;
  final TextEditingController controller;
  final bool? dontShowText;
  final TextInputType? inputType;
  final VoidCallback? toggleObscure;
  final Function(String)? onChange;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool? autoCorrect;
  final String? prefixText;
  final TextCapitalization? textCapitalization;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final double? width;
  final Color? hintFontColor;
  final Color? fontColor;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? borderColor;
  final bool hasBorder;
  final Color? cursorColor;
  final double? borderRadius;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  final bool hasFill;

  const ImosysTextField(
      {super.key,
      required this.hint,
      this.label,
      this.toggleObscure,
      this.dontShowText,
      this.textCapitalization,
      this.onChange,
      this.autoCorrect,
      this.prefixText,
      this.cursorColor,
      required this.controller,
      this.inputType,
      this.maxLength,
      this.maxLines,
      this.minLines,
      this.prefixIcon,
      this.suffixIcon,
      this.fontSize,
      this.textInputAction,
      this.onTap,
      this.width,
      this.fontColor,
      this.fontFamily,
      this.fontWeight,
      this.hintFontColor,
      this.borderColor,
      this.hasBorder = true,
      this.borderRadius,
      this.errorBorderColor,
      this.focusedBorderColor,
      this.hasFill = false,
      this.fillColor});

  @override
  Widget build(BuildContext context) {
    //configuration
    final config = ImosysAppWrapper.of(context);

    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onTap: onTap != null
                ? () {
                    onTap?.call();
                  }
                : null,
            controller: controller,
            maxLength: maxLength,
            maxLines: maxLines ?? 1,
            minLines: minLines,
            cursorColor:
                cursorColor ?? config.cursorColor ?? config.primaryColor,
            autocorrect: autoCorrect ?? true,
            readOnly: onTap != null,
            keyboardType: inputType,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            obscureText: dontShowText ?? false,
            textInputAction: textInputAction ?? TextInputAction.done,
            onChanged: onChange,
            style: TextStyle(
                fontFamily: fontFamily ?? config.defaultFontFamily,
                fontSize: fontSize ?? config.defaultFontSize,
                color: fontColor ?? config.defaultFontColor,
                fontWeight: fontWeight),
            decoration: InputDecoration(
              counterText: "",
              filled: hasFill,
              prefixIcon: prefixIcon,
              labelText: label,
              hintText: hint,
              suffixIcon: dontShowText != null
                  ? IconButton(
                      icon: Icon(dontShowText!
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        if (toggleObscure != null) {
                          toggleObscure!.call();
                        }
                      },
                    )
                  : suffixIcon,
              prefix: prefixText != null
                  ? ImosysTextWidget(
                      text: "$prefixText ",
                      fontFamily: fontFamily ?? config.defaultFontFamily,
                      size: fontSize ?? config.defaultFontSize,
                      color: fontColor ?? config.defaultFontColor,
                    )
                  : null,
              hintStyle: TextStyle(
                fontFamily: fontFamily ?? config.defaultFontFamily,
                fontSize: fontSize ?? config.defaultFontSize,
                color: hintFontColor ?? config.defaultFontColor,
              ),
              fillColor: hasFill
                  ? fillColor ??
                      config.defaultTextFieldFillColor ??
                      Colors.white
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                      borderRadius ?? config.defaultContainerRadius),
                ),
                borderSide: hasBorder
                    ? BorderSide(
                        width: 1,
                        color: borderColor ??
                            config.defaultBorderColor ??
                            config.primaryColor,
                      )
                    : BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    borderRadius ?? config.defaultContainerRadius,
                  ),
                ),
                borderSide: hasBorder
                    ? BorderSide(
                        width: 1,
                        color: borderColor ??
                            config.defaultBorderColor ??
                            config.primaryColor,
                      )
                    : BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                      borderRadius ?? config.defaultContainerRadius),
                ),
                borderSide: hasBorder
                    ? BorderSide(
                        width: 1,
                        color: errorBorderColor ?? Colors.red,
                      )
                    : BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                      borderRadius ?? config.defaultContainerRadius),
                ),
                borderSide: hasBorder
                    ? BorderSide(
                        width: 1,
                        color: focusedBorderColor ?? config.primaryColor,
                      )
                    : BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
