import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_assets.dart';
import '../../../routes/route_constants.dart';
import '../../auth/controllers/auth_controller.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Create fade animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    // Create scale animation for logo
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));

    // Start animation
    _animationController.forward();

    _initializeApp();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _initializeApp() async {
    try {
      // Set status bar style
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );

      // Check auth state
      await ref.read(authControllerProvider.notifier).checkAuthState();

      // Add a minimum splash duration for better UX
      await Future.delayed(const Duration(seconds: 3));

      if (mounted) {
        final authState = ref.read(authControllerProvider);
        final isAuthenticated = authState.isAuthenticated;
        final user = authState.user;

        // Additional check - if user exists but no valid token, clear auth
        if (user != null && !isAuthenticated) {
          ref.read(authControllerProvider.notifier).clearAuthState();
          context.go(RouteConstants.login);
          return;
        }

        if (isAuthenticated) {
          // If user is authenticated, always go to home regardless of email verification
          // Email verification should only be required during signup flow
          context.go(RouteConstants.home);
        } else {
          context.go(RouteConstants.login);
        }
      }
    } catch (e) {
      // If something goes wrong, clear auth and go to login
      if (mounted) {
        ref.read(authControllerProvider.notifier).clearAuthState();
        context.go(RouteConstants.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Full screen background image
          Positioned.fill(
            child: Image.asset(
              AppAssets.splashImg,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // Optional: Add a subtle gradient overlay for better logo visibility
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.1),
                    Colors.black.withValues(alpha: 0.3),
                  ],
                ),
              ),
            ),
          ),

    
         
          // Loading indicator at bottom
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 2.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}