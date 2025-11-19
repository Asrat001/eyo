
import 'package:eyo_bingo/shared/routes/route_names.dart';
import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:eyo_bingo/shared/ui/input_filed.dart';
import 'package:eyo_bingo/shared/ui/outlined_button.dart';
import 'package:eyo_bingo/shared/ui/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: SizedBox.shrink(),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary,
              AppColors.secondary,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
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
                      borderRadius: BorderRadius.circular(30),
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
                  
                  const SizedBox(height: 40),
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
                  
                  const SizedBox(height: 40),
                  
                  // Form Container
                  Container(
                    padding: EdgeInsets.all(24),
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
                        InputField(
                          labelText: 'Username',
                          hintText: 'Enter your username',
                          suffixIcon: Icon(Icons.person, color: Colors.grey.shade400),
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          obscureText: false,
                        ),
                        InputField(
                          labelText: "Password",
                          hintText: "Enter your password",
                          controller: passwordController,
                          suffixIcon: Icon(Icons.lock, color: Colors.grey.shade400),
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        InputField(
                          labelText: "Confirm Password",
                          hintText: "Confirm your password",
                          controller: confirmPasswordController,
                          suffixIcon: Icon(Icons.lock, color: Colors.grey.shade400),
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 24),
                        // Sign Up button
                        RoundedButton(
                          buttonText: 'Sign Up',
                          onPressed: () {
                            context.go(Routes.homeRouteName);
                          },
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
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
    );
  }
}
