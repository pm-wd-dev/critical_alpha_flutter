import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_assets.dart';
import '../../../routes/route_constants.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../goals/controllers/goals_controller.dart';
import '../../results/controllers/results_controller.dart';
import '../controllers/dashboard_controller.dart';
import '../../../core/widgets/bottom_navigation.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    // Load initial data
    Future.microtask(() {
      print('🏠 HomePage: Loading dashboard data...');
      ref.read(dashboardControllerProvider.notifier).loadDashboard();
      ref.read(goalsControllerProvider.notifier).loadGoals();
      ref.read(resultsControllerProvider.notifier).loadResults();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Reload dashboard when coming back to this screen
    final dashboardState = ref.read(dashboardControllerProvider);
    if (!dashboardState.isLoading && dashboardState.dashboardData == null) {
      print('🔄 HomePage: Reloading dashboard due to null data');
      ref.read(dashboardControllerProvider.notifier).loadDashboard();
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final goalsState = ref.watch(goalsControllerProvider);
    final resultsState = ref.watch(resultsControllerProvider);
    final dashboardState = ref.watch(dashboardControllerProvider);

    // Use dashboard user data if available, otherwise fall back to auth user
    final dashboardUser = dashboardState.user;
    final authUser = authState.user;

    // Check subscription status from different sources
    bool isPurchased = dashboardState.isPurchased;

    // Check from dashboard user (Map)
    if (dashboardUser != null && dashboardUser is Map) {
      isPurchased = isPurchased ||
                   dashboardUser['isSubscribed'] == true ||
                   dashboardUser['isPremium'] == true;
    }

    // Check from auth user (UserModel)
    if (!isPurchased && authUser != null) {
      isPurchased = authUser.isSubscribed == true || authUser.isPremium == true;
    }

    // Set status bar style
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Show error if any
                if (dashboardState.error != null)
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Error loading dashboard: ${dashboardState.error}',
                          style: TextStyle(color: Colors.red.shade700),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            ref.read(dashboardControllerProvider.notifier).loadDashboard();
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),

                // Show loading if dashboard is loading
                if (dashboardState.isLoading)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(50),
                      child: CircularProgressIndicator(),
                    ),
                  )
                else ...[
                  // Header with profile and social icons
                  _buildHeader(dashboardUser ?? authUser),
                  const SizedBox(height: 24),

                  // Quick Actions Cards
                  _buildQuickActions(context),
                  const SizedBox(height: 24),

                  // Alpha Performance Section - using meter assessment data from API
                  _buildAlphaPerformance(dashboardState),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(dynamic user) {
    // Handle both UserModel and Map<String, dynamic> from API
    String? firstName;
    String? username;
    String? profilePicture;

    print('🔍 _buildHeader - User type: ${user.runtimeType}');
    print('🔍 _buildHeader - User data: $user');

    if (user is Map) {
      firstName = user['firstName'] ?? user['first_name'] ?? user['name'];
      username = user['username'] ?? user['userName'] ?? user['email'];
      profilePicture = user['profilePicture'] ?? user['profile_picture'] ?? user['avatar'];
      print('📝 Extracted from Map - firstName: $firstName, username: $username');
    } else if (user != null) {
      // Assuming it's UserModel
      try {
        firstName = user.firstName;
        username = user.username;
        profilePicture = user.profilePicture;
        print('📝 Extracted from UserModel - firstName: $firstName, username: $username');
      } catch (e) {
        print('❌ Error extracting from UserModel: $e');
      }
    }

    print('👤 Final display - Name: ${firstName ?? username ?? "User"}');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CriticalAlpha icon - Opens Drawer
            GestureDetector(
              onTap: () => openDrawer(),
              child: Container(
                width: 60,
                height: 60,
                margin: const EdgeInsets.only(bottom: 8),
                child: Image.asset(
                  AppAssets.drawerIcon,
                  fit: BoxFit.contain,
                ),
              ),
            ),
         
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

               Text(
              firstName ?? username ?? 'User',
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        Row(
          children: [
            // Profile Image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.shade400,
                border: Border.all(
                  color: const Color(0xFF0147D9),
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: profilePicture != null
                    ? Image.network(
                        profilePicture,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          'assets/images/emptyProfile.jpeg',
                          fit: BoxFit.cover,
                        ),
                      )
                    : Image.asset(
                        'assets/images/emptyProfile.jpeg',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildSocialIcon(AppAssets.whatsapp),
        const SizedBox(width: 12),
        _buildSocialIcon(AppAssets.facebook),
        const SizedBox(width: 12),
        _buildSocialIcon(AppAssets.instagram),
      ],
    );
  }

  Widget _buildSocialIcon(String asset) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          asset,
          width: 36,
          height: 36,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final dashboardState = ref.watch(dashboardControllerProvider);
    final authState = ref.watch(authControllerProvider);
    final dashboardUser = dashboardState.user;
    final authUser = authState.user;

    // Check subscription status
    bool isPurchased = dashboardState.isPurchased;

    if (dashboardUser != null && dashboardUser is Map) {
      isPurchased = isPurchased ||
                   dashboardUser['isSubscribed'] == true ||
                   dashboardUser['isPremium'] == true;
    }

    if (!isPurchased && authUser != null) {
      isPurchased = authUser.isSubscribed == true || authUser.isPremium == true;
    }

    return Column(
      children: [
        // Social Icons above the cards - aligned to the right
        Align(
          alignment: Alignment.centerRight,
          child: _buildSocialIcons(),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                context: context,
                title: 'My Plans',
                imageAsset: 'assets/images/pdcaicon.png',
                iconColor: const Color(0xFF0147D9),
                onTap: () => context.go(RouteConstants.goals),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildActionCard(
                context: context,
                title: 'Member Audios',
                imageAsset: isPurchased ? AppAssets.memberAudioP : AppAssets.memberAudio,
                iconColor: Colors.grey,
                isLocked: !isPurchased,
                isPurchased: isPurchased,
                onTap: () {
                  if (isPurchased) {
                    context.go(RouteConstants.audio);
                  } else {
                    context.go(RouteConstants.purchase);
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required BuildContext context,
    required String title,
    IconData? icon,
    String? imageAsset,
    required Color iconColor,
    required VoidCallback onTap,
    bool isLocked = false,
    bool isPurchased = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                if (imageAsset != null)
                  Image.asset(
                    imageAsset,
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  )
                else if (icon != null)
                  Icon(
                    icon,
                    size: 50,
                    color: iconColor,
                  ),
                if (title == 'Member Audios')
                  Positioned(
                    top: -20,
                    right: -20,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          isPurchased ? AppAssets.lockOpen : AppAssets.lockClose,
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlphaPerformance(DashboardState dashboardState) {
    // Get meter assessment data from API
    final meterData = dashboardState.meterAssessmentData;
    final assessment = dashboardState.assessment;

    print('📊 _buildAlphaPerformance - meterData: $meterData');
    print('📊 _buildAlphaPerformance - assessment: $assessment');

    // Check if we have any assessment data
    bool hasAssessmentData = false;
    int mostRecentValue = 0;
    int overallValue = 0;

    // Try to extract from meterData first
    if (meterData.isNotEmpty) {
      for (var item in meterData) {
        if (item is Map && item.isNotEmpty && item.keys.length > 1) {
          if (item['type'] == 'mostRecent' && item['score'] != null) {
            mostRecentValue = (item['score'] as num).toInt();
            if (mostRecentValue > 0) hasAssessmentData = true;
          } else if (item['type'] == 'average' && item['score'] != null) {
            overallValue = (item['score'] as num).toInt();
            if (overallValue > 0) hasAssessmentData = true;
          }
        }
      }
    }

    // Check assessment data
    if (assessment != null && assessment is Map && assessment.isNotEmpty) {
      if (assessment.containsKey('rating') || assessment.containsKey('score') || assessment.containsKey('percentage')) {
        hasAssessmentData = true;
        if (mostRecentValue == 0) {
          mostRecentValue = _extractMostRecentScore(assessment) ?? 0;
        }
      }
    }

    // Check if assessment is an empty list
    if (assessment is List && (assessment as List).isEmpty) {
      hasAssessmentData = false;
    }

    print('📊 Has Assessment Data: $hasAssessmentData');
    print('📊 Scores - Most Recent: $mostRecentValue, Overall: $overallValue');

    // Get category scores from assessment data
    final categoryScores = _extractCategoryScoresFromAssessment(assessment);
    print('📊 Category scores: $categoryScores');
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'ALPHA PERFORMANCE',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              color: Colors.black87,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 24),

          // Show placeholder if no assessment data
          if (!hasAssessmentData)
            _buildNoAssessmentPlaceholder()
          else ...[
            // Performance Gauges
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPerformanceGauge('Most Recent', mostRecentValue),
                _buildPerformanceGauge('Overall', overallValue),
              ],
            ),
            const SizedBox(height: 32),

            // Performance Categories from API data
            _buildPerformanceCategory('Awareness', Icons.lightbulb, categoryScores['awareness'] ?? 0.0),
            const SizedBox(height: 16),
            _buildPerformanceCategory('Learning', Icons.psychology, categoryScores['learning'] ?? 0.0),
            const SizedBox(height: 16),
            _buildPerformanceCategory('Performance', Icons.trending_up, categoryScores['performance'] ?? 0.0),
            const SizedBox(height: 16),
            _buildPerformanceCategory('Harnessing', Icons.fitness_center, categoryScores['harnessing'] ?? 0.0),
            const SizedBox(height: 16),
            _buildPerformanceCategory('Adaptability', Icons.sync, categoryScores['adaptability'] ?? 0.0),
          ],
        ],
      ),
    );
  }

  Widget _buildPerformanceGauge(String label, int value) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                value: value / 100,
                strokeWidth: 8,
                backgroundColor: Colors.grey.shade200,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFF0147D9),
                ),
              ),
            ),
            Text(
              '$value%',
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildPerformanceCategory(String title, IconData icon, double progress) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF0147D9).withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 24,
            color: const Color(0xFF0147D9),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: Colors.grey.shade200,
            valueColor: const AlwaysStoppedAnimation<Color>(
              Color(0xFF0147D9),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }

  // Helper methods to extract data from API response
  int? _extractMostRecentScore(Map<String, dynamic>? assessment) {
    if (assessment == null) return null;
    try {
      // From the API response, assessment has 'rating' and 'percentage'
      if (assessment['rating'] != null) {
        // Convert rating to percentage (rating * 10)
        return ((assessment['rating'] as num) * 10).round();
      }
      if (assessment['percentage'] != null) {
        // Convert decimal percentage to 0-100
        return ((assessment['percentage'] as num) * 100).round();
      }
      return null;
    } catch (e) {
      print('Error extracting most recent score: $e');
      return null;
    }
  }

  int? _extractOverallScore(List<dynamic> meterData) {
    if (meterData.isEmpty) return null;
    try {
      // Look for average data in meter data
      for (var item in meterData) {
        if (item is Map && item['rating'] != null) {
          // Check if this is the average item
          if (item == meterData.last) {  // Assuming average is the second item
            return ((item['rating'] as num) * 10).round();  // Convert rating to percentage
          }
        }
      }
      return null;
    } catch (e) {
      print('Error extracting overall score: $e');
      return null;
    }
  }

  Map<String, double> _extractCategoryScores(List<dynamic> meterData) {
    final scores = <String, double>{};

    try {
      for (var item in meterData) {
        if (item is Map) {
          final category = item['category']?.toString().toLowerCase() ?? '';
          final score = item['score'];

          if (score != null) {
            final value = (score as num).toDouble() / 100; // Convert to 0-1 range

            if (category.contains('awareness')) {
              scores['awareness'] = value;
            } else if (category.contains('learning')) {
              scores['learning'] = value;
            } else if (category.contains('performance')) {
              scores['performance'] = value;
            } else if (category.contains('harnessing')) {
              scores['harnessing'] = value;
            } else if (category.contains('adaptability')) {
              scores['adaptability'] = value;
            }
          }
        }
      }
    } catch (e) {
      print('Error extracting category scores: $e');
    }

    return scores;
  }

  Map<String, double> _extractCategoryScoresFromAssessment(Map<String, dynamic>? assessment) {
    final scores = <String, double>{};

    try {
      if (assessment != null && assessment['data'] != null) {
        final dataList = assessment['data'] as List;

        for (var item in dataList) {
          if (item is Map) {
            final smallText = item['small_text']?.toString().toLowerCase() ?? '';
            final rate = item['rate'];

            if (rate != null) {
              // Rate is 1-5, convert to 0-1 range
              final value = (rate as num).toDouble() / 5.0;

              if (smallText.contains('awareness')) {
                scores['awareness'] = value;
              } else if (smallText.contains('learning')) {
                scores['learning'] = value;
              } else if (smallText.contains('performance')) {
                scores['performance'] = value;
              } else if (smallText.contains('harnessing')) {
                scores['harnessing'] = value;
              } else if (smallText.contains('adaptability')) {
                scores['adaptability'] = value;
              }
            }
          }
        }
      }
    } catch (e) {
      print('Error extracting category scores from assessment: $e');
    }

    return scores;
  }

  Widget _buildNoAssessmentPlaceholder() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF0147D9).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.assessment_outlined,
              size: 48,
              color: Color(0xFF0147D9),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'No Assessment Data Yet',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Complete your first assessment\nto see your performance metrics',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Navigate to assessment
              context.push('/goals/assessment');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0147D9),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text(
              'Take Assessment',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}