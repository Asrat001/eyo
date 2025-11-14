
import 'package:eyo_bingo/shared/routes/route_names.dart';
import 'package:eyo_bingo/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) { // ✅ prevents navigation after widget is disposed
        context.push(Routes.loginRouteName);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.primary,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:AppColors.primary,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.primary,
        ),
        leading: SizedBox.shrink(),
      ),
      body: Stack(
        children: [
          // Background feather image
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/icons/feather.svg',
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.05),
                BlendMode.srcATop,
              ),
            ),
          ),

          // Center logo
          Center(
            child: SvgPicture.asset(
              'assets/icons/gaming_pad.svg',
              width: 100,
              height: 100,
              color: Colors.indigo,
            ),
          ),

          // Bottom text
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'Eyo Bingo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'By: Itech Solutions',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
