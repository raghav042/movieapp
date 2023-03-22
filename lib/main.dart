import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/homepage.dart';
import 'package:movieapp/theme/dark_theme.dart';
import 'package:movieapp/theme/light_theme.dart';
import 'package:movieapp/theme/system_style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUIStyle();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
      return MaterialApp(
        theme: lightTheme(lightDynamic),
        darkTheme: darkTheme(darkDynamic),
        themeMode: ThemeMode.system,
        home: const HomePage(),
      );
    });
  }
}
