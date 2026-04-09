import 'package:flutter/material.dart';
import 'package:imosys_flutter_package/imosys_flutter_package.dart';

class ImosysBadge extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final double? textSize;
  final FontWeight? textWeight;

  const ImosysBadge({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.margin,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.textSize,
    this.textWeight,
  });

  @override
  Widget build(BuildContext context) {
    final config = ImosysAppWrapper.of(context);
    final isDarkTheme = config.themeMode == ThemeMode.dark ||
        (config.themeMode == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == Brightness.dark) ||
        config.isDarkMode;

    return Container(
      margin: margin,
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: config.space(ImosysSpacingPreset.sm) + 2,
            vertical: config.space(ImosysSpacingPreset.xs),
          ),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (isDarkTheme
                ? config.semanticColors.info.withValues(alpha: 0.24)
                : config.semanticColors.info.withValues(alpha: 0.12)),
        borderRadius: BorderRadius.circular(
          borderRadius ?? config.defaultContainerRadius,
        ),
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
                width: borderWidth ?? 1,
              )
            : null,
      ),
      child: ImosysTextWidget(
        text: text,
        size: textSize ?? (config.defaultFontSize - 1),
        fontWeight: textWeight ?? FontWeight.w600,
        color: textColor ?? config.semanticColors.info,
      ),
    );
  }
}
