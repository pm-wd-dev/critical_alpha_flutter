import 'package:flutter/material.dart';

class AppConstants {
  // App Information
  static const String appName = 'Critical Alpha';
  static const String appVersion = '1.0.0';

  // API Configuration
  static const String baseUrl = 'https://api.criticalalpha.com/v1';
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
  static const String onboardingKey = 'onboarding_completed';
  static const String themeKey = 'app_theme';
  static const String languageKey = 'app_language';

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 50;
  static const int maxNameLength = 50;
  static const int maxEmailLength = 254;

  // Assets Paths
  static const String imagesPath = 'assets/images/';
  static const String iconsPath = 'assets/icons/';
  static const String animationsPath = 'assets/animations/';
  static const String fontsPath = 'assets/fonts/';
}

class AppColors {
  // Primary Colors - Updated to match React Native
  static const Color primary = Color(0xFF0147D9);  // Dark blue from React Native
  static const Color primaryDark = Color(0xFF003AAF);
  static const Color primaryLight = Color(0xFFECF1FC);

  // Secondary Colors
  static const Color secondary = Color(0xFF10B981);
  static const Color secondaryDark = Color(0xFF059669);
  static const Color secondaryLight = Color(0xFF34D399);

  // Accent Colors
  static const Color accent = Color(0xFFF59E0B);
  static const Color accentDark = Color(0xFFD97706);
  static const Color accentLight = Color(0xFFFBBF24);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);

  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Surface Colors
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1F2937);
  static const Color background = Color(0xFFF9FAFB);
  static const Color backgroundDark = Color(0xFF111827);

  // Text Colors
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnSecondary = Color(0xFFFFFFFF);

  // Border Colors
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderFocus = Color(0xFF6366F1);
  static const Color borderError = Color(0xFFEF4444);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, accentLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppStrings {
  // General
  static const String ok = 'OK';
  static const String cancel = 'Cancel';
  static const String save = 'Save';
  static const String edit = 'Edit';
  static const String delete = 'Delete';
  static const String confirm = 'Confirm';
  static const String loading = 'Loading...';
  static const String retry = 'Retry';
  static const String refresh = 'Refresh';
  static const String next = 'Next';
  static const String previous = 'Previous';
  static const String skip = 'Skip';
  static const String done = 'Done';
  static const String close = 'Close';
  static const String back = 'Back';
  static const String submit = 'Submit';
  static const String continue_ = 'Continue';

  // Authentication
  static const String login = 'Login';
  static const String signup = 'Sign Up';
  static const String logout = 'Logout';
  static const String forgotPassword = 'Forgot Password?';
  static const String resetPassword = 'Reset Password';
  static const String changePassword = 'Change Password';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String currentPassword = 'Current Password';
  static const String newPassword = 'New Password';
  static const String firstName = 'First Name';
  static const String lastName = 'Last Name';
  static const String fullName = 'Full Name';
  static const String phoneNumber = 'Phone Number';
  static const String dateOfBirth = 'Date of Birth';
  static const String gender = 'Gender';
  static const String rememberMe = 'Remember Me';
  static const String alreadyHaveAccount = 'Already have an account?';
  static const String dontHaveAccount = "Don't have an account?";
  static const String createAccount = 'Create Account';
  static const String signInWithGoogle = 'Sign in with Google';
  static const String signInWithApple = 'Sign in with Apple';
  static const String signInWithFacebook = 'Sign in with Facebook';
  static const String termsAndConditions = 'Terms and Conditions';
  static const String privacyPolicy = 'Privacy Policy';
  static const String agreeToTerms = 'I agree to the Terms and Conditions';

  // Home
  static const String welcome = 'Welcome';
  static const String dashboard = 'Dashboard';
  static const String home = 'Home';
  static const String profile = 'Profile';
  static const String settings = 'Settings';
  static const String notifications = 'Notifications';
  static const String search = 'Search';
  static const String filter = 'Filter';
  static const String sort = 'Sort';
  static const String recent = 'Recent';
  static const String popular = 'Popular';
  static const String recommended = 'Recommended';
  static const String seeAll = 'See All';
  static const String viewMore = 'View More';
  static const String viewLess = 'View Less';

  // Goals
  static const String goals = 'Goals';
  static const String myGoals = 'My Goals';
  static const String addGoal = 'Add Goal';
  static const String editGoal = 'Edit Goal';
  static const String deleteGoal = 'Delete Goal';
  static const String goalTitle = 'Goal Title';
  static const String goalDescription = 'Goal Description';
  static const String goalCategory = 'Goal Category';
  static const String goalDeadline = 'Goal Deadline';
  static const String goalProgress = 'Goal Progress';
  static const String goalCompleted = 'Goal Completed';
  static const String goalInProgress = 'In Progress';
  static const String goalNotStarted = 'Not Started';
  static const String goalOverdue = 'Overdue';
  static const String assessment = 'Assessment';
  static const String takeAssessment = 'Take Assessment';
  static const String viewResults = 'View Results';

  // Results
  static const String results = 'Results';
  static const String charts = 'Charts';
  static const String reports = 'Reports';
  static const String analytics = 'Analytics';
  static const String statistics = 'Statistics';
  static const String progress = 'Progress';
  static const String performance = 'Performance';
  static const String trends = 'Trends';
  static const String insights = 'Insights';

  // Audio
  static const String audio = 'Audio';
  static const String music = 'Music';
  static const String podcasts = 'Podcasts';
  static const String audioBooks = 'Audio Books';
  static const String meditation = 'Meditation';
  static const String softSkills = 'Soft Skills';
  static const String player = 'Player';
  static const String nowPlaying = 'Now Playing';
  static const String play = 'Play';
  static const String pause = 'Pause';
  static const String stop = 'Stop';
  static const String next_ = 'Next';
  static const String previous_ = 'Previous';
  static const String shuffle = 'Shuffle';
  static const String repeat = 'Repeat';
  static const String volume = 'Volume';
  static const String duration = 'Duration';
  static const String playlist = 'Playlist';
  static const String addToPlaylist = 'Add to Playlist';
  static const String createPlaylist = 'Create Playlist';

  // Purchase
  static const String purchase = 'Purchase';
  static const String subscription = 'Subscription';
  static const String premium = 'Premium';
  static const String upgrade = 'Upgrade';
  static const String subscribe = 'Subscribe';
  static const String freeTrial = 'Free Trial';
  static const String monthly = 'Monthly';
  static const String yearly = 'Yearly';
  static const String lifetime = 'Lifetime';
  static const String features = 'Features';
  static const String pricing = 'Pricing';
  static const String currentPlan = 'Current Plan';
  static const String changePlan = 'Change Plan';
  static const String renewalDate = 'Renewal Date';
  static const String cancelSubscription = 'Cancel Subscription';

  // Error Messages
  static const String errorGeneral = 'Something went wrong. Please try again.';
  static const String errorNetwork = 'Network error. Please check your connection.';
  static const String errorTimeout = 'Request timeout. Please try again.';
  static const String errorServer = 'Server error. Please try again later.';
  static const String errorInvalidCredentials = 'Invalid email or password.';
  static const String errorEmailExists = 'Email already exists.';
  static const String errorWeakPassword = 'Password is too weak.';
  static const String errorInvalidEmail = 'Please enter a valid email address.';
  static const String errorPasswordMismatch = 'Passwords do not match.';
  static const String errorRequiredField = 'This field is required.';
  static const String errorMinLength = 'Must be at least {0} characters long.';
  static const String errorMaxLength = 'Must be no more than {0} characters long.';
  static const String errorInvalidFormat = 'Invalid format.';
  static const String errorNoInternet = 'No internet connection.';
  static const String errorFileNotFound = 'File not found.';
  static const String errorPermissionDenied = 'Permission denied.';

  // Success Messages
  static const String successGeneral = 'Operation completed successfully.';
  static const String successLogin = 'Login successful.';
  static const String successSignup = 'Account created successfully.';
  static const String successLogout = 'Logout successful.';
  static const String successPasswordReset = 'Password reset email sent.';
  static const String successPasswordChange = 'Password changed successfully.';
  static const String successProfileUpdate = 'Profile updated successfully.';
  static const String successGoalCreated = 'Goal created successfully.';
  static const String successGoalUpdated = 'Goal updated successfully.';
  static const String successGoalDeleted = 'Goal deleted successfully.';
  static const String successSubscription = 'Subscription activated successfully.';

  // Empty States
  static const String emptyGoals = 'No goals found. Create your first goal!';
  static const String emptyResults = 'No results available yet.';
  static const String emptyAudio = 'No audio content available.';
  static const String emptyPlaylist = 'Your playlist is empty.';
  static const String emptyNotifications = 'No new notifications.';
  static const String emptySearch = 'No search results found.';

  // Onboarding
  static const String onboardingTitle1 = 'Welcome to Critical Alpha';
  static const String onboardingDesc1 = 'Your personal goal tracking and learning platform.';
  static const String onboardingTitle2 = 'Set and Track Goals';
  static const String onboardingDesc2 = 'Create meaningful goals and track your progress.';
  static const String onboardingTitle3 = 'Learn and Grow';
  static const String onboardingDesc3 = 'Access audio content and assessments to enhance your skills.';
  static const String getStarted = 'Get Started';
}

class AppPadding {
  static const EdgeInsets xs = EdgeInsets.all(4.0);
  static const EdgeInsets small = EdgeInsets.all(8.0);
  static const EdgeInsets medium = EdgeInsets.all(16.0);
  static const EdgeInsets large = EdgeInsets.all(24.0);
  static const EdgeInsets xl = EdgeInsets.all(32.0);

  // Symmetric Padding
  static const EdgeInsets horizontalSmall = EdgeInsets.symmetric(horizontal: 8.0);
  static const EdgeInsets horizontalMedium = EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets horizontalLarge = EdgeInsets.symmetric(horizontal: 24.0);

  static const EdgeInsets verticalSmall = EdgeInsets.symmetric(vertical: 8.0);
  static const EdgeInsets verticalMedium = EdgeInsets.symmetric(vertical: 16.0);
  static const EdgeInsets verticalLarge = EdgeInsets.symmetric(vertical: 24.0);
}

class AppBorderRadius {
  static const double xs = 4.0;
  static const double small = 8.0;
  static const double medium = 12.0;
  static const double large = 16.0;
  static const double xl = 24.0;
  static const double circle = 50.0;

  // Border Radius Objects
  static const BorderRadius radiusXS = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius radiusSmall = BorderRadius.all(Radius.circular(small));
  static const BorderRadius radiusMedium = BorderRadius.all(Radius.circular(medium));
  static const BorderRadius radiusLarge = BorderRadius.all(Radius.circular(large));
  static const BorderRadius radiusXL = BorderRadius.all(Radius.circular(xl));
}

class AppShadows {
  static const BoxShadow small = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.1),
    blurRadius: 4.0,
    offset: Offset(0, 2),
  );

  static const BoxShadow medium = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.1),
    blurRadius: 8.0,
    offset: Offset(0, 4),
  );

  static const BoxShadow large = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.15),
    blurRadius: 16.0,
    offset: Offset(0, 8),
  );

  static const BoxShadow xl = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.2),
    blurRadius: 24.0,
    offset: Offset(0, 12),
  );
}

class AppSpacing {
  static const double xs = 4.0;
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;
}