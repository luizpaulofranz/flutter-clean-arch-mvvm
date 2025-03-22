import 'package:countries_app/modules/countries/presentation/countries_screen.dart';
import 'package:flutter/material.dart';

import 'dependency_injection.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.registerDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Countries App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CountriesScreen(),
    );
  }
}
