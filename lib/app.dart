
import 'package:eyo_bingo/shared/routes/app_route.dart';
import 'package:eyo_bingo/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'di.dart';

class EyoBingoApp extends StatelessWidget {
  const EyoBingoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme:AppTheme.lightTheme,
      darkTheme:AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false ,
     routerConfig: sl<AppRouter>().router,
    );
  }
}

