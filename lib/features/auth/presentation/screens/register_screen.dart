
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

    return   Scaffold(// Dark navy background
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: SizedBox.shrink(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28,vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Logo
                // Logo
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.foundationSec,
                    borderRadius: BorderRadius.circular(50),

                  ),
                  child: SvgPicture.asset(
                    'assets/icons/gaming_pad.svg', // Placeholder: replace with actual asset or use SVG/Icon
                    width: 60,
                    height: 60,
                    color: AppColors.foundation,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Create An Account',
                  style: TextStyle(
                    color:AppColors.lightGrey,
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 25),
                InputField(
                  labelText: 'User Name',
                  hintText: 'Enter your name',
                  suffixIcon: Icon(Icons.person,color: Colors.grey.shade400,),
                  keyboardType: TextInputType.phone,
                  controller:emailController,
                  obscureText: false,
                ),
                // Password field
                InputField(
                    labelText: "password",
                    hintText: "Enter your password",
                    controller: passwordController,
                    suffixIcon: Icon(Icons.lock,color: Colors.grey.shade400),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword
                ),
                InputField(
                    labelText: "Confirm password",
                    hintText: "Confirm your password",
                    controller: passwordController,
                    suffixIcon: Icon(Icons.lock,color: Colors.grey.shade400),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword
                ),
                const SizedBox(height: 16),
                // Sign In button
                RoundedButton(
                    buttonText: 'Sign Up',
                    onPressed: () {
                      context.push(Routes.homeRouteName);
                    }
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 4,
                  children: [
                    Expanded(
                      child:  Divider(
                        height: 1,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    const Text(
                      'Contact Us To Get Admin Access',
                      style: TextStyle(color: AppColors.lightGrey,fontSize: 11),
                    ),
                    Expanded(
                      child: const Divider(
                        height: 1,
                        color: AppColors.lightGrey,
                      ),
                    ),
                  ],
                ),
                const Text(
                  '0916562124 / 0947635677',
                  style: TextStyle(color: AppColors.lightGrey,fontSize: 12,fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 16),
                // Sign up link
                GestureDetector(
                  onTap: () {
                    context.push(Routes.loginRouteName);
                  },
                  child:  Text.rich(
                      TextSpan(
                          text: 'You Already have an account? ',
                          style: const TextStyle(color: AppColors.lightGrey,fontSize: 14),
                          children: [
                            TextSpan(
                              text: 'Sign In',
                              style: TextStyle(color: AppColors.foundation,fontSize: 14,fontWeight: FontWeight.bold),
                            ),
                          ]
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
