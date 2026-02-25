import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key});

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  String selectedPlan = 'monthly'; // 'monthly' or 'annually'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Back Button and Logo
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFF0147D9),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 24,
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
                      height: 80,
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Image.asset(
                        'assets/images/app_.png',
                        fit: BoxFit.contain,
                      ),
                    ),

                    // Title
                    const Text(
                      'CRITICAL ALPHA METHODOLOGY',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        letterSpacing: 0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Description
                    const Text(
                      'Focussed audios designed to help you start adjusting your angle of attack using the Critical Alpha Methodology!',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF666666),
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

                    // Features List
                    _buildFeatureItem(
                      icon: Icons.audiotrack,
                      text: 'Audios < 15 mins long',
                    ),
                    const SizedBox(height: 20),
                    _buildFeatureItem(
                      icon: Icons.gps_fixed,
                      text: 'Short and sharp topics',
                    ),
                    const SizedBox(height: 20),
                    _buildFeatureItem(
                      icon: Icons.psychology,
                      text: 'Soft skill focussed',
                    ),
                    const SizedBox(height: 20),
                    _buildFeatureItem(
                      icon: Icons.cloud_download,
                      text: 'New audios regularly',
                    ),
                    const SizedBox(height: 32),

                    // Trial Info
                    const Text(
                      '3 day free trial then',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF666666),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Subscription Plans
                    _buildPlanOption(
                      title: 'Monthly',
                      price: '\$2.95',
                      period: '/month',
                      isSelected: selectedPlan == 'monthly',
                      onTap: () {
                        setState(() {
                          selectedPlan = 'monthly';
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildPlanOption(
                      title: 'Annually',
                      price: '\$30.00',
                      period: '/year',
                      isSelected: selectedPlan == 'annually',
                      onTap: () {
                        setState(() {
                          selectedPlan = 'annually';
                        });
                      },
                    ),
                    const SizedBox(height: 32),

                    // Subscribe Button
                    GestureDetector(
                      onTap: () {
                        // Handle subscription
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Text(
                          'Subscribe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Disclaimer
                    Text(
                      '3 day free trial then \$2.95/month. Cancel anytime. Get your money back if you are not 100% satisfied just send us an email admin@criticalalpha.com',
                      style: TextStyle(
                        fontSize: 13,
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
                          onTap: () {
                            // Open Privacy Policy
                          },
                          child: const Text(
                            'PrivacyPolicy',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Open Terms & Conditions
                          },
                          child: const Text(
                            'Terms & Condition',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle Restore
                          },
                          child: const Text(
                            'Restore',
                            style: TextStyle(
                              fontSize: 14,
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
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String text,
  }) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 28,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 20),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF333333),
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
            color: isSelected ? const Color(0xFF0147D9) : const Color(0xFFE0E0E0),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            // Radio button
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFF0147D9) : const Color(0xFFBDBDBD),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0147D9),
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 16),
            // Plan details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
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
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        period,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Checkmark for selected
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Color(0xFF0147D9),
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}