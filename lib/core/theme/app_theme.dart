import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_constants.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: _lightColorScheme,
      fontFamily: 'Poppins',
      textTheme: _textTheme,
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textButtonTheme: _textButtonTheme,
      inputDecorationTheme: _inputDecorationTheme,
      cardTheme: _cardTheme,
      bottomNavigationBarTheme: _bottomNavigationBarTheme,
      drawerTheme: _drawerTheme,
      dialogTheme: _dialogTheme,
      snackBarTheme: _snackBarTheme,
      chipTheme: _chipTheme,
      switchTheme: _switchTheme,
      checkboxTheme: _checkboxTheme,
      radioTheme: _radioTheme,
      sliderTheme: _sliderTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
      dividerTheme: _dividerTheme,
      scaffoldBackgroundColor: AppColors.background,
      splashColor: AppColors.primary.withValues(alpha: 0.1),
      highlightColor: AppColors.primary.withValues(alpha: 0.05),
    );
  }

  static const ColorScheme _lightColorScheme = ColorScheme.light(
    primary: AppColors.primary,
    onPrimary: AppColors.textOnPrimary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.textOnSecondary,
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
    error: AppColors.error,
    onError: AppColors.white,
    outline: AppColors.border,
    onSurfaceVariant: AppColors.textSecondary,
  );

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      letterSpacing: -0.5,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      letterSpacing: -0.5,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      letterSpacing: -0.25,
    ),
    headlineLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      letterSpacing: -0.25,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      letterSpacing: -0.25,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      letterSpacing: 0,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      letterSpacing: 0,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      letterSpacing: 0.1,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
      letterSpacing: 0.1,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
      letterSpacing: 0.1,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
      letterSpacing: 0.25,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.textSecondary,
      letterSpacing: 0.4,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      letterSpacing: 0.1,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
      letterSpacing: 0.5,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.textTertiary,
      letterSpacing: 0.5,
    ),
  );

  static const AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: AppColors.surface,
    foregroundColor: AppColors.textPrimary,
    elevation: 0,
    shadowColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      fontFamily: 'Poppins',
    ),
    iconTheme: IconThemeData(
      color: AppColors.textPrimary,
      size: 24,
    ),
    actionsIconTheme: IconThemeData(
      color: AppColors.textPrimary,
      size: 24,
    ),
  );

  static final ElevatedButtonThemeData _elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textOnPrimary,
      disabledBackgroundColor: AppColors.grey300,
      disabledForegroundColor: AppColors.textTertiary,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.radiusMedium,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      minimumSize: const Size(0, 48),
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
      ),
    ),
  );

  static final OutlinedButtonThemeData _outlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary,
      disabledForegroundColor: AppColors.textTertiary,
      side: const BorderSide(
        color: AppColors.border,
        width: 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.radiusMedium,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      minimumSize: const Size(0, 48),
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
      ),
    ),
  );

  static final TextButtonThemeData _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary,
      disabledForegroundColor: AppColors.textTertiary,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      minimumSize: const Size(0, 40),
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
      ),
    ),
  );

  static const InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    filled: true,
    fillColor: AppColors.white,
    border: OutlineInputBorder(
      borderRadius: AppBorderRadius.radiusMedium,
      borderSide: BorderSide(
        color: AppColors.border,
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.radiusMedium,
      borderSide: BorderSide(
        color: AppColors.border,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.radiusMedium,
      borderSide: BorderSide(
        color: AppColors.borderFocus,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.radiusMedium,
      borderSide: BorderSide(
        color: AppColors.borderError,
        width: 1,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.radiusMedium,
      borderSide: BorderSide(
        color: AppColors.borderError,
        width: 2,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.radiusMedium,
      borderSide: BorderSide(
        color: AppColors.grey200,
        width: 1,
      ),
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    hintStyle: TextStyle(
      color: AppColors.textTertiary,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    labelStyle: TextStyle(
      color: AppColors.textSecondary,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    floatingLabelStyle: TextStyle(
      color: AppColors.primary,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    errorStyle: TextStyle(
      color: AppColors.error,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
  );

  static const CardThemeData _cardTheme = CardThemeData(
    color: AppColors.surface,
    elevation: 0,
    shadowColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: AppBorderRadius.radiusMedium,
      side: BorderSide(
        color: AppColors.border,
        width: 1,
      ),
    ),
    margin: EdgeInsets.zero,
  );

  static const BottomNavigationBarThemeData _bottomNavigationBarTheme =
      BottomNavigationBarThemeData(
    backgroundColor: AppColors.surface,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.textTertiary,
    type: BottomNavigationBarType.fixed,
    elevation: 8,
    selectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      fontFamily: 'Poppins',
    ),
  );

  static const DrawerThemeData _drawerTheme = DrawerThemeData(
    backgroundColor: AppColors.surface,
    elevation: 8,
    shadowColor: AppColors.black,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(AppBorderRadius.large),
        bottomRight: Radius.circular(AppBorderRadius.large),
      ),
    ),
  );

  static const DialogThemeData _dialogTheme = DialogThemeData(
    backgroundColor: AppColors.surface,
    elevation: 8,
    shadowColor: AppColors.black,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: AppBorderRadius.radiusLarge,
    ),
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      fontFamily: 'Poppins',
    ),
    contentTextStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
      fontFamily: 'Poppins',
    ),
  );

  static const SnackBarThemeData _snackBarTheme = SnackBarThemeData(
    backgroundColor: AppColors.grey800,
    contentTextStyle: TextStyle(
      color: AppColors.white,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: 'Poppins',
    ),
    actionTextColor: AppColors.primaryLight,
    shape: RoundedRectangleBorder(
      borderRadius: AppBorderRadius.radiusMedium,
    ),
    behavior: SnackBarBehavior.floating,
    elevation: 4,
  );

  static final ChipThemeData _chipTheme = ChipThemeData(
    backgroundColor: AppColors.grey100,
    selectedColor: AppColors.primary.withOpacity(0.1),
    disabledColor: AppColors.grey200,
    deleteIconColor: AppColors.textSecondary,
    brightness: Brightness.light,
    elevation: 0,
    pressElevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: AppBorderRadius.radiusLarge,
    ),
    labelStyle: const TextStyle(
      color: AppColors.textPrimary,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    ),
  );

  static final SwitchThemeData _switchTheme = SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.primary;
      }
      return AppColors.grey400;
    }),
    trackColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.primary.withOpacity(0.3);
      }
      return AppColors.grey300;
    }),
  );

  static final CheckboxThemeData _checkboxTheme = CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.primary;
      }
      return Colors.transparent;
    }),
    checkColor: MaterialStateProperty.all(AppColors.white),
    overlayColor: MaterialStateProperty.all(
      AppColors.primary.withOpacity(0.1),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );

  static final RadioThemeData _radioTheme = RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.primary;
      }
      return AppColors.grey400;
    }),
    overlayColor: MaterialStateProperty.all(
      AppColors.primary.withOpacity(0.1),
    ),
  );

  static final SliderThemeData _sliderTheme = SliderThemeData(
    activeTrackColor: AppColors.primary,
    inactiveTrackColor: AppColors.grey300,
    thumbColor: AppColors.primary,
    overlayColor: AppColors.primary.withOpacity(0.1),
    valueIndicatorColor: AppColors.primary,
    valueIndicatorTextStyle: const TextStyle(
      color: AppColors.white,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    ),
  );

  static const ProgressIndicatorThemeData _progressIndicatorTheme =
      ProgressIndicatorThemeData(
    color: AppColors.primary,
    linearTrackColor: AppColors.grey200,
    circularTrackColor: AppColors.grey200,
  );

  static const DividerThemeData _dividerTheme = DividerThemeData(
    color: AppColors.border,
    thickness: 1,
    space: 1,
  );
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
}