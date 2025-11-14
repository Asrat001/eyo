
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'di.dart';
import 'observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();

  runApp(
      ProviderScope(
       observers: [Observers()],
         child:const EyoBingoApp()
     )
  );
}
