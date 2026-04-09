import 'package:flutter/material.dart';
import 'package:imosys_flutter_package/imosys_flutter_package.dart';

class ImosysCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final List<BoxShadow>? boxShadow;
  final VoidCallback? onTap;

  const ImosysCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.boxShadow,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final config = ImosysAppWrapper.of(context);
    final isDarkTheme = config.themeMode == ThemeMode.dark ||
        (config.themeMode == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == Brightness.dark) ||
        config.isDarkMode;

    final card = Container(
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.all(config.space(ImosysSpacingPreset.md)),
      decoration: BoxDecoration(
        color: color ??
            (isDarkTheme
                ? config.semanticColors.surface
                : config.semanticColors.background),
        border: Border.all(
          color: borderColor ??
              config.defaultBorderColor ??
              config.semanticColors.onSurface.withValues(alpha: 0.12),
          width: borderWidth ?? 1,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius ?? config.defaultContainerRadius,
        ),
        boxShadow: boxShadow,
      ),
      child: child,
    );

    if (onTap == null) {
      return card;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(
        borderRadius ?? config.defaultContainerRadius,
      ),
      onTap: onTap,
      child: card,
    );
  }
}
