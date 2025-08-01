import 'dart:async';
import 'dart:developer';

import 'package:fire3_22072025/provider/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});

  ///
  UserCredential? userCredential;

  ///
  Map<String, dynamic>? arguments;

  ///
  TextEditingController otpController = TextEditingController();

  ///

  @override
  Widget build(BuildContext context) {
    context.read<AppState>().startTimer();
    return Scaffold(
      appBar: AppBar(title: Text('OTP Screen'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            TextField(
              controller: otpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Enter OTP',
                suffixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () async {
                if (otpController.text.isNotEmpty) {
                  try {
                    PhoneAuthCredential credential = await context
                        .read<AuthService>()
                        .credential(otpController.text.toString());
                    userCredential = await context
                        .read<AuthService>()
                        .userCredential(credential);
                    log(userCredential.toString());
                    if (userCredential != null) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("OTP Verified")));
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/dashboard',
                        arguments: {'userCredential': userCredential},
                        (route) => false,
                      );
                    }
                  } catch (e) {
                    log(e.toString());
                  }
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Please enter OTP")));
                }
              },
              child: Text("Verify OTP"),
            ),

            Consumer<AppState>(
              builder: (context, appState, child) => Text(
                appState.isResendEnabled
                    ? "Didn't receive OTP?"
                    : "Resend OTP in ${appState.secondsRemaining} seconds",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Consumer<AppState>(
              builder: (context, appState, child) => ElevatedButton(
                onPressed: context.read<AppState>().isResendEnabled
                    ? () async {
                        context.read<AuthService>().verifyPhoneNumber(
                          phone: context.read<AuthService>().currentPhone,
                        );
                        context.read<AppState>().startTimer();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: appState.isResendEnabled
                      ? Colors.blueAccent
                      : Colors.grey,
                ),
                child: Text("Resend OTP"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
