import 'package:flutter/material.dart';
import 'package:imosys_flutter_package/imosys_flutter_package.dart';

class ImosysDivider extends StatelessWidget {
  final String? text;
  final Color? color;
  final Color? textColor;
  final double thickness;
  final double height;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  final double textHorizontalSpacing;

  const ImosysDivider({
    super.key,
    this.text,
    this.color,
    this.textColor,
    this.thickness = 1,
    this.height = 24,
    this.margin,
    this.textStyle,
    this.textHorizontalSpacing = 10,
  });

  @override
  Widget build(BuildContext context) {
    final config = ImosysAppWrapper.of(context);
    final isDarkTheme = config.themeMode == ThemeMode.dark ||
        (config.themeMode == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == Brightness.dark) ||
        config.isDarkMode;
    final dividerColor = color ??
        config.defaultBorderColor ??
        (isDarkTheme
            ? config.semanticColors.onSurface.withValues(alpha: 0.24)
            : config.semanticColors.onSurface.withValues(alpha: 0.14));

    final baseDivider = Divider(
      color: dividerColor,
      thickness: thickness,
      height: height,
    );

    if (text == null || text!.trim().isEmpty) {
      return Padding(
        padding: margin ?? EdgeInsets.zero,
        child: baseDivider,
      );
    }

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(child: baseDivider),
          SizedBox(width: textHorizontalSpacing),
          ImosysTextWidget(
            text: text!,
            style: textStyle,
            color: textStyle?.color ??
                textColor ??
                (isDarkTheme
                    ? config.semanticColors.onSurface
                    : config.defaultFontColor),
          ),
          SizedBox(width: textHorizontalSpacing),
          Expanded(child: baseDivider),
        ],
      ),
    );
  }
}
