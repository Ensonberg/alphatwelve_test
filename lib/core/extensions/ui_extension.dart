import 'package:alphatwelve/l10n/app_localizations.dart';
import 'package:flutter/material.dart';


/// A set of useful [BuildContext] extensions
extension BuildContextX on BuildContext {
  /// Extensions for quickly accessing generated localization getters
  AppLocalizations get tr => AppLocalizations.of(this)!;

  /// Extension for quickly accessing app [ColorScheme]
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  bool isTablet() {
    final mediaQuery = MediaQuery.of(this);
    final shortestSide = mediaQuery.size.shortestSide;

    // Use a reasonable threshold (600 is common)
    return shortestSide >= 600;
  }

  /// Extension for quickly accessing app [TextTheme]
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Extension for quickly accessing app [Theme]
  ThemeData get theme => Theme.of(this);

  /// Extension for quickly accessing screen size
  Size get screenSize => MediaQuery.of(this).size;
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
  String capitalizeEachWord() {
    return split(RegExp(r'\s+'))
        .map((word) => word.isEmpty
        ? ''
        : word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }
}
