
import 'package:eyo_bingo/core/service/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'di.dart';
import 'observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive database
  await HiveService().init();
  
  // Setup dependency injection
  await serviceLocator();

  runApp(
      ProviderScope(
       observers: [Observers()],
         child:const EyoBingoApp()
     )
  );
}

