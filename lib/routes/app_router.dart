import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/splash/pages/splash_page.dart';
import '../features/auth/pages/login_page.dart';
import '../features/auth/pages/signup_page.dart';
import '../features/auth/pages/forgot_password_page.dart';
import '../features/auth/pages/code_verification_page.dart';
import '../features/auth/pages/new_password_page.dart';
import '../features/home/pages/home_page.dart';
import '../features/goals/pages/plans_page.dart';
import '../features/goals/pages/create_plan_page.dart';
import '../features/goals/pages/add_goal_page.dart';
import '../features/goals/pages/assessment_page.dart';
import '../features/results/pages/results_screen.dart';
import '../features/results/pages/result_line_chart_page.dart';
import '../features/results/pages/result_radar_chart_page.dart';
import '../features/audio/pages/audio_section_page.dart';
import '../features/audio/pages/soft_skill_page.dart';
import '../features/audio/pages/music_player_page.dart';
import '../features/settings/pages/settings_page.dart';
import '../features/profile/pages/profile_page.dart';
import '../features/profile/pages/change_name_page.dart';
import '../features/profile/pages/change_email_page.dart';
import '../features/profile/pages/change_password_page.dart';
import '../features/profile/pages/change_picture_page.dart';
import '../features/purchase/pages/purchase_page.dart';
import '../features/plans/pages/plan_detail_page.dart';
import '../features/assessment/pages/assessment_page.dart' as plan_assessment;
import '../features/assessment/pages/assessment_complete_page.dart';
import '../features/auth/controllers/auth_controller.dart';
import '../core/widgets/bottom_navigation.dart';
import 'route_constants.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouterProvider = Provider<GoRouter>((ref) {
  // Create a notifier for controlled router refreshes
  final authNotifier = ValueNotifier<bool>(false);

  // Listen to auth state changes but only for login/logout events
  ref.listen(authControllerProvider, (previous, next) {
    if (previous?.isAuthenticated != next.isAuthenticated) {
      authNotifier.value = !authNotifier.value;
    }
  });

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteConstants.splash,
    debugLogDiagnostics: true,
    refreshListenable: authNotifier,
    redirect: (context, state) {
      // Read auth state without watching to prevent rebuilds
      final authController = ref.read(authControllerProvider);
      final isLoggedIn = authController.isAuthenticated;
      final isInitializing = authController.isLoading;
      final currentPath = state.fullPath ?? '';

      // Public routes that don't require authentication
      final publicRoutes = [
        RouteConstants.splash,
        RouteConstants.login,
        RouteConstants.signup,
        RouteConstants.forgotPassword,
        RouteConstants.codeVerification,
        RouteConstants.newPassword,
      ];

      // Check if current path is a public route (including with query parameters)
      bool isPublicRoute = publicRoutes.any((route) => currentPath.startsWith(route));

      // Don't redirect if we're on a public route (like OTP verification)
      if (isPublicRoute) {
        return null;
      }

      // Show splash while initializing only on app start
      if (isInitializing && currentPath == '/') {
        return RouteConstants.splash;
      }

      // If user is not logged in and trying to access protected route
      if (!isLoggedIn && !isPublicRoute) {
        return RouteConstants.login;
      }

      // If user is logged in and on splash/root, go to home
      if (isLoggedIn && (currentPath == RouteConstants.splash || currentPath == '/')) {
        return RouteConstants.home;
      }

      // No redirect needed
      return null;
    },
    routes: [
      // Splash Route
      GoRoute(
        path: RouteConstants.splash,
        name: RouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),

      // Auth Routes
      GoRoute(
        path: RouteConstants.login,
        name: RouteNames.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RouteConstants.signup,
        name: RouteNames.signup,
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        path: RouteConstants.forgotPassword,
        name: RouteNames.forgotPassword,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: RouteConstants.codeVerification,
        name: RouteNames.codeVerification,
        builder: (context, state) {
          final email = state.uri.queryParameters['email'] ?? '';
          final type = state.uri.queryParameters['type'] ?? 'password_reset';
          return CodeVerificationPage(email: email, type: type);
        },
      ),
      GoRoute(
        path: RouteConstants.newPassword,
        name: RouteNames.newPassword,
        builder: (context, state) {
          final token = state.uri.queryParameters['token'] ?? '';
          return NewPasswordPage(resetToken: token);
        },
      ),

      // Main App Shell with Bottom Navigation
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithBottomNavigation(child: child);
        },
        routes: [
          // Home Tab
          GoRoute(
            path: RouteConstants.home,
            name: RouteNames.home,
            builder: (context, state) => const HomePage(),
          ),

          // Goals Tab
          GoRoute(
            path: RouteConstants.goals,
            name: RouteNames.goals,
            builder: (context, state) => const PlansPage(),
            routes: [
              GoRoute(
                path: 'create',
                name: 'createPlan',
                builder: (context, state) => const CreatePlanPage(),
              ),
              GoRoute(
                path: 'add',
                name: RouteNames.addGoal,
                builder: (context, state) => const AddGoalPage(),
              ),
              GoRoute(
                path: 'assessment',
                name: RouteNames.assessment,
                builder: (context, state) => const AssessmentPage(),
              ),
            ],
          ),

          // Results Tab
          GoRoute(
            path: RouteConstants.results,
            name: RouteNames.results,
            builder: (context, state) {
              final planId = state.uri.queryParameters['planId'];
              return ResultsScreen(planId: planId);
            },
            routes: [
              GoRoute(
                path: 'line-chart',
                name: RouteNames.resultLineChart,
                builder: (context, state) => const ResultLineChartPage(),
              ),
              GoRoute(
                path: 'radar-chart',
                name: RouteNames.resultRadarChart,
                builder: (context, state) => const ResultRadarChartPage(),
              ),
            ],
          ),

          // Audio Tab
          GoRoute(
            path: RouteConstants.audio,
            name: RouteNames.audio,
            builder: (context, state) => const AudioSectionPage(),
            routes: [
              GoRoute(
                path: 'soft-skills',
                name: RouteNames.softSkills,
                builder: (context, state) => const SoftSkillPage(),
              ),
              GoRoute(
                path: 'player',
                name: RouteNames.musicPlayer,
                builder: (context, state) {
                  final trackId = state.uri.queryParameters['trackId'] ?? '';
                  return MusicPlayerPage(trackId: trackId);
                },
              ),
            ],
          ),

          // Settings Tab
          GoRoute(
            path: RouteConstants.settings,
            name: RouteNames.settings,
            builder: (context, state) => const SettingsPage(),
          ),
        ],
      ),

      // Full Screen Routes (outside bottom navigation)
      GoRoute(
        path: RouteConstants.profile,
        name: RouteNames.profile,
        builder: (context, state) => const ProfilePage(),
        routes: [
          GoRoute(
            path: 'change-name',
            name: RouteNames.changeName,
            builder: (context, state) => const ChangeNamePage(),
          ),
          GoRoute(
            path: 'change-email',
            name: RouteNames.changeEmail,
            builder: (context, state) => const ChangeEmailPage(),
          ),
          GoRoute(
            path: 'change-password',
            name: RouteNames.changePassword,
            builder: (context, state) => const ChangePasswordPage(),
          ),
          GoRoute(
            path: 'change-picture',
            name: RouteNames.changePicture,
            builder: (context, state) => const ChangePicturePage(),
          ),
        ],
      ),

      GoRoute(
        path: RouteConstants.purchase,
        name: RouteNames.purchase,
        builder: (context, state) => const PurchasePage(),
      ),

      // Plan Detail Route
      GoRoute(
        path: '/plan/:planId',
        name: 'planDetail',
        builder: (context, state) {
          final planId = state.pathParameters['planId'] ?? '';
          return PlanDetailPage(planId: planId);
        },
      ),

      // Assessment Routes
      GoRoute(
        path: '/assessment/:planId',
        name: 'planAssessment',
        builder: (context, state) {
          final planId = state.pathParameters['planId'] ?? '';
          return plan_assessment.AssessmentPage(planId: planId);
        },
      ),

      GoRoute(
        path: '/assessment-complete/:planId',
        name: 'assessmentComplete',
        builder: (context, state) {
          final planId = state.pathParameters['planId'] ?? '';
          final assessments = state.extra as List<Map<String, dynamic>>?;
          return AssessmentCompletePage(
            planId: planId,
            assessments: assessments,
          );
        },
      ),
    ],
    errorBuilder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Page Not Found'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                'Page not found',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'The page you are looking for does not exist.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go(RouteConstants.home),
                child: const Text('Go Home'),
              ),
            ],
          ),
        ),
      );
    },
  );
});


// Navigation Helper Extensions
extension GoRouterExtension on BuildContext {
  void pushAndClearStack(String location) {
    while (canPop()) {
      pop();
    }
    pushReplacement(location);
  }
}

// Route Observers for Analytics
class AppRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    // Log route changes for analytics
    debugPrint('Route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    // Log route changes for analytics
    debugPrint('Route popped: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    // Log route changes for analytics
    debugPrint('Route replaced: ${oldRoute?.settings.name} -> ${newRoute?.settings.name}');
  }
}