import 'package:flutter/material.dart';

/// A class to hold default configuration values
class ImosysConfig {
  static String baseUrl = '';
  static String? token;
  final double defaultFontSize;
  final Color defaultFontColor;
  final Color primaryColor;
  final double defaultHorizontalPadding;
  final double defaultVerticalPadding;
  final double defaultHorizontalMargin;
  final double defaultVerticalMargin;
  final double defaultContainerRadius;
  final String? defaultFontFamily;
  final Color? defaultBorderColor;
  final Color? defaultTextFieldFillColor;
  final Color? cursorColor;

  ImosysConfig({
    required this.defaultFontSize,
    required this.defaultFontColor,
    required this.primaryColor,
    required this.defaultHorizontalPadding,
    required this.defaultVerticalPadding,
    required this.defaultHorizontalMargin,
    required this.defaultVerticalMargin,
    required this.defaultContainerRadius,
    this.defaultFontFamily,
    this.defaultBorderColor,
    this.defaultTextFieldFillColor,
    this.cursorColor
  });

  /// Method to set base URL
  static void setBaseUrl(String url) {
    baseUrl = url;
  }

  /// Method to set bearer token
  static void setToken(String authToken) {
    token = authToken;
  }

  // Method to clear the bearer token
  static void clearToken() {
    token = null;
  }
}

/// The wrapper widget that provides configuration values to the app
class ImosysAppWrapper extends StatelessWidget {
  final ImosysConfig config;
  final Widget child;

  const ImosysAppWrapper({
    super.key,
    required this.config,
    required this.child,
  });

  static ImosysConfig of(BuildContext context) {
    final _InheritedIMoSySConfig? inheritedConfig =
        context.dependOnInheritedWidgetOfExactType<_InheritedIMoSySConfig>();
    assert(inheritedConfig != null, 'No ImosysConfig found in context');
    return inheritedConfig!.config;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedIMoSySConfig(
      config: config,
      child: child,
    );
  }
}

class _InheritedIMoSySConfig extends InheritedWidget {
  final ImosysConfig config;

  const _InheritedIMoSySConfig({
    required this.config,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant _InheritedIMoSySConfig oldWidget) {
    return config != oldWidget.config;
  }
}
