import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imosys_flutter_package/constants/imosys_strings.dart';
import 'package:imosys_flutter_package/imosys_flutter_package.dart';

class ImosysDialogs {
  static bool _isDark(ImosysConfig config, BuildContext context) {
    return config.themeMode == ThemeMode.dark ||
        (config.themeMode == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == Brightness.dark) ||
        config.isDarkMode;
  }

  //for dialogs with one action
  static dialogWithOneOption({
    required BuildContext buildContext,
    required String dialogMessage,
    required VoidCallback function,
    String? buttonText,
    Color? dialogMessageColor,
    Color? dialogButtonColor,
  }) {
    final config = ImosysAppWrapper.of(buildContext);
    final isDarkTheme = _isDark(config, buildContext);
    final resolvedMessageColor = dialogMessageColor ??
        config.dialogMessageColor ??
        (isDarkTheme
            ? config.semanticColors.onSurface
            : config.defaultFontColor);
    final resolvedButtonColor =
        dialogButtonColor ?? config.dialogButtonColor ?? config.semanticColors.info;

    return Platform.isAndroid
        ? showDialog(
            context: buildContext,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                content: ImosysTextWidget(
                  text: dialogMessage,
                  color: resolvedMessageColor,
                ),
                actions: <Widget>[
                  TextButton(
                    child: ImosysTextWidget(
                      text: buttonText ?? ImosysStrings.ok,
                      color: resolvedButtonColor,
                    ),
                    onPressed: () {
                      function.call();
                    },
                  ),
                ],
              );
            },
          )
        : showCupertinoDialog(
            context: buildContext,
            barrierDismissible: false,
            builder: (BuildContext context) => CupertinoAlertDialog(
              content: ImosysTextWidget(
                text: dialogMessage,
                color: resolvedMessageColor,
              ),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    function.call();
                  },
                  child: ImosysTextWidget(
                    text: buttonText ?? ImosysStrings.ok,
                    color: resolvedButtonColor,
                  ),
                ),
              ],
            ),
          );
  }

  static dialogWithTwoOptions({
    required BuildContext buildContext,
    required String dialogMessage,
    required VoidCallback yesFunction,
    required VoidCallback noFunction,
    String? yesButtonText,
    String? noButtonText,
    Color? dialogMessageColor,
    Color? dialogButtonColor,
  }) {
    final config = ImosysAppWrapper.of(buildContext);
    final isDarkTheme = _isDark(config, buildContext);
    final resolvedMessageColor = dialogMessageColor ??
        config.dialogMessageColor ??
        (isDarkTheme
            ? config.semanticColors.onSurface
            : config.defaultFontColor);
    final resolvedButtonColor =
        dialogButtonColor ?? config.dialogButtonColor ?? config.semanticColors.info;

    return Platform.isAndroid
        ? showDialog(
            context: buildContext,
            builder: (BuildContext context) {
              return AlertDialog(
                content: ImosysTextWidget(
                  text: dialogMessage,
                  color: resolvedMessageColor,
                ),
                actions: <Widget>[
                  TextButton(
                    child: ImosysTextWidget(
                      text: yesButtonText ?? ImosysStrings.yes,
                      color: resolvedButtonColor,
                    ),
                    onPressed: () {
                      yesFunction.call();
                    },
                  ),
                  TextButton(
                    child: ImosysTextWidget(
                      text: noButtonText ?? ImosysStrings.no,
                      color: resolvedButtonColor,
                    ),
                    onPressed: () {
                      noFunction.call();
                    },
                  ),
                ],
              );
            },
          )
        : showCupertinoDialog(
            context: buildContext,
            builder: (BuildContext context) => CupertinoAlertDialog(
              content: ImosysTextWidget(
                text: dialogMessage,
                color: resolvedMessageColor,
              ),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  onPressed: () {
                    noFunction.call();
                  },
                  child: ImosysTextWidget(
                    text: noButtonText ?? ImosysStrings.no,
                    size: 16,
                    color: resolvedButtonColor,
                  ),
                ),
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    yesFunction.call();
                  },
                  child: ImosysTextWidget(
                    text: yesButtonText ?? ImosysStrings.yes,
                    size: 16,
                    color: resolvedButtonColor,
                  ),
                ),
              ],
            ),
          );
  }

  static loading(
      {required BuildContext context, Color? circularProgressColor}) {
    final config = ImosysAppWrapper.of(context);
    final resolvedProgressColor =
        circularProgressColor ?? config.circularProgressColor ?? config.semanticColors.info;

    return Platform.isAndroid
        ? showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) {
              return Dialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(
                        color: resolvedProgressColor,
                      ),
                    ],
                  ),
                ),
              );
            })
        : showCupertinoDialog(
            context: context,
            builder: (BuildContext context) => CupertinoActivityIndicator(
              color: resolvedProgressColor,
              radius: 20,
            ),
          );
  }

  static loadingWithMessage({
    required BuildContext context,
    required String message,
    Color? circularProgressColor,
    Color? dialogMessageColor,
  }) {
    final config = ImosysAppWrapper.of(context);
    final isDarkTheme = _isDark(config, context);
    final resolvedProgressColor =
        circularProgressColor ?? config.circularProgressColor ?? config.semanticColors.info;
    final resolvedMessageColor = dialogMessageColor ??
        config.dialogMessageColor ??
        (isDarkTheme
            ? config.semanticColors.onSurface
            : config.defaultFontColor);

    return Platform.isAndroid
        ? showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: resolvedProgressColor,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ImosysTextWidget(
                      text: message,
                      size: 16,
                      color: resolvedMessageColor,
                    )
                  ],
                ),
              );
            })
        : showCupertinoDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoActivityIndicator(
                    color: resolvedProgressColor,
                    radius: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ImosysTextWidget(
                    text: message,
                    size: 16,
                    color: resolvedMessageColor,
                  )
                ],
              ),
            ),
          );
  }

  static Widget loadingInScreen({
    required BuildContext context,
    Color? circularProgressColor,
  }) {
    final config = ImosysAppWrapper.of(context);
    final resolvedProgressColor =
        circularProgressColor ?? config.circularProgressColor ?? config.semanticColors.info;

    return Platform.isAndroid
        ? Center(
            child: CircularProgressIndicator(
              color: resolvedProgressColor,
            ),
          )
        : Center(
            child: CupertinoActivityIndicator(
              color: resolvedProgressColor,
              radius: 20,
            ),
          );
  }
}
