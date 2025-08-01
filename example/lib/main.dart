import 'package:fire3_22072025/provider/auth_service.dart';
import 'package:provider/provider.dart';

import 'pages/phoneauth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dashboard.dart';
import 'pages/otpscreen.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  User? currentUser = FirebaseAuth.instance.currentUser;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => AppState()),
      ],
      child: MyApp(isLoggedIn: currentUser != null),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: isLoggedIn ? Dashboard() : PhoneAuth(),
      // home: isLoggedIn ? Dashboard() : Dashboard(),
      routes: {
        '/phone': (context) => PhoneAuth(),
        '/otp': (context) => OTPScreen(),
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}
