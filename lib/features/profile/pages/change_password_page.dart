import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_assets.dart';
import '../services/profile_service.dart';

class ChangePasswordPage extends ConsumerStatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  ConsumerState<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final ProfileService _profileService = ProfileService();

  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  String? _newPasswordError;
  String? _confirmPasswordError;
  String? _generalError;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _clearErrors() {
    setState(() {
      _newPasswordError = null;
      _confirmPasswordError = null;
      _generalError = null;
    });
  }

  Future<void> _changePassword() async {
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;

    _clearErrors();

    // Validation
    if (newPassword.isEmpty && confirmPassword.isEmpty) {
      setState(() {
        _generalError = 'Please fill required fields';
      });
      return;
    }

    if (newPassword.length < 8) {
      setState(() {
        _newPasswordError = 'Password must be at least 8 characters';
      });
      return;
    }

    if (confirmPassword.length < 8) {
      setState(() {
        _confirmPasswordError = 'Confirm Password must be at least 8 characters';
      });
      return;
    }

    if (newPassword != confirmPassword) {
      setState(() {
        _generalError = 'Password and Confirm Password are not same';
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final result = await _profileService.changePassword(newPassword);

      if (result['success']) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password changed successfully'),
              backgroundColor: Colors.green,
            ),
          );
          context.go('/home');
        }
      } else {
        setState(() {
          _generalError = result['message'] ?? 'Failed to change password';
        });
      }
    } catch (e) {
      setState(() {
        _generalError = 'Server error. Please try again.';
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
                      // New Password Label
                      const Text(
                        'New Password',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8),

                      // New Password Input
                      TextField(
                        controller: _newPasswordController,
                        obscureText: _obscureNewPassword,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontFamily: 'Poppins',
                        ),
                        onChanged: (value) => _clearErrors(),
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
                          hintText: '••••••••',
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                            fontFamily: 'Poppins',
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureNewPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.grey,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureNewPassword = !_obscureNewPassword;
                              });
                            },
                          ),
                        ),
                      ),

                      // New Password Error
                      if (_newPasswordError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            _newPasswordError!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),

                      const SizedBox(height: 16),

                      // Confirm Password Label
                      const Text(
                        'Re-type Password',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Confirm Password Input
                      TextField(
                        controller: _confirmPasswordController,
                        obscureText: _obscureConfirmPassword,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontFamily: 'Poppins',
                        ),
                        onChanged: (value) => _clearErrors(),
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
                          hintText: '••••••••',
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                            fontFamily: 'Poppins',
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.grey,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureConfirmPassword = !_obscureConfirmPassword;
                              });
                            },
                          ),
                        ),
                      ),

                      // Confirm Password Error
                      if (_confirmPasswordError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            _confirmPasswordError!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),

                      // General Error
                      if (_generalError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            _generalError!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),

                      const SizedBox(height: 40),

                      // Done Button
                      Center(
                        child: _isLoading
                            ? const CircularProgressIndicator()
                            : SizedBox(
                                width: 140,
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: _changePassword,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF0147D9),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    'Done',
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