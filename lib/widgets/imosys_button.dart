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
  const ImosysButton({
    super.key,
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
  });

  @override
  Widget build(BuildContext context) {
    final config = ImosysAppWrapper.of(context);
    return (elevation != null && elevation! > 0) ||
            (config.primaryButtonHasElevation != null &&
                config.primaryButtonHasElevation!)
        ? ElevatedButton(
            onPressed: () {
              onTap.call();
            },
            style: TextButton.styleFrom(
              backgroundColor: color ?? config.primaryButtonBackgroundColor,
              elevation: elevation ?? 1,
              shape: RoundedRectangleBorder(
                side: hasBorder != null && hasBorder!
                    ? BorderSide(
                        color: borderColor ??
                            config.defaultBorderColor ??
                            config.primaryColor,
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
            child: buttonChild(config, context),
          )
        : TextButton(
            onPressed: () {
              onTap.call();
            },
            style: TextButton.styleFrom(
              backgroundColor: color ?? config.primaryButtonBackgroundColor,
              elevation: elevation,
              shape: RoundedRectangleBorder(
                side: hasBorder != null && hasBorder!
                    ? BorderSide(
                        color: borderColor ??
                            config.defaultBorderColor ??
                            config.primaryColor,
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
            child: buttonChild(config, context),
          );
  }

  Widget buttonChild(ImosysConfig config, BuildContext context) {
    return width == null && config.primaryButtonDefaultWidth == null
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Center(
              child: image == null && icon == null
                  ? ImosysTextWidget(
                      text: text,
                      size: textSize ?? config.primaryButtonFontSize,
                      fontFamily: textFontFamily ?? config.primaryButtonTextFontFamily,
                      fontWeight: textFontWeight,
                      color: textColor ?? config.primaryButtonTextColor)
                  : icon == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ExtendedImage.asset(image!),
                            const SizedBox(
                              width: 10,
                            ),
                            ImosysTextWidget(
                                text: text,
                                size: textSize ?? config.primaryButtonFontSize,
                                fontFamily: textFontFamily ??
                                    config.primaryButtonTextFontFamily,
                                fontWeight: textFontWeight,
                                color:
                                    textColor ?? config.primaryButtonTextColor)
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              icon,
                              color: iconColor,
                              size: 20,
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
                              color: textColor ?? config.primaryButtonTextColor,
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
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: Center(
                child: image == null && icon == null
                    ? ImosysTextWidget(
                        text: text,
                        size: textSize ?? config.primaryButtonFontSize,
                        fontFamily: textFontFamily ??
                            config.primaryButtonTextFontFamily,
                        fontWeight: textFontWeight,
                        color: textColor ?? config.primaryButtonTextColor,
                      )
                    : icon == null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ExtendedImage.asset(image!),
                              const SizedBox(
                                width: 10,
                              ),
                              ImosysTextWidget(
                                text: text,
                                size: textSize ?? config.primaryButtonFontSize,
                                fontFamily: textFontFamily ??
                                    config.primaryButtonTextFontFamily,
                                fontWeight: textFontWeight,
                                color: textColor ??
                                    ImosysAppWrapper.of(context)
                                        .primaryButtonTextColor,
                              )
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                icon,
                                color: iconColor,
                                size: 20,
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
                                color:
                                    textColor ?? config.primaryButtonTextColor,
                              ),
                            ],
                          ),
              ),
            ),
          );
  }
}
