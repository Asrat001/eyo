
import 'package:eyo_bingo/shared/routes/route_names.dart';
import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:eyo_bingo/shared/ui/input_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/ui/rounded_button.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();


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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                        // Email field
                        InputField(
                          hintText: 'Enter your username',
                          suffixIcon: Icon(Icons.person, color: Colors.grey.shade400),
                          labelText: 'Username',
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          obscureText: false,
                        ),
                        // Password field
                        InputField(
                          hintText: "Enter your password",
                          labelText: "Password",
                          controller: passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
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
                          buttonText: 'Sign In',
                          onPressed: () {
                            context.go(Routes.homeRouteName);
                          },
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