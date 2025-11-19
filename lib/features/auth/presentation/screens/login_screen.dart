
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


    return Scaffold(// Dark navy background
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
                const SizedBox(height: 16     ),
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
                  'Welcome',
                  style: TextStyle(
                    color:AppColors.lightGrey,
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 25),
                // Email field
                InputField(
                  hintText: 'Enter your user name',
                  suffixIcon: Icon(Icons.person,color: Colors.grey.shade400,),
                  labelText: 'User Name',
                  keyboardType: TextInputType.emailAddress,
                  controller:emailController,
                  obscureText: false,
                ),
                // Password field
                InputField(
                    hintText: "Enter your password",
                    labelText: "Password",
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword
                ),
                const SizedBox(height: 12),
                // Sign In button
                RoundedButton(
                  buttonText: 'Sign In',
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
                        color: AppColors.primary,
                      ),
                    ),
                    const Text(
                      'or continue with',
                      style: TextStyle(color: AppColors.primary,fontSize: 14),
                    ),
                    Expanded(
                      child: const Divider(
                        height: 1,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),


                const SizedBox(height: 16),
                // Sign up link
                GestureDetector(
                  onTap: () {
                    context.push(Routes.registerRouteName);
                  },
                  child:  Text.rich(
                    TextSpan(
                      text: 'Don\'t have an account? ',
                      style: const TextStyle(color: AppColors.lightGrey,fontSize: 14),
                      children: [
                        TextSpan(
                          text: 'Sign up',
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