import 'package:eyo_bingo/features/auth/presentation/providers/auth_providers.dart';
import 'package:eyo_bingo/shared/routes/route_names.dart';
import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:eyo_bingo/shared/ui/input_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/ui/rounded_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    // Call login action
    final login = ref.read(loginActionProvider);
    final result = await login(username: username, password: password);

    if (!mounted) return;

    result.when(
      success: (user) {
        // Navigate based on role
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: SizedBox.shrink(),
      ),
      body: SafeArea(
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
                  // Welcome text
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign in to continue playing',
                    style: TextStyle(
                      color: AppColors.lightGrey.withOpacity(0.7),
                      fontSize: 16,
                    ),
                  ),
      
                  const SizedBox(height: 16),
      
                  // Form Container
                  Container(
                    padding: EdgeInsets.all(18),
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
      
                        // Username field
                        InputField(
                          hintText: 'Enter your username',
                          suffixIcon: Icon(
                            Icons.person,
                            color: Colors.grey.shade400,
                          ),
                          labelText: 'Username',
                          keyboardType: TextInputType.text,
                          controller: _usernameController,
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        // Password field
                        InputField(
                          hintText: "Enter your password",
                          labelText: "Password",
                          controller: _passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        // Forgot password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: AppColors.foundation,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Sign In button
                        RoundedButton(
                          buttonText: isLoading ? 'Signing In...' : 'Sign In',
                          onPressed: isLoading ? null : _handleLogin,
                          isLoading: isLoading,
                        ),
                      ],
                    ),
                  ),
      
                  const SizedBox(height: 32),
      
                  // Divider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          height: 1,
                          color: AppColors.lightGrey.withOpacity(0.3),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'or',
                          style: TextStyle(
                            color: AppColors.lightGrey.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          height: 1,
                          color: AppColors.lightGrey.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
      
                  const SizedBox(height: 32),
                  // Sign up link
                  GestureDetector(
                    onTap: () {
                      context.push(Routes.registerRouteName);
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: const TextStyle(
                          color: AppColors.lightGrey,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
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
    );
  }
}
