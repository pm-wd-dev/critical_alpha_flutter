import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/purchase_controller.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_fonts.dart';

class CriticalAlphaPurchasePage extends ConsumerStatefulWidget {
  const CriticalAlphaPurchasePage({super.key});

  @override
  ConsumerState<CriticalAlphaPurchasePage> createState() => _CriticalAlphaPurchasePageState();
}

class _CriticalAlphaPurchasePageState extends ConsumerState<CriticalAlphaPurchasePage> {
  bool isMonthlySelected = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Load subscription plans when page opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(purchaseControllerProvider.notifier).loadSubscriptionPlans();
    });
  }

  @override
  Widget build(BuildContext context) {
    final purchaseState = ref.watch(purchaseControllerProvider);
    final purchaseController = ref.read(purchaseControllerProvider.notifier);

    // Listen for successful purchase or restore
    ref.listen(lastPurchaseResultProvider, (previous, current) {
      if (current != null) {
        if (mounted && isLoading) {
          setState(() {
            isLoading = false;
          });
        }

        if (current.success) {
          // Navigate to home after successful purchase or restore
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(current.message ?? 'Purchase successful!'),
              backgroundColor: Colors.green,
            ),
          );
          // Navigate directly to home page, not splash
          if (current.message?.contains('restore') == true) {
            context.go('/home');
          } else {
            context.go('/home');
          }
        } else if (current.message != null) {
          // Show message for failed restore or no purchases
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(current.message!),
              backgroundColor: Colors.orange,
            ),
          );
        }
      }
    });

    // Listen for restore state changes
    ref.listen(purchaseControllerProvider.select((state) => state.isRestoring), (previous, current) {
      if (mounted && previous == true && current == false) {
        // Restore finished, stop loading
        setState(() {
          isLoading = false;
        });
      }
    });

    // Listen for purchase errors
    ref.listen(purchaseControllerProvider.select((state) => state.purchaseError), (previous, current) {
      if (current != null && current.isNotEmpty) {
        if (mounted && isLoading) {
          setState(() {
            isLoading = false;
          });
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(current),
            backgroundColor: Colors.red,
          ),
        );
        purchaseController.clearPurchaseError();
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Back Button
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/icons/backarrow.png',
                              width: 16,
                              height: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        // Logo
                        Container(
                          width: 280,
                          height: 175,
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.contain,
                          ),
                        ),

                        // Description
                        Text(
                          'Focussed audios designed to help you start adjusting your angle of attack using the Critical Alpha Methodology!',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppFonts.poppins,
                            color: Colors.grey[700],
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),

                        // Features List
                        _buildFeatureItem(
                          imagePath: 'assets/images/audiowave.png',
                          text: 'Audios < 15 mins long',
                        ),
                        const SizedBox(height: 20),
                        _buildFeatureItem(
                          imagePath: 'assets/images/sharp.png',
                          text: 'Short and sharp topics',
                        ),
                        const SizedBox(height: 20),
                        _buildFeatureItem(
                          imagePath: 'assets/images/softskill.png',
                          text: 'Soft skill focussed',
                        ),
                        const SizedBox(height: 20),
                        _buildFeatureItem(
                          imagePath: 'assets/images/dowload.png',
                          text: 'New audios regularly',
                        ),
                        const SizedBox(height: 32),

                        // Trial Info
                        Text(
                          '3 day free trial then',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.poppins,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Subscription Plans
                        _buildPlanOption(
                          title: 'Monthly',
                          price: purchaseState.isLoading ? 'Loading...' : '\$4.95',
                          period: '/month',
                          isSelected: isMonthlySelected,
                          onTap: () {
                            setState(() {
                              isMonthlySelected = true;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        _buildPlanOption(
                          title: 'Annually',
                          price: purchaseState.isLoading ? 'Loading...' : '\$49.95',
                          period: '/year',
                          isSelected: !isMonthlySelected,
                          onTap: () {
                            setState(() {
                              isMonthlySelected = false;
                            });
                          },
                        ),
                        const SizedBox(height: 32),

                        // Subscribe Button
                        GestureDetector(
                          onTap: purchaseState.isPurchasing || isLoading
                              ? null
                              : () async {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  try {
                                    // Purchase the selected plan
                                    final planId = isMonthlySelected
                                        ? 'criticalapha_month'
                                        : 'criticalalpha_year';

                                    await purchaseController.purchaseSubscription(planId);
                                  } catch (e) {
                                    print('Purchase error: $e');
                                  } finally {
                                    if (mounted) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  }
                                },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              purchaseState.isPurchasing || isLoading ? 'Processing...' : 'Subscribe',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: AppFonts.poppins,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Disclaimer
                        Text(
                          isMonthlySelected
                              ? '3 day free trial then \$4.95/month. Cancel anytime. Get your money back if you are not 100% satisfied just send us an email admin@criticalalpha.com'
                              : '3 day free trial then \$49.95/year. Cancel anytime. Get your money back if you are not 100% satisfied just send us an email admin@criticalalpha.com',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: AppFonts.poppins,
                            color: Colors.grey[600],
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),

                        // Links
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final url = Uri.parse('https://www.criticalalpha.com/privacypolicy');
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                }
                              },
                              child: Text(
                                'PrivacyPolicy',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppFonts.poppins,
                                  color: Colors.black87,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                final url = Uri.parse('https://www.criticalalpha.com/termsandconditions');
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                }
                              },
                              child: Text(
                                'Terms & Condition',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppFonts.poppins,
                                  color: Colors.black87,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: purchaseState.isRestoring || isLoading
                                  ? null
                                  : () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      try {
                                        await purchaseController.restorePurchases();
                                      } catch (e) {
                                        print('Restore error: $e');
                                        if (mounted) {
                                          setState(() {
                                            isLoading = false;
                                          });
                                        }
                                      }
                                    },
                              child: Text(
                                'Restore',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppFonts.poppins,
                                  color: Colors.black87,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Loading Overlay
          if (purchaseState.isPurchasing || purchaseState.isRestoring || isLoading)
            Container(
              color: Colors.black54,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 16),
                      Text(
                        purchaseState.isRestoring
                            ? 'Restoring purchases...'
                            : 'Processing purchase...',
                        style: TextStyle(
                          fontFamily: AppFonts.poppins,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required String imagePath,
    required String text,
  }) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          child: Image.asset(
            imagePath,
            width: 30,
            height: 30,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 20),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontFamily: AppFonts.poppins,
            color: const Color(0xFF333333),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildPlanOption({
    required String title,
    required String price,
    required String period,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? AppColors.primary : const Color(0xFFE0E0E0),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            // Radio button with custom icons
            Image.asset(
              isSelected ? 'assets/icons/check-active.png' : 'assets/icons/check-inactive.png',
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 16),
            // Plan details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppFonts.poppins,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppFonts.poppins,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        period,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppFonts.poppins,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}