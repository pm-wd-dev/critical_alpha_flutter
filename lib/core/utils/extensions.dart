import 'dart:math' show pow;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants/app_constants.dart';

// String Extensions
extension StringExtensions on String {
  /// Checks if string is a valid email
  bool get isValidEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  /// Checks if string is a valid phone number
  bool get isValidPhone {
    return RegExp(r'^\+?[\d\s\-\(\)]+$').hasMatch(this) && length >= 10;
  }

  /// Checks if string is empty or contains only whitespace
  bool get isBlank => trim().isEmpty;

  /// Checks if string is not empty and contains non-whitespace characters
  bool get isNotBlank => !isBlank;

  /// Capitalizes the first letter of the string
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Capitalizes the first letter of each word
  String get titleCase {
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// Removes all whitespace characters
  String get removeWhitespace => replaceAll(RegExp(r'\s+'), '');

  /// Truncates string to specified length with ellipsis
  String truncate(int length, {String suffix = '...'}) {
    if (this.length <= length) return this;
    return '${substring(0, length)}$suffix';
  }

  /// Extracts initials from full name
  String get initials {
    final words = trim().split(' ');
    if (words.isEmpty) return '';
    if (words.length == 1) return words[0].isNotEmpty ? words[0][0].toUpperCase() : '';
    return '${words.first[0]}${words.last[0]}'.toUpperCase();
  }

  /// Masks email address (e.g., j***@example.com)
  String get maskedEmail {
    if (!isValidEmail) return this;
    final parts = split('@');
    final username = parts[0];
    final domain = parts[1];

    if (username.length <= 2) return this;
    return '${username[0]}${'*' * (username.length - 1)}@$domain';
  }

  /// Formats phone number
  String get formattedPhone {
    final digits = replaceAll(RegExp(r'\D'), '');
    if (digits.length == 10) {
      return '(${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6)}';
    } else if (digits.length == 11 && digits.startsWith('1')) {
      return '+1 (${digits.substring(1, 4)}) ${digits.substring(4, 7)}-${digits.substring(7)}';
    }
    return this;
  }

  /// Converts string to snake_case
  String get snakeCase {
    return replaceAllMapped(
      RegExp(r'([a-z0-9])([A-Z])'),
      (Match match) => '${match.group(1)}_${match.group(2)}',
    ).toLowerCase();
  }

  /// Converts string to camelCase
  String get camelCase {
    final words = split('_');
    if (words.isEmpty) return this;
    return words.first.toLowerCase() +
           words.skip(1).map((word) => word.capitalize).join('');
  }

  /// Removes HTML tags from string
  String get stripHtml {
    return replaceAll(RegExp(r'<[^>]*>'), '');
  }

  /// Checks if string is a valid URL
  bool get isValidUrl {
    return RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
    ).hasMatch(this);
  }

  /// Converts string to slug (URL-friendly)
  String get slug {
    return toLowerCase()
        .replaceAll(RegExp(r'[^\w\s-]'), '')
        .replaceAll(RegExp(r'\s+'), '-')
        .replaceAll(RegExp(r'-+'), '-')
        .replaceAll(RegExp(r'^-+|-+$'), '');
  }

  /// Gets file extension from string
  String get fileExtension {
    final lastDot = lastIndexOf('.');
    if (lastDot == -1 || lastDot == length - 1) return '';
    return substring(lastDot + 1).toLowerCase();
  }

  /// Checks if string is numeric
  bool get isNumeric {
    return double.tryParse(this) != null;
  }

  /// Converts string to int safely
  int? get toInt => int.tryParse(this);

  /// Converts string to double safely
  double? get toDouble => double.tryParse(this);

  /// Reverses the string
  String get reversed {
    return split('').reversed.join('');
  }
}

// DateTime Extensions
extension DateTimeExtensions on DateTime {
  /// Formats date as relative time (e.g., "2 hours ago")
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }

  /// Formats date as "Today", "Yesterday", or date string
  String get dayString {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateOnly = DateTime(year, month, day);

    if (dateOnly == today) {
      return 'Today';
    } else if (dateOnly == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('MMM dd, yyyy').format(this);
    }
  }

  /// Returns true if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Returns true if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year && month == yesterday.month && day == yesterday.day;
  }

  /// Returns true if date is this week
  bool get isThisWeek {
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    final weekEnd = weekStart.add(const Duration(days: 6));
    return isAfter(weekStart.subtract(const Duration(days: 1))) &&
           isBefore(weekEnd.add(const Duration(days: 1)));
  }

  /// Returns true if date is this month
  bool get isThisMonth {
    final now = DateTime.now();
    return year == now.year && month == now.month;
  }

  /// Returns true if date is this year
  bool get isThisYear {
    final now = DateTime.now();
    return year == now.year;
  }

  /// Gets the start of the day (00:00:00)
  DateTime get startOfDay => DateTime(year, month, day);

  /// Gets the end of the day (23:59:59)
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999);

  /// Gets the start of the week (Monday)
  DateTime get startOfWeek {
    return subtract(Duration(days: weekday - 1));
  }

  /// Gets the end of the week (Sunday)
  DateTime get endOfWeek {
    return add(Duration(days: 7 - weekday));
  }

  /// Gets the start of the month
  DateTime get startOfMonth => DateTime(year, month, 1);

  /// Gets the end of the month
  DateTime get endOfMonth => DateTime(year, month + 1, 0, 23, 59, 59, 999);

  /// Gets the start of the year
  DateTime get startOfYear => DateTime(year, 1, 1);

  /// Gets the end of the year
  DateTime get endOfYear => DateTime(year, 12, 31, 23, 59, 59, 999);

  /// Formats date as "Mon, Jan 1"
  String get shortFormat => DateFormat('EEE, MMM d').format(this);

  /// Formats date as "January 1, 2024"
  String get longFormat => DateFormat('MMMM d, y').format(this);

  /// Formats time as "2:30 PM"
  String get timeFormat => DateFormat('h:mm a').format(this);

  /// Formats as "Jan 1, 2024 at 2:30 PM"
  String get fullFormat => DateFormat('MMM d, y \'at\' h:mm a').format(this);

  /// Gets age in years
  int get age {
    final now = DateTime.now();
    int age = now.year - year;
    if (now.month < month || (now.month == month && now.day < day)) {
      age--;
    }
    return age;
  }
}

// Duration Extensions
extension DurationExtensions on Duration {
  /// Formats duration as "2:30" (minutes:seconds)
  String get mmss {
    final minutes = inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  /// Formats duration as "1:23:45" (hours:minutes:seconds)
  String get hhmmss {
    final hours = inHours.toString().padLeft(2, '0');
    final minutes = inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  /// Formats duration in human readable format
  String get humanReadable {
    if (inDays > 0) {
      return '$inDays ${inDays == 1 ? 'day' : 'days'}';
    } else if (inHours > 0) {
      return '$inHours ${inHours == 1 ? 'hour' : 'hours'}';
    } else if (inMinutes > 0) {
      return '$inMinutes ${inMinutes == 1 ? 'minute' : 'minutes'}';
    } else {
      return '$inSeconds ${inSeconds == 1 ? 'second' : 'seconds'}';
    }
  }
}

// List Extensions
extension ListExtensions<T> on List<T> {
  /// Safely gets element at index, returns null if out of bounds
  T? elementAtOrNull(int index) {
    if (index < 0 || index >= length) return null;
    return this[index];
  }

  /// Groups list elements by a key function
  Map<K, List<T>> groupBy<K>(K Function(T) keyFunction) {
    final map = <K, List<T>>{};
    for (final element in this) {
      final key = keyFunction(element);
      (map[key] ??= <T>[]).add(element);
    }
    return map;
  }

  /// Returns a new list with distinct elements
  List<T> distinct() {
    return toSet().toList();
  }

  /// Returns a new list with distinct elements based on a key function
  List<T> distinctBy<K>(K Function(T) keyFunction) {
    final seen = <K>{};
    return where((element) => seen.add(keyFunction(element))).toList();
  }

  /// Splits list into chunks of specified size
  List<List<T>> chunks(int size) {
    final result = <List<T>>[];
    for (int i = 0; i < length; i += size) {
      result.add(sublist(i, (i + size).clamp(0, length)));
    }
    return result;
  }

  /// Returns random element from list
  T? get randomElement {
    if (isEmpty) return null;
    return this[(DateTime.now().millisecondsSinceEpoch % length)];
  }

  /// Safely gets first element, returns null if empty
  T? get firstOrNull => isEmpty ? null : first;

  /// Safely gets last element, returns null if empty
  T? get lastOrNull => isEmpty ? null : last;
}

// BuildContext Extensions
extension BuildContextExtensions on BuildContext {
  /// Gets screen size
  Size get screenSize => MediaQuery.of(this).size;

  /// Gets screen width
  double get screenWidth => screenSize.width;

  /// Gets screen height
  double get screenHeight => screenSize.height;

  /// Gets theme
  ThemeData get theme => Theme.of(this);

  /// Gets color scheme
  ColorScheme get colorScheme => theme.colorScheme;

  /// Gets text theme
  TextTheme get textTheme => theme.textTheme;

  /// Checks if device is in dark mode
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// Gets device pixel ratio
  double get pixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// Gets safe area padding
  EdgeInsets get padding => MediaQuery.of(this).padding;

  /// Gets keyboard height
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  /// Checks if keyboard is visible
  bool get isKeyboardVisible => keyboardHeight > 0;

  /// Shows snackbar
  void showSnackBar(String message, {Color? backgroundColor, Duration? duration}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration ?? const Duration(seconds: 4),
      ),
    );
  }

  /// Shows error snackbar
  void showErrorSnackBar(String message) {
    showSnackBar(message, backgroundColor: AppColors.error);
  }

  /// Shows success snackbar
  void showSuccessSnackBar(String message) {
    showSnackBar(message, backgroundColor: AppColors.success);
  }

  /// Dismisses keyboard
  void dismissKeyboard() {
    FocusScope.of(this).unfocus();
  }

  /// Checks if screen width is considered mobile
  bool get isMobile => screenWidth < 768;

  /// Checks if screen width is considered tablet
  bool get isTablet => screenWidth >= 768 && screenWidth < 1024;

  /// Checks if screen width is considered desktop
  bool get isDesktop => screenWidth >= 1024;
}

// Number Extensions
extension NumExtensions on num {
  /// Formats number as currency
  String get currency => NumberFormat.currency(symbol: '\$').format(this);

  /// Formats number as percentage
  String get percentage => NumberFormat.percentPattern().format(this / 100);

  /// Formats number with commas
  String get formatted => NumberFormat('#,###').format(this);

  /// Clamps number between min and max
  num clampBetween(num min, num max) => clamp(min, max);

  /// Converts bytes to human readable format
  String get bytesToReadable {
    if (this < 1024) return '${toInt()} B';
    if (this < 1024 * 1024) return '${(this / 1024).toStringAsFixed(1)} KB';
    if (this < 1024 * 1024 * 1024) return '${(this / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(this / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  /// Rounds to specified decimal places
  double roundTo(int decimalPlaces) {
    final mod = pow(10, decimalPlaces).toDouble();
    return (this * mod).round() / mod;
  }
}

// Color Extensions
extension ColorExtensions on Color {
  /// Creates a material color from this color
  MaterialColor get materialColor {
    final Map<int, Color> swatch = {
      50: lighten(0.5),
      100: lighten(0.4),
      200: lighten(0.3),
      300: lighten(0.2),
      400: lighten(0.1),
      500: this,
      600: darken(0.1),
      700: darken(0.2),
      800: darken(0.3),
      900: darken(0.4),
    };
    return MaterialColor(value, swatch);
  }

  /// Lightens the color by the given amount
  Color lighten(double amount) {
    final hsl = HSLColor.fromColor(this);
    return hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0)).toColor();
  }

  /// Darkens the color by the given amount
  Color darken(double amount) {
    final hsl = HSLColor.fromColor(this);
    return hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0)).toColor();
  }

  /// Returns the hex string representation of the color
  String get hexString {
    return '#${value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }

  /// Checks if the color is light
  bool get isLight => computeLuminance() > 0.5;

  /// Checks if the color is dark
  bool get isDark => !isLight;
}