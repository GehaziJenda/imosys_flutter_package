import 'dart:io';

void main() {
  final basePath =
      Directory.current.path; // Base path where the package is located

  final directories = [
    'lib/common/functions',
    'lib/common/models',
    'lib/common/providers',
    'lib/common/screens',
    'lib/common/widgets',
    'lib/constants',
    'lib/feature1/functions',
    'lib/feature1/models',
    'lib/feature1/providers',
    'lib/feature1/screens',
    'lib/feature1/widgets',
    'lib/feature2/functions',
    'lib/feature2/models',
    'lib/feature2/providers',
    'lib/feature2/screens',
    'lib/feature2/widgets',
    'lib/feature3/functions',
    'lib/feature3/models',
    'lib/feature3/providers',
    'lib/feature3/screens',
    'lib/feature3/widgets',
    'lib/feature4/functions',
    'lib/feature4/models',
    'lib/feature4/providers',
    'lib/feature4/screens',
    'lib/feature4/widgets',
    'lib/feature_auth/functions',
    'lib/feature_auth/models',
    'lib/feature_auth/providers',
    'lib/feature_auth/screens',
    'lib/feature_auth/widgets',
    'lib/utilities',
  ];

  final files = {
    'lib/constants/app_colors.dart': '''
import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
}
''',
    'lib/constants/app_images.dart': '''
class AppImages {
  // logos
  static const String logo = "assets/images/logo.png";
}
''',
    'lib/constants/app_sizes.dart': '''
// Define app-specific sizes here.
''',
    'lib/constants/endpoints.dart': '''
class Endpoints {
  // Auth Endpoints
  static const String register = "register";
  static const String login = "login";
}
''',
    'lib/constants/fonts.dart': '''
class Fonts {}
''',
    'lib/constants/strings.dart': '''
class Strings {
  // General error string
  static const String somethingWentWrong =
      "Something Went Wrong. Please try again later.";
}
''',
  };

  // Create directories within the 'lib' folder
  for (var dir in directories) {
    final directoryPath = '$basePath/$dir';
    Directory(directoryPath).createSync(recursive: true);
    print('Created directory: $directoryPath');
  }

  // Create files within the 'lib' folder and write initial content
  files.forEach((path, content) {
    final filePath = '$basePath/$path';
    File(filePath).writeAsStringSync(content);
    print('Created file: $filePath');
  });

  print('Folder structure and files generated successfully!');
}
