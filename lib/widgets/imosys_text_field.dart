import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:imosys_flutter_package/imosys_flutter_package.dart';

class ImosysTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String? label;
  final bool? dontShowText;
  final List<String>? items;
  final double? dropdownWidth;
  final Color? dropdownColor;
  final TextInputType? inputType;
  final VoidCallback? toggleObscure;
  final Function(String?)? onChange;
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
      required this.controller,
      this.label,
      this.items,
      this.dropdownWidth,
      this.dropdownColor,
      this.toggleObscure,
      this.dontShowText,
      this.textCapitalization,
      this.onChange,
      this.autoCorrect,
      this.prefixText,
      this.cursorColor,
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
          items == null
              ? textField(config)
              : DropdownButton2(
                  customButton: containerTextField(config),
                  value: controller.text,
                  underline: const SizedBox.shrink(),
                  onChanged: onChange,
                  items: items!.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: ImosysTextWidget(
                        text: item,
                        color: fontColor,
                      ),
                    );
                  }).toList(),
                  dropdownStyleData: DropdownStyleData(
                    width: dropdownWidth ?? 200,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: dropdownColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                            borderRadius ?? config.defaultContainerRadius),
                      ),
                    ),
                    offset: const Offset(0, 2),
                  ),
                )
        ],
      ),
    );
  }

  Widget textField(ImosysConfig config) {
    return TextField(
      onTap: onTap != null
          ? () {
              onTap?.call();
            }
          : null,
      controller: controller,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      minLines: minLines,
      cursorColor: cursorColor ?? config.cursorColor ?? config.primaryColor,
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
                icon: Icon(
                    dontShowText! ? Icons.visibility : Icons.visibility_off),
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
          color: hintFontColor ??
              config.defaultHintColor ??
              config.defaultFontColor,
        ),
        fillColor: hasFill
            ? fillColor ?? config.defaultTextFieldFillColor ?? Colors.white
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? config.defaultContainerRadius),
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
            Radius.circular(borderRadius ?? config.defaultContainerRadius),
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
            Radius.circular(borderRadius ?? config.defaultContainerRadius),
          ),
          borderSide: hasBorder
              ? BorderSide(
                  width: 1,
                  color: focusedBorderColor ?? config.primaryColor,
                )
              : BorderSide.none,
        ),
      ),
    );
  }

  Widget containerTextField(ImosysConfig config) {
    return Container(
      width: double.infinity,
      height: 56,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: hasFill
            ? fillColor ?? config.defaultTextFieldFillColor ?? Colors.white
            : null,
        border: hasBorder
            ? Border.all(
                color: borderColor ??
                    config.defaultBorderColor ??
                    config.primaryColor,
              )
            : null,
        borderRadius: BorderRadius.all(
          Radius.circular(
            borderRadius ?? config.defaultContainerRadius,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImosysTextWidget(
            text: controller.text.isEmpty ? hint : controller.text,
            color: controller.text.isEmpty
                ? hintFontColor ?? config.defaultHintColor
                : fontColor ?? config.defaultFontColor,
          ),
          if (suffixIcon != null) ...[suffixIcon!],
        ],
      ),
    );
  }
}
