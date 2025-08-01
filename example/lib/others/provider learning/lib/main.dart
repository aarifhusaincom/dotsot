import 'package:flutter/material.dart';
import 'pages/homepage.dart';

import 'package:provider/provider.dart';

import 'providers/app_providers.dart';
import 'providers/local_settings_provider.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AgeCheck()),
        ChangeNotifierProvider(create: (context) => OddEven()),
        ChangeNotifierProvider(create: (context) => LocalSettings()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
