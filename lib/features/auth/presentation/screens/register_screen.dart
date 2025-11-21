import 'package:eyo_bingo/features/auth/presentation/providers/auth_providers.dart';
import 'package:eyo_bingo/shared/routes/route_names.dart';
import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:eyo_bingo/shared/ui/input_filed.dart';
import 'package:eyo_bingo/shared/ui/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final username = _usernameController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Call register action
    final register = ref.read(registerActionProvider);
    final result = await register(username: username, password: password);

    if (!mounted) return;

    result.when(
      success: (user) {
        // Navigate based on role (new users are typically players)
        if (user.isSuperAdmin) {
          context.go(Routes.superAdminHomeRouteName);
        } else if (user.isAdmin) {
          context.go(Routes.adminHomeRouteName);
        } else {
          context.go(Routes.homeRouteName);
        }
      },
      failure: (error) {
        // Error is already set in provider, show snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
            backgroundColor: Colors.red,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authLoadingProvider);
    final errorMessage = ref.watch(authErrorProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        elevation: 0,
        leading: SizedBox.shrink(),
      ),
      body: Container(
        decoration: BoxDecoration(
   
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo with enhanced styling
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.foundationSec,
                            AppColors.foundation.withOpacity(0.3),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.foundation.withOpacity(0.3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/gaming_pad.svg',
                        width: 80,
                        height: 80,
                        color: AppColors.foundation,
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 16),
                    // Title
                    Text(
                      'Create Account',
                      style: TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sign up to start winning',
                      style: TextStyle(
                        color: AppColors.lightGrey.withOpacity(0.7),
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Form Container
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF2D3748).withOpacity(0.6),
                            Color(0xFF1A202C).withOpacity(0.6),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          // Error message
                          if (errorMessage != null) ...[
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.red.withOpacity(0.5),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      errorMessage,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16),
                          ],

                          InputField(
                            labelText: 'Username',
                            hintText: 'Enter your username',
                            suffixIcon: Icon(
                              Icons.person,
                              color: Colors.grey.shade400,
                            ),
                            keyboardType: TextInputType.text,
                            controller: _usernameController,
                            obscureText: false,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter a username';
                              }
                              if (value.trim().length < 3) {
                                return 'Username must be at least 3 characters';
                              }
                              return null;
                            },
                          ),
                          InputField(
                            labelText: "Password",
                            hintText: "Enter your password",
                            controller: _passwordController,
                            suffixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey.shade400,
                            ),
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          InputField(
                            labelText: "Confirm Password",
                            hintText: "Confirm your password",
                            controller: _confirmPasswordController,
                            suffixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey.shade400,
                            ),
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 8),
                          // Sign Up button
                          RoundedButton(
                            buttonText: isLoading
                                ? 'Creating Account...'
                                : 'Sign Up',
                            onPressed: isLoading ? null : _handleRegister,
                            isLoading: isLoading,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Admin Access Info
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.amber.withOpacity(0.1),
                            Colors.orange.withOpacity(0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.amber.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.admin_panel_settings,
                            color: Colors.amber,
                            size: 32,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Need Admin Access?',
                            style: TextStyle(
                              color: AppColors.lightGrey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Contact us for admin privileges',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.lightGrey.withOpacity(0.7),
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.phone, color: Colors.amber, size: 16),
                              SizedBox(width: 6),
                              Text(
                                '0916562124 / 0947635677',
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),
                    // Sign in link
                    GestureDetector(
                      onTap: () {
                        context.push(Routes.loginRouteName);
                      },
                      child: Text.rich(
                        TextSpan(
                          text: 'Already have an account? ',
                          style: const TextStyle(
                            color: AppColors.lightGrey,
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                color: AppColors.foundation,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
