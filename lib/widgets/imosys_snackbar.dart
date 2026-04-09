import 'package:flutter/material.dart';
import 'package:imosys_flutter_package/imosys_flutter_package.dart';

class ImosysSnackbar extends SnackBar {
  ImosysSnackbar({
    super.key,
    required BuildContext context,
    required String message,
    Color? backgroundColor,
    Color? textColor,
    Duration? duration,
    SnackBarAction? action,
    SnackBarBehavior? behavior,
    EdgeInsetsGeometry? margin,
    ShapeBorder? shape,
  }) : super(
          // Snapshot config values once for consistent defaults.
          content: ImosysTextWidget(
            text: message,
            color: textColor ?? ImosysAppWrapper.of(context).semanticColors.onPrimary,
          ),
          backgroundColor:
              backgroundColor ?? ImosysAppWrapper.of(context).semanticColors.info,
          duration: duration ?? const Duration(seconds: 3),
          action: action,
          behavior: behavior ?? SnackBarBehavior.floating,
          margin: margin ??
              EdgeInsets.all(
                ImosysAppWrapper.of(context).space(ImosysSpacingPreset.md),
              ),
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  ImosysAppWrapper.of(context).defaultContainerRadius,
                ),
              ),
        );

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show({
    required BuildContext context,
    required String message,
    Color? backgroundColor,
    Color? textColor,
    Duration? duration,
    SnackBarAction? action,
    SnackBarBehavior? behavior,
    EdgeInsetsGeometry? margin,
    ShapeBorder? shape,
    bool clearCurrent = true,
  }) {
    final messenger = ScaffoldMessenger.of(context);

    if (clearCurrent) {
      messenger.clearSnackBars();
    }

    return messenger.showSnackBar(
      ImosysSnackbar(
        context: context,
        message: message,
        backgroundColor: backgroundColor,
        textColor: textColor,
        duration: duration,
        action: action,
        behavior: behavior,
        margin: margin,
        shape: shape,
      ),
    );
  }
}
