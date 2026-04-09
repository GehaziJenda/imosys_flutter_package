import 'package:flutter/material.dart';
import 'package:imosys_flutter_package/imosys_flutter_package.dart';

class ImosysLoader extends StatelessWidget {
  final double? size;
  final double? strokeWidth;
  final Color? color;
  final String? message;
  final double? messageSpacing;
  final TextStyle? messageStyle;
  final MainAxisAlignment mainAxisAlignment;

  const ImosysLoader({
    super.key,
    this.size,
    this.strokeWidth,
    this.color,
    this.message,
    this.messageSpacing,
    this.messageStyle,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final config = ImosysAppWrapper.of(context);
    final isDarkTheme = config.themeMode == ThemeMode.dark ||
        (config.themeMode == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == Brightness.dark) ||
        config.isDarkMode;
    final indicatorColor =
        color ?? config.circularProgressColor ?? config.semanticColors.info;

    final loader = SizedBox(
      width: size ?? 24,
      height: size ?? 24,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 3,
        color: indicatorColor,
      ),
    );

    if (message == null || message!.trim().isEmpty) {
      return loader;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        loader,
        SizedBox(width: messageSpacing ?? config.space(ImosysSpacingPreset.sm)),
        Flexible(
          child: ImosysTextWidget(
            text: message!,
            style: messageStyle,
            color: messageStyle?.color ??
                (isDarkTheme
                    ? config.semanticColors.onSurface
                    : config.defaultFontColor),
          ),
        ),
      ],
    );
  }
}
