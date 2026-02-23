import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  // Base Configuration - No /api suffix as React Native doesn't use it
  static String get baseUrl => dotenv.env['BASE_URL'] ?? 'https://admin.criticalalpha.com';

  // Authentication Endpoints - Matching React Native endpoints
  static const String login = '/user/login';  // RN uses /user/login
  static const String signup = '/user/sign_up';  // RN uses /user/sign_up with underscore
  static const String refreshToken = '/auth/refresh';
  static const String logout = '/auth/logout';
  static const String forgotPassword = '/user/forgot_password';
  static const String resetPassword = '/user/reset_password';
  static const String verifyCode = '/user/verify';  // RN uses /user/verify
  static const String changePassword = '/self/change_password';
  static const String verifyEmail = '/auth/verify-email';
  static const String resendVerification = '/user/resend_code';

  // User Endpoints - Matching React Native endpoints
  static const String profile = '/user/profile';
  static const String updateProfile = '/user/profile';
  static const String uploadAvatar = '/user/avatar';
  static const String deleteAccount = '/user/delete_account';  // Changed from /user/delete
  static const String userSettings = '/user/settings';
  static const String updateSettings = '/user/settings';
  static const String userStats = '/user/stats';
  static const String userActivity = '/user/activity';

  // Goals/Plans Endpoints - Matching React Native endpoints
  static const String goals = '/user/plans';  // RN uses plans instead of goals
  static const String createGoal = '/user/plans/create';
  static const String updateGoal = '/user/plans/update';
  static const String deleteGoal = '/user/plans/delete';
  static const String deleteAllGoals = '/user/plans/delete-all';
  static const String changeGoalStatus = '/user/plans/change-status';
  static const String goalDetails = '/user/plans/{id}';
  static const String goalProgress = '/user/plans/{id}/progress';
  static const String updateGoalProgress = '/user/plans/{id}/progress';
  static const String goalCategories = '/goals/categories';
  static const String goalTemplates = '/goals/templates';
  static const String completeGoal = '/user/plans/{id}/complete';
  static const String archiveGoal = '/user/plans/{id}/archive';

  // Assessment Endpoints - Matching React Native endpoints
  static const String assessments = '/user/assessment/v2/user_assessments';
  static const String requestAssessment = '/user/assessment/v2/request_assessment';
  static const String createAssessment = '/user/assessment/add_assessment';
  static const String assessmentDetails = '/user/assessment/{id}';
  static const String submitAssessment = '/user/assessment/{id}/submit';
  static const String assessmentResults = '/user/assessment/{id}/results';
  static const String assessmentHistory = '/user/assessment/history';
  static const String assessmentTypes = '/user/assessment/types';
  static const String retakeAssessment = '/user/assessment/{id}/retake';

  // Results Endpoints
  static const String results = '/results';
  static const String resultDetails = '/results/{id}';
  static const String chartData = '/results/charts';
  static const String progressReport = '/results/progress';
  static const String performanceMetrics = '/results/metrics';
  static const String exportResults = '/results/export';
  static const String compareResults = '/results/compare';
  static const String resultsByGoal = '/results/goals/{goalId}';
  static const String resultsByCategory = '/results/categories/{categoryId}';
  static const String resultsTrends = '/results/trends';

  // Audio Endpoints - Matching React Native endpoints
  static const String audioCategories = '/user/categories';
  static const String audioTracks = '/user/categories/audios';  // with ?category_id=
  static const String audioTrackDetails = '/audio/tracks/{id}';
  static const String audioPlaylists = '/audio/playlists';
  static const String createPlaylist = '/audio/playlists';
  static const String updatePlaylist = '/audio/playlists/{id}';
  static const String deletePlaylist = '/audio/playlists/{id}';
  static const String addToPlaylist = '/audio/playlists/{id}/tracks';
  static const String removeFromPlaylist = '/audio/playlists/{id}/tracks/{trackId}';
  static const String favoriteAudio = '/audio/favorites';
  static const String addToFavorites = '/audio/favorites';
  static const String removeFromFavorites = '/audio/favorites/{id}';
  static const String audioProgress = '/audio/progress';
  static const String updateAudioProgress = '/audio/progress/{id}';
  static const String audioRecommendations = '/audio/recommendations';
  static const String audioSearch = '/audio/search';

  // Soft Skills Endpoints
  static const String softSkillsCategories = '/soft-skills/categories';
  static const String softSkillsContent = '/soft-skills/content';
  static const String softSkillsProgress = '/soft-skills/progress';
  static const String softSkillsAssessments = '/soft-skills/assessments';
  static const String softSkillsCourses = '/soft-skills/courses';
  static const String enrollCourse = '/soft-skills/courses/{id}/enroll';
  static const String courseProgress = '/soft-skills/courses/{id}/progress';
  static const String completeCourseModule = '/soft-skills/courses/{courseId}/modules/{moduleId}/complete';

  // Purchase/Subscription Endpoints - Matching React Native endpoints
  static const String updateSubscription = '/user/update-subscription-details';
  static const String subscriptionPlans = '/subscriptions/plans';
  static const String currentSubscription = '/subscriptions/current';
  static const String subscribe = '/subscriptions/subscribe';
  static const String cancelSubscription = '/subscriptions/cancel';
  static const String upgradeSubscription = '/subscriptions/upgrade';
  static const String subscriptionHistory = '/subscriptions/history';
  static const String verifyPurchase = '/purchases/verify';
  static const String purchaseHistory = '/purchases/history';
  static const String refundRequest = '/purchases/refund';
  static const String paymentMethods = '/payments/methods';
  static const String addPaymentMethod = '/payments/methods';
  static const String updatePaymentMethod = '/payments/methods/{id}';
  static const String deletePaymentMethod = '/payments/methods/{id}';

  // Notifications Endpoints
  static const String notifications = '/notifications';
  static const String markNotificationRead = '/notifications/{id}/read';
  static const String markAllNotificationsRead = '/notifications/read-all';
  static const String deleteNotification = '/notifications/{id}';
  static const String notificationSettings = '/notifications/settings';
  static const String updateNotificationSettings = '/notifications/settings';
  static const String deviceTokens = '/notifications/devices';
  static const String registerDevice = '/notifications/devices';
  static const String unregisterDevice = '/notifications/devices/{id}';

  // Content Endpoints
  static const String content = '/content';
  static const String contentDetails = '/content/{id}';
  static const String contentByCategory = '/content/categories/{categoryId}';
  static const String featuredContent = '/content/featured';
  static const String recentContent = '/content/recent';
  static const String popularContent = '/content/popular';
  static const String searchContent = '/content/search';
  static const String bookmarkContent = '/content/bookmarks';
  static const String addBookmark = '/content/{id}/bookmark';
  static const String removeBookmark = '/content/{id}/bookmark';

  // Analytics Endpoints
  static const String analytics = '/analytics';
  static const String userAnalytics = '/analytics/user';
  static const String goalAnalytics = '/analytics/goals';
  static const String engagementMetrics = '/analytics/engagement';
  static const String performanceInsights = '/analytics/performance';
  static const String usageStats = '/analytics/usage';
  static const String reportAnalytics = '/analytics/report';

  // Support Endpoints
  static const String supportTickets = '/support/tickets';
  static const String createSupportTicket = '/support/tickets';
  static const String supportTicketDetails = '/support/tickets/{id}';
  static const String addTicketMessage = '/support/tickets/{id}/messages';
  static const String closeSupportTicket = '/support/tickets/{id}/close';
  static const String faq = '/support/faq';
  static const String contactInfo = '/support/contact';
  static const String feedback = '/support/feedback';
  static const String reportBug = '/support/bug-report';

  // System Endpoints
  static const String appVersion = '/system/version';
  static const String appConfig = '/system/config';
  static const String maintenance = '/system/maintenance';
  static const String health = '/system/health';
  static const String terms = '/system/terms';
  static const String privacy = '/system/privacy';
  static const String aboutApp = '/system/about';

  // File Upload Endpoints
  static const String uploadFile = '/files/upload';
  static const String deleteFile = '/files/{id}';
  static const String fileDetails = '/files/{id}';
  static const String downloadFile = '/files/{id}/download';

  // Helper methods for dynamic endpoints
  static String goalById(String id) => updateGoal.replaceAll('{id}', id);
  static String goalProgressById(String id) => goalProgress.replaceAll('{id}', id);
  static String assessmentById(String id) => assessmentDetails.replaceAll('{id}', id);
  static String resultById(String id) => resultDetails.replaceAll('{id}', id);
  static String audioTrackById(String id) => audioTrackDetails.replaceAll('{id}', id);
  static String playlistById(String id) => updatePlaylist.replaceAll('{id}', id);
  static String contentById(String id) => contentDetails.replaceAll('{id}', id);
  static String supportTicketById(String id) => supportTicketDetails.replaceAll('{id}', id);
  static String fileById(String id) => fileDetails.replaceAll('{id}', id);

  // Query parameter builders
  static String withPagination(String endpoint, {int? page, int? limit}) {
    final params = <String>[];
    if (page != null) params.add('page=$page');
    if (limit != null) params.add('limit=$limit');
    if (params.isEmpty) return endpoint;
    return '$endpoint?${params.join('&')}';
  }

  static String withFilter(String endpoint, Map<String, dynamic> filters) {
    if (filters.isEmpty) return endpoint;
    final params = filters.entries
        .where((entry) => entry.value != null)
        .map((entry) => '${entry.key}=${entry.value}')
        .toList();
    if (params.isEmpty) return endpoint;
    return '$endpoint?${params.join('&')}';
  }

  static String withSearch(String endpoint, String query) {
    return '$endpoint?q=${Uri.encodeQueryComponent(query)}';
  }

  static String withDateRange(String endpoint, {DateTime? startDate, DateTime? endDate}) {
    final params = <String>[];
    if (startDate != null) {
      params.add('start_date=${startDate.toIso8601String()}');
    }
    if (endDate != null) {
      params.add('end_date=${endDate.toIso8601String()}');
    }
    if (params.isEmpty) return endpoint;
    return '$endpoint?${params.join('&')}';
  }
}