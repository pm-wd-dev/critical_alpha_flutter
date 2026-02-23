import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class AppErrorWidget extends StatelessWidget {
  final String? title;
  final String message;
  final String? buttonText;
  final VoidCallback? onRetry;
  final Widget? icon;
  final bool showIcon;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  const AppErrorWidget({
    super.key,
    this.title,
    required this.message,
    this.buttonText,
    this.onRetry,
    this.icon,
    this.showIcon = true,
    this.backgroundColor,
    this.padding,
  });

  // Factory constructors for common error types
  factory AppErrorWidget.network({
    String? title,
    String? message,
    VoidCallback? onRetry,
  }) {
    return AppErrorWidget(
      title: title ?? 'Connection Error',
      message: message ?? AppStrings.errorNetwork,
      buttonText: 'Retry',
      onRetry: onRetry,
      icon: const Icon(
        Icons.wifi_off,
        size: 64,
        color: AppColors.error,
      ),
    );
  }

  factory AppErrorWidget.server({
    String? title,
    String? message,
    VoidCallback? onRetry,
  }) {
    return AppErrorWidget(
      title: title ?? 'Server Error',
      message: message ?? AppStrings.errorServer,
      buttonText: 'Retry',
      onRetry: onRetry,
      icon: const Icon(
        Icons.error_outline,
        size: 64,
        color: AppColors.error,
      ),
    );
  }

  factory AppErrorWidget.notFound({
    String? title,
    String? message,
    VoidCallback? onRetry,
  }) {
    return AppErrorWidget(
      title: title ?? 'Not Found',
      message: message ?? 'The requested content was not found.',
      buttonText: 'Go Back',
      onRetry: onRetry,
      icon: const Icon(
        Icons.search_off,
        size: 64,
        color: AppColors.textSecondary,
      ),
    );
  }

  factory AppErrorWidget.unauthorized({
    String? title,
    String? message,
    VoidCallback? onRetry,
  }) {
    return AppErrorWidget(
      title: title ?? 'Access Denied',
      message: message ?? 'You are not authorized to access this content.',
      buttonText: 'Login',
      onRetry: onRetry,
      icon: const Icon(
        Icons.lock_outline,
        size: 64,
        color: AppColors.warning,
      ),
    );
  }

  factory AppErrorWidget.generic({
    String? title,
    String? message,
    VoidCallback? onRetry,
  }) {
    return AppErrorWidget(
      title: title ?? 'Something went wrong',
      message: message ?? AppStrings.errorGeneral,
      buttonText: 'Try Again',
      onRetry: onRetry,
      icon: const Icon(
        Icons.error_outline,
        size: 64,
        color: AppColors.error,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: padding ?? AppPadding.large,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showIcon && icon != null) ...[
            icon!,
            const SizedBox(height: 24),
          ],
          if (title != null) ...[
            Text(
              title!,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
          ],
          Text(
            message,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null && buttonText != null) ...[
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onRetry,
              child: Text(buttonText!),
            ),
          ],
        ],
      ),
    );
  }
}

class CompactErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final bool showIcon;

  const CompactErrorWidget({
    super.key,
    required this.message,
    this.onRetry,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: AppPadding.medium,
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.1),
        borderRadius: AppBorderRadius.radiusMedium,
        border: Border.all(
          color: AppColors.error.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          if (showIcon) ...[
            Icon(
              Icons.error_outline,
              color: AppColors.error,
              size: 20,
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.error,
              ),
            ),
          ),
          if (onRetry != null) ...[
            const SizedBox(width: 12),
            InkWell(
              onTap: onRetry,
              child: const Icon(
                Icons.refresh,
                color: AppColors.error,
                size: 20,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class InlineErrorWidget extends StatelessWidget {
  final String message;
  final EdgeInsets? padding;

  const InlineErrorWidget({
    super.key,
    required this.message,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: padding ?? const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          const Icon(
            Icons.error,
            color: AppColors.error,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Extension for easy error widget creation from exceptions
extension ErrorWidgetExtension on Exception {
  Widget toWidget({VoidCallback? onRetry}) {
    final message = toString();

    if (message.contains('network') || message.contains('connection')) {
      return AppErrorWidget.network(onRetry: onRetry);
    } else if (message.contains('server') || message.contains('500')) {
      return AppErrorWidget.server(onRetry: onRetry);
    } else if (message.contains('404') || message.contains('not found')) {
      return AppErrorWidget.notFound(onRetry: onRetry);
    } else if (message.contains('401') || message.contains('unauthorized')) {
      return AppErrorWidget.unauthorized(onRetry: onRetry);
    } else {
      return AppErrorWidget.generic(message: message, onRetry: onRetry);
    }
  }
}

// Error boundary widget to catch and display errors
class ErrorBoundary extends StatefulWidget {
  final Widget child;
  final Widget Function(FlutterErrorDetails)? errorBuilder;

  const ErrorBoundary({
    super.key,
    required this.child,
    this.errorBuilder,
  });

  @override
  State<ErrorBoundary> createState() => _ErrorBoundaryState();
}

class _ErrorBoundaryState extends State<ErrorBoundary> {
  FlutterErrorDetails? _errorDetails;

  @override
  void initState() {
    super.initState();
    FlutterError.onError = (details) {
      if (mounted) {
        setState(() {
          _errorDetails = details;
        });
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    if (_errorDetails != null) {
      return widget.errorBuilder?.call(_errorDetails!) ??
          AppErrorWidget.generic(
            message: 'An unexpected error occurred',
            onRetry: () {
              setState(() {
                _errorDetails = null;
              });
            },
          );
    }

    return widget.child;
  }
}