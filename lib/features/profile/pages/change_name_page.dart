import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_assets.dart';
import '../services/profile_service.dart';
import '../../auth/controllers/auth_controller.dart';

class ChangeNamePage extends ConsumerStatefulWidget {
  const ChangeNamePage({super.key});

  @override
  ConsumerState<ChangeNamePage> createState() => _ChangeNamePageState();
}

class _ChangeNamePageState extends ConsumerState<ChangeNamePage> {
  final TextEditingController _nameController = TextEditingController();
  final ProfileService _profileService = ProfileService();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // Pre-fill with current username
    final user = ref.read(authControllerProvider).user;
    if (user != null && user.username != null) {
      _nameController.text = user.username!;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _changeName() async {
    final name = _nameController.text.trim();

    // Validation
    if (name.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter a name';
      });
      return;
    }

    if (name.length < 3) {
      setState(() {
        _errorMessage = 'Name must be at least 3 characters';
      });
      return;
    }

    if (name.length > 20) {
      setState(() {
        _errorMessage = 'Name must not exceed 20 characters';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final result = await _profileService.changeUsername(name);

      if (result['success']) {
        // Update local user data - reload user info
        await ref.read(authControllerProvider.notifier).getCurrentUser();

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(result['message'] ?? 'Username updated successfully'),
              backgroundColor: Colors.green,
            ),
          );
          context.go('/home');
        }
      } else {
        setState(() {
          _errorMessage = result['message'] ?? 'Failed to update username';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred. Please try again.';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                // Logo
                Center(
                  child: Image.asset(
                    AppAssets.logo,
                    height: 150,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 60),

                // Form Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name Label
                      const Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Name Input
                      TextField(
                        controller: _nameController,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontFamily: 'Poppins',
                        ),
                        onChanged: (value) {
                          if (_errorMessage != null) {
                            setState(() {
                              _errorMessage = null;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFF0147D9),
                              width: 1.5,
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF5F5F5),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          hintText: 'Enter your name',
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),

                      // Error Message
                      if (_errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            _errorMessage!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),

                      const SizedBox(height: 40),

                      // Save Button
                      Center(
                        child: _isLoading
                            ? const CircularProgressIndicator()
                            : SizedBox(
                                width: 140,
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: _changeName,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF0147D9),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    'Save',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                      ),

                      const SizedBox(height: 16),

                      // Cancel Button
                      Center(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF331E82),
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}