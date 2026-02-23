import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'core/network/api_client.dart';
import 'core/providers/shared_preferences_provider.dart';
import 'routes/app_router.dart';
import 'features/auth/controllers/auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  // Initialize API Client
  await ApiClient().initialize();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const CriticalAlphaApp(),
    ),
  );
}

class CriticalAlphaApp extends ConsumerWidget {
  const CriticalAlphaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: router,
          builder: (context, child) {
            // Global error handling
            ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
              return _buildErrorWidget(errorDetails);
            };

            return child ?? const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget _buildErrorWidget(FlutterErrorDetails errorDetails) {
    return Material(
      child: Container(
        color: AppColors.background,
        padding: AppPadding.large,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Something went wrong',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'We apologize for the inconvenience. Please try again.',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            if (kDebugMode) ...[
              const SizedBox(height: 16),
              Container(
                padding: AppPadding.medium,
                decoration: BoxDecoration(
                  color: AppColors.grey100,
                  borderRadius: BorderRadius.circular(AppBorderRadius.medium),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    errorDetails.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'monospace',
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Global app initialization provider
final appInitializationProvider = FutureProvider<bool>((ref) async {
  try {
    // Initialize app dependencies
    await _initializeApp();

    // Check auth state
    final authController = ref.read(authControllerProvider.notifier);
    await authController.checkAuthState();

    return true;
  } catch (e) {
    // Log error but don't throw
    debugPrint('App initialization failed: $e');
    return false;
  }
});

Future<void> _initializeApp() async {
  // Additional app initialization logic can go here
  // For example: Initialize analytics, crash reporting, etc.
}