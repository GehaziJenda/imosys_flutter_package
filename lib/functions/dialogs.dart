import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imosys_flutter_package/constants/imosys_strings.dart';
import 'package:imosys_flutter_package/imosys_flutter_package.dart';

class ImosysDialogs {
  //for dialogs with one action
  static dialogWithOneOption({
    required BuildContext buildContext,
    required String dialogMessage,
    required VoidCallback function,
    String? buttonText,
    Color? dialogMessageColor,
    Color? dialogButtonColor,
  }) {
    return Platform.isAndroid
        ? showDialog(
            context: buildContext,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                content: ImosysTextWidget(
                  text: dialogMessage,
                  color: dialogMessageColor ??
                      ImosysAppWrapper.of(context).dialogMessageColor,
                ),
                actions: <Widget>[
                  TextButton(
                    child: ImosysTextWidget(
                      text: buttonText ?? ImosysStrings.ok,
                      color: dialogButtonColor ??
                          ImosysAppWrapper.of(context).dialogButtonColor,
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
                color: dialogMessageColor ??
                    ImosysAppWrapper.of(context).dialogMessageColor,
              ),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    function.call();
                  },
                  child: ImosysTextWidget(
                    text: buttonText ?? ImosysStrings.ok,
                    color: dialogButtonColor ??
                        ImosysAppWrapper.of(context).dialogButtonColor,
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
    return Platform.isAndroid
        ? showDialog(
            context: buildContext,
            builder: (BuildContext context) {
              return AlertDialog(
                content: ImosysTextWidget(
                  text: dialogMessage,
                  color: dialogMessageColor ??
                      ImosysAppWrapper.of(context).dialogMessageColor,
                ),
                actions: <Widget>[
                  TextButton(
                    child: ImosysTextWidget(
                      text: yesButtonText ?? ImosysStrings.yes,
                      color: dialogButtonColor ??
                          ImosysAppWrapper.of(context).dialogButtonColor,
                    ),
                    onPressed: () {
                      yesFunction.call();
                    },
                  ),
                  TextButton(
                    child: ImosysTextWidget(
                      text: noButtonText ?? ImosysStrings.no,
                      color: dialogButtonColor ??
                          ImosysAppWrapper.of(context).dialogButtonColor,
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
                color: dialogMessageColor ??
                    ImosysAppWrapper.of(context).dialogMessageColor,
              ),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  onPressed: () {
                    noFunction.call();
                  },
                  child: ImosysTextWidget(
                    text: noButtonText ?? ImosysStrings.no,
                    size: 16,
                    color: dialogButtonColor ??
                        ImosysAppWrapper.of(context).dialogButtonColor,
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
                    color: dialogButtonColor ??
                        ImosysAppWrapper.of(context).dialogButtonColor,
                  ),
                ),
              ],
            ),
          );
  }

  static loading(
      {required BuildContext context, Color? circularProgressColor}) {
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
                        color: circularProgressColor ??
                            ImosysAppWrapper.of(context)
                                .circularProgressColor ??
                            ImosysAppWrapper.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              );
            })
        : showCupertinoDialog(
            context: context,
            builder: (BuildContext context) => CupertinoActivityIndicator(
              color: circularProgressColor ??
                  ImosysAppWrapper.of(context).circularProgressColor ??
                  ImosysAppWrapper.of(context).primaryColor,
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
                      color: circularProgressColor ??
                          ImosysAppWrapper.of(context).circularProgressColor ??
                          ImosysAppWrapper.of(context).primaryColor,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ImosysTextWidget(
                      text: message,
                      size: 16,
                      color: dialogMessageColor ??
                          ImosysAppWrapper.of(context).dialogMessageColor,
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
                    color: circularProgressColor ??
                        ImosysAppWrapper.of(context).circularProgressColor ??
                        ImosysAppWrapper.of(context).primaryColor,
                    radius: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ImosysTextWidget(
                    text: message,
                    size: 16,
                    color: dialogMessageColor ??
                        ImosysAppWrapper.of(context).dialogMessageColor,
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
    return Platform.isAndroid
        ? Center(
            child: CircularProgressIndicator(
              color: circularProgressColor ??
                  ImosysAppWrapper.of(context).circularProgressColor ??
                  ImosysAppWrapper.of(context).primaryColor,
            ),
          )
        : Center(
            child: CupertinoActivityIndicator(
              color: circularProgressColor ??
                  ImosysAppWrapper.of(context).circularProgressColor ??
                  ImosysAppWrapper.of(context).primaryColor,
              radius: 20,
            ),
          );
  }
}
