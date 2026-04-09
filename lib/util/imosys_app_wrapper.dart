import 'package:flutter/material.dart';

enum ImosysSpacingPreset { xs, sm, md, lg, xl, xxl }

class ImosysSemanticColors {
  final Color success;
  final Color warning;
  final Color error;
  final Color info;
  final Color background;
  final Color surface;
  final Color onSurface;
  final Color onPrimary;

  const ImosysSemanticColors({
    this.success = const Color(0xFF16A34A),
    this.warning = const Color(0xFFF59E0B),
    this.error = const Color(0xFFDC2626),
    this.info = const Color(0xFF2563EB),
    this.background = const Color(0xFFFFFFFF),
    this.surface = const Color(0xFFF8FAFC),
    this.onSurface = const Color(0xFF111827),
    this.onPrimary = const Color(0xFFFFFFFF),
  });
}

class ImosysSpacingScale {
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;

  const ImosysSpacingScale({
    this.xs = 4,
    this.sm = 8,
    this.md = 12,
    this.lg = 16,
    this.xl = 24,
    this.xxl = 32,
  });
}

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
  //Text field
  final Color? defaultTextFieldFillColor;
  final Color? defaultHintColor;
  final Color? cursorColor;
  final bool defaultTextFieldIsFilled;
  final String? defaultTextFieldFontFamily;
  final bool defaultTextFieldHasBorder;
  //Dialogs
  final Color? dialogMessageColor;
  final Color? dialogButtonColor;
  final Color? circularProgressColor;

  //Button
  final Color? primaryButtonBackgroundColor;
  final double? primaryButtonDefaultWidth;
  final Color? primaryButtonTextColor;
  final double? primaryButtonFontSize;
  final bool? primaryButtonHasElevation;
  final String? primaryButtonTextFontFamily;
  final double? primaryButtonVerticalPadding;

  /// TextStyles
  final TextStyle? h1TextStyle;
  final TextStyle? h2TextStyle;
  final TextStyle? h3TextStyle;
  final TextStyle? bodyTextStyle;
  final TextStyle? smallTextStyle;
  final TextStyle? extraSmallTextStyle;
  // Theming
  final ThemeMode themeMode;
  final bool isDarkMode;
  final ImosysSemanticColors semanticColors;
  final ImosysSpacingScale spacing;

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
    this.defaultHintColor,
    this.cursorColor,
    this.defaultTextFieldIsFilled = false,
    this.defaultTextFieldHasBorder = true,
    this.defaultTextFieldFontFamily,
    this.dialogMessageColor,
    this.dialogButtonColor,
    this.circularProgressColor,
    this.primaryButtonBackgroundColor,
    this.primaryButtonDefaultWidth,
    this.primaryButtonTextColor,
    this.primaryButtonFontSize,
    this.primaryButtonHasElevation,
    this.primaryButtonTextFontFamily,
    this.primaryButtonVerticalPadding,
    this.h1TextStyle,
    this.h2TextStyle,
    this.h3TextStyle,
    this.bodyTextStyle,
    this.smallTextStyle,
    this.extraSmallTextStyle,
    this.themeMode = ThemeMode.system,
    this.isDarkMode = false,
    this.semanticColors = const ImosysSemanticColors(),
    this.spacing = const ImosysSpacingScale(),
  });

  double space(ImosysSpacingPreset preset) {
    switch (preset) {
      case ImosysSpacingPreset.xs:
        return spacing.xs;
      case ImosysSpacingPreset.sm:
        return spacing.sm;
      case ImosysSpacingPreset.md:
        return spacing.md;
      case ImosysSpacingPreset.lg:
        return spacing.lg;
      case ImosysSpacingPreset.xl:
        return spacing.xl;
      case ImosysSpacingPreset.xxl:
        return spacing.xxl;
    }
  }

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
