import 'package:flutter/material.dart';
import 'package:imosys_flutter_package/imosys_flutter_package.dart';

class ImosysTextWidget extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final Color? color;
  final TextAlign? align;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final int? maxLines;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextStyle? style;
  final bool? hasShadow;
  final Color? shadowColor;
  final Offset? shadowOffset;
  final double? blurRadius;

  const ImosysTextWidget({
    super.key,
    required this.text,
      this.size,
      this.fontWeight,
      this.fontFamily,
      this.decoration,
      this.color,
      this.align,
      this.maxLines,
      this.overflow,
      this.letterSpacing,
      this.wordSpacing,
      this.style,
      this.hasShadow = false,
      this.shadowColor,
      this.shadowOffset,
      this.blurRadius,
  });

  @override
  Widget build(BuildContext context) {
    //configuration
    final config = ImosysAppWrapper.of(context);

    return Text(
      text,
      maxLines: maxLines,
      textAlign: align,
      softWrap: true,
      style: style ?? TextStyle(
        fontSize: size ?? config.defaultFontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        decoration: decoration,
        overflow: overflow,
        color: color ?? config.defaultFontColor,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        shadows: hasShadow != null
                ? [
                    Shadow(
                      color:
                          shadowColor ?? config.primaryColor.withValues(alpha: 0.15),
                      offset: shadowOffset ?? const Offset(2, 2),
                      blurRadius: blurRadius ?? 4,
                    )
                  ]
                : null,
      ),
    );
  }
}
