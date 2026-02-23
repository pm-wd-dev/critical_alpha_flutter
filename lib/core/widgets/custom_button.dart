import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

enum ButtonSize {
  small,
  medium,
  large,
}


enum ButtonType {
  primary,
  secondary,
  outline,
  text,
  danger,
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final ButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final Widget? icon;
  final bool iconOnRight;
  final Color? customColor;
  final Color? customTextColor;
  final double? customBorderRadius;
  final EdgeInsetsGeometry? padding;
  final double? elevation;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
    this.icon,
    this.iconOnRight = false,
    this.customColor,
    this.customTextColor,
    this.customBorderRadius,
    this.padding,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Determine button properties based on type
    final buttonConfig = _getButtonConfig(theme);

    // Build button content
    Widget buttonContent = _buildButtonContent(context);

    // Wrap in SizedBox if full width
    if (isFullWidth) {
      buttonContent = SizedBox(
        width: double.infinity,
        child: buttonContent,
      );
    }

    return buttonContent;
  }

  _ButtonConfig _getButtonConfig(ThemeData theme) {
    switch (type) {
      case ButtonType.primary:
        return _ButtonConfig(
          backgroundColor: customColor ?? AppColors.primary,
          foregroundColor: customTextColor ?? AppColors.white,
          borderColor: Colors.transparent,
          elevation: elevation ?? 0,
        );

      case ButtonType.secondary:
        return _ButtonConfig(
          backgroundColor: customColor ?? AppColors.secondary,
          foregroundColor: customTextColor ?? AppColors.white,
          borderColor: Colors.transparent,
          elevation: elevation ?? 0,
        );

      case ButtonType.outline:
        return _ButtonConfig(
          backgroundColor: customColor ?? Colors.transparent,
          foregroundColor: customTextColor ?? AppColors.primary,
          borderColor: AppColors.primary,
          elevation: elevation ?? 0,
        );

      case ButtonType.text:
        return _ButtonConfig(
          backgroundColor: customColor ?? Colors.transparent,
          foregroundColor: customTextColor ?? AppColors.primary,
          borderColor: Colors.transparent,
          elevation: elevation ?? 0,
        );

      case ButtonType.danger:
        return _ButtonConfig(
          backgroundColor: customColor ?? AppColors.error,
          foregroundColor: customTextColor ?? AppColors.white,
          borderColor: Colors.transparent,
          elevation: elevation ?? 0,
        );
    }
  }

  Widget _buildButtonContent(BuildContext context) {
    final buttonConfig = _getButtonConfig(Theme.of(context));
    final buttonSize = _getButtonSize();

    if (type == ButtonType.text) {
      return TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          foregroundColor: buttonConfig.foregroundColor,
          padding: padding ?? buttonSize.padding,
          minimumSize: buttonSize.minimumSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              customBorderRadius ?? AppBorderRadius.medium,
            ),
          ),
        ),
        child: _buildContent(buttonConfig),
      );
    }

    if (type == ButtonType.outline) {
      return OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: buttonConfig.foregroundColor,
          backgroundColor: buttonConfig.backgroundColor,
          side: BorderSide(
            color: buttonConfig.borderColor,
            width: 1.5,
          ),
          padding: padding ?? buttonSize.padding,
          minimumSize: buttonSize.minimumSize,
          elevation: buttonConfig.elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              customBorderRadius ?? AppBorderRadius.medium,
            ),
          ),
        ),
        child: _buildContent(buttonConfig),
      );
    }

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonConfig.backgroundColor,
        foregroundColor: buttonConfig.foregroundColor,
        padding: padding ?? buttonSize.padding,
        minimumSize: buttonSize.minimumSize,
        elevation: buttonConfig.elevation,
        shadowColor: buttonConfig.elevation > 0 ? Colors.black26 : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            customBorderRadius ?? AppBorderRadius.medium,
          ),
          side: BorderSide(
            color: buttonConfig.borderColor,
            width: buttonConfig.borderColor == Colors.transparent ? 0 : 1.5,
          ),
        ),
      ),
      child: _buildContent(buttonConfig),
    );
  }

  Widget _buildContent(_ButtonConfig buttonConfig) {
    if (isLoading) {
      return SizedBox(
        height: _getButtonSize().iconSize,
        width: _getButtonSize().iconSize,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            type == ButtonType.outline || type == ButtonType.text
                ? AppColors.primary
                : AppColors.white,
          ),
        ),
      );
    }

    if (icon != null) {
      final iconWidget = SizedBox(
        width: _getButtonSize().iconSize,
        height: _getButtonSize().iconSize,
        child: icon,
      );

      if (iconOnRight) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: _getButtonSize().textStyle,
            ),
            const SizedBox(width: 8),
            iconWidget,
          ],
        );
      } else {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconWidget,
            const SizedBox(width: 8),
            Text(
              text,
              style: _getButtonSize().textStyle,
            ),
          ],
        );
      }
    }

    return Text(
      text,
      style: _getButtonSize().textStyle,
    );
  }

  _ButtonSize _getButtonSize() {
    switch (size) {
      case ButtonSize.small:
        return _ButtonSize(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          minimumSize: const Size(0, 36),
          textStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          iconSize: 16,
        );

      case ButtonSize.medium:
        return _ButtonSize(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          minimumSize: const Size(0, 48),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          iconSize: 20,
        );

      case ButtonSize.large:
        return _ButtonSize(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          minimumSize: const Size(0, 56),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          iconSize: 24,
        );
    }
  }
}

class _ButtonConfig {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final double elevation;

  _ButtonConfig({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
    required this.elevation,
  });
}

class _ButtonSize {
  final EdgeInsetsGeometry padding;
  final Size minimumSize;
  final TextStyle textStyle;
  final double iconSize;

  _ButtonSize({
    required this.padding,
    required this.minimumSize,
    required this.textStyle,
    required this.iconSize,
  });
}

// Specialized button variants for common use cases
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final Widget? icon;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      type: ButtonType.primary,
      size: size,
      isLoading: isLoading,
      isFullWidth: isFullWidth,
      icon: icon,
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final Widget? icon;

  const SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      type: ButtonType.secondary,
      size: size,
      isLoading: isLoading,
      isFullWidth: isFullWidth,
      icon: icon,
    );
  }
}

class OutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final Widget? icon;

  const OutlineButton({
    super.key,
    required this.text,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      type: ButtonType.outline,
      size: size,
      isLoading: isLoading,
      isFullWidth: isFullWidth,
      icon: icon,
    );
  }
}

class DangerButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final Widget? icon;

  const DangerButton({
    super.key,
    required this.text,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      type: ButtonType.danger,
      size: size,
      isLoading: isLoading,
      isFullWidth: isFullWidth,
      icon: icon,
    );
  }
}