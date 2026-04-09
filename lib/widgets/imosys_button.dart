import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:imosys_flutter_package/imosys_flutter_package.dart';

class ImosysButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final Color? textColor;
  final String? textFontFamily;
  final FontWeight? textFontWeight;
  final bool? hasBorder;
  final Color? borderColor;
  final double? width;
  final String? image;
  final IconData? icon;
  final Color? iconColor;
  final double? borderRadius;
  final double? textSize;
  final double? borderWidth;
  final double? elevation;
  final double? verticalPadding;
  final double? imageHeight;
  final double? imageWidth;
  final double? iconSize;
  final TextAlign? textAlign;
  const ImosysButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.color,
      this.textFontFamily,
      this.textFontWeight,
      this.textColor,
      this.hasBorder,
      this.borderColor,
      this.image,
      this.width,
      this.icon,
      this.iconColor,
      this.borderRadius,
      this.textSize,
      this.borderWidth,
      this.elevation,
      this.verticalPadding,
      this.imageHeight,
      this.textAlign,
      this.imageWidth, this.iconSize});

  @override
  Widget build(BuildContext context) {
    final config = ImosysAppWrapper.of(context);
    final isDarkTheme = config.themeMode == ThemeMode.dark ||
        (config.themeMode == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == Brightness.dark) ||
        config.isDarkMode;
    final resolvedBackgroundColor =
        color ?? config.primaryButtonBackgroundColor ?? config.semanticColors.info;
    final resolvedBorderColor = borderColor ??
        config.defaultBorderColor ??
        config.semanticColors.onSurface.withValues(alpha: isDarkTheme ? 0.28 : 0.16);
    final resolvedTextColor =
        textColor ?? config.primaryButtonTextColor ?? config.semanticColors.onPrimary;

    return (elevation != null && elevation! > 0) ||
            (config.primaryButtonHasElevation != null &&
                config.primaryButtonHasElevation!)
        ? ElevatedButton(
            onPressed: () {
              onTap.call();
            },
            style: TextButton.styleFrom(
              backgroundColor: resolvedBackgroundColor,
              elevation: elevation ?? 1,
              shape: RoundedRectangleBorder(
                side: hasBorder != null && hasBorder!
                    ? BorderSide(
                        color: resolvedBorderColor,
                        width: borderWidth ?? 1,
                      )
                    : BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    borderRadius ?? config.defaultContainerRadius,
                  ),
                ),
              ),
            ),
            child: buttonChild(config, context, resolvedTextColor),
          )
        : TextButton(
            onPressed: () {
              onTap.call();
            },
            style: TextButton.styleFrom(
              backgroundColor: resolvedBackgroundColor,
              elevation: elevation,
              shape: RoundedRectangleBorder(
                side: hasBorder != null && hasBorder!
                    ? BorderSide(
                        color: resolvedBorderColor,
                        width: borderWidth ?? 1,
                      )
                    : BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    borderRadius ?? config.defaultContainerRadius,
                  ),
                ),
              ),
            ),
            child: buttonChild(config, context, resolvedTextColor),
          );
  }

  Widget buttonChild(
    ImosysConfig config,
    BuildContext context,
    Color resolvedTextColor,
  ) {
    return width == null && config.primaryButtonDefaultWidth == null
        ? Padding(
            padding: EdgeInsets.symmetric(
                vertical: verticalPadding ??
                    config.primaryButtonVerticalPadding ??
                    3.0),
            child: Center(
              child: image == null && icon == null
                  ? ImosysTextWidget(
                      text: text,
                      size: textSize ?? config.primaryButtonFontSize,
                      fontFamily:
                          textFontFamily ?? config.primaryButtonTextFontFamily,
                      fontWeight: textFontWeight,
                      align: textAlign,
                      color: resolvedTextColor)
                  : icon == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ExtendedImage.asset(
                              image!,
                              height: imageHeight ?? 20,
                              width: imageWidth,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ImosysTextWidget(
                                text: text,
                                size: textSize ?? config.primaryButtonFontSize,
                                fontFamily: textFontFamily ??
                                    config.primaryButtonTextFontFamily,
                                fontWeight: textFontWeight,
                                align: textAlign,
                                color: resolvedTextColor)
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              icon,
                              color: iconColor,
                              size: iconSize ?? 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ImosysTextWidget(
                              text: text,
                              size: textSize ?? config.primaryButtonFontSize,
                              fontFamily: textFontFamily ??
                                  config.primaryButtonTextFontFamily,
                              fontWeight: textFontWeight,
                              align: textAlign,
                              color: resolvedTextColor,
                            ),
                          ],
                        ),
            ),
          )
        : SizedBox(
            width: width ??
                config.primaryButtonDefaultWidth ??
                MediaQuery.of(context).size.width * 0.5,
            //height: 25,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: verticalPadding ??
                      config.primaryButtonVerticalPadding ??
                      3.0),
              child: Center(
                child: image == null && icon == null
                    ? ImosysTextWidget(
                        text: text,
                        size: textSize ?? config.primaryButtonFontSize,
                        fontFamily: textFontFamily ??
                            config.primaryButtonTextFontFamily,
                        fontWeight: textFontWeight,
                        align: textAlign,
                        color: resolvedTextColor,
                      )
                    : icon == null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ExtendedImage.asset(image!, height: imageHeight ?? 20, width: imageWidth,),
                              const SizedBox(
                                width: 10,
                              ),
                              ImosysTextWidget(
                                text: text,
                                size: textSize ?? config.primaryButtonFontSize,
                                fontFamily: textFontFamily ??
                                    config.primaryButtonTextFontFamily,
                                fontWeight: textFontWeight,
                                align: textAlign,
                                color: resolvedTextColor,
                              )
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                icon,
                                color: iconColor,
                                size: iconSize ?? 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ImosysTextWidget(
                                text: text,
                                size: textSize ?? config.primaryButtonFontSize,
                                fontFamily: textFontFamily ??
                                    config.primaryButtonTextFontFamily,
                                fontWeight: textFontWeight,
                                align: textAlign,
                                color: resolvedTextColor,
                              ),
                            ],
                          ),
              ),
            ),
          );
  }
}
