import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../controllers/plans_controller.dart';
import '../models/plan_model.dart';

class CreatePlanPage extends ConsumerStatefulWidget {
  const CreatePlanPage({super.key});

  @override
  ConsumerState<CreatePlanPage> createState() => _CreatePlanPageState();
}

class _CreatePlanPageState extends ConsumerState<CreatePlanPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _aimController = TextEditingController();
  final _navigateController = TextEditingController();

  int _aimCharCount = 0;
  int _navigateCharCount = 0;
  final int _maxAimChars = 500;
  final int _maxNavigateChars = 500;

  @override
  void initState() {
    super.initState();
    _aimController.addListener(() {
      setState(() {
        _aimCharCount = _aimController.text.length;
      });
    });
    _navigateController.addListener(() {
      setState(() {
        _navigateCharCount = _navigateController.text.length;
      });
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _aimController.dispose();
    _navigateController.dispose();
    super.dispose();
  }

  Future<void> _createPlan() async {
    if (!_formKey.currentState!.validate()) return;

    final request = CreatePlanRequest(
      title: _titleController.text.trim(),
      description: _aimController.text.trim(),
      contingency: _navigateController.text.trim(),
    );

    try {
      await ref.read(plansControllerProvider.notifier).createPlan(request);
      if (mounted) {
        // Refresh the plans list
        await ref.read(plansControllerProvider.notifier).loadPlans();
        // Navigate back
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error creating plan: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showInfoTooltip(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        content: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              height: 1.5,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Got it',
              style: TextStyle(
                color: Color(0xFF0147D9),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final plansState = ref.watch(plansControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Custom Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  // Back button
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0147D9),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.white, size: 18),
                      onPressed: () => context.pop(),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Plans',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  // Profile icon
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0147D9),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            // Form Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Plan Name
                        const Text(
                          'Plan Name:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFF9F9F9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFFE0E0E0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFFE0E0E0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFF0147D9),
                                width: 2,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a plan name';
                            }
                            if (value.trim().length < 2) {
                              return 'Plan name must be at least 2 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),

                        // AIM
                        Row(
                          children: [
                            const Text(
                              'AIM:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: Container(
                                width: 24,
                                height: 24,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF0147D9),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.info_outline,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                              onPressed: () {
                                _showInfoTooltip(
                                  context,
                                  'AIM',
                                  'Align your goals with your mission. Innovate your strategies to achieve your goals. Measureable indicators of success to track & improve.',
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _aimController,
                          maxLines: 8,
                          maxLength: _maxAimChars,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFF9F9F9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFFE0E0E0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFFE0E0E0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFF0147D9),
                                width: 2,
                              ),
                            ),
                            counterText: '',
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your AIM';
                            }
                            if (value.trim().length < 5) {
                              return 'AIM must be at least 5 characters';
                            }
                            return null;
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Characters $_aimCharCount/$_maxAimChars',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // NAVIGATE
                        Row(
                          children: [
                            const Text(
                              'NAVIGATE:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: Container(
                                width: 24,
                                height: 24,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF0147D9),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.info_outline,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                              onPressed: () {
                                _showInfoTooltip(
                                  context,
                                  'NAVIGATE',
                                  'Write down the possible challenges that you will face and visualise effective tactics to overcome these strategies so that you are well prepared.',
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _navigateController,
                          maxLines: 8,
                          maxLength: _maxNavigateChars,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFF9F9F9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFFE0E0E0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFFE0E0E0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFF0147D9),
                                width: 2,
                              ),
                            ),
                            counterText: '',
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your NAVIGATE plan';
                            }
                            if (value.trim().length < 5) {
                              return 'NAVIGATE must be at least 5 characters';
                            }
                            return null;
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Characters $_navigateCharCount/$_maxNavigateChars',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Bottom Buttons
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  // Cancel Button
                  TextButton(
                    onPressed: () => context.pop(),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Add Button
                  ElevatedButton(
                    onPressed: plansState.isCreating ? null : _createPlan,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0147D9),
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      plansState.isCreating ? 'Creating...' : 'Add',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
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