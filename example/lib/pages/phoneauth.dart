import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_service.dart';

class PhoneAuth extends StatelessWidget {
  PhoneAuth({super.key});

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Phone screen'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 10,

              decoration: InputDecoration(
                hintText: 'Enter 10 Phone Number',
                prefix: Text("+91", style: TextStyle(color: Colors.black)),
                suffixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () async {
                if (phoneController.text.isNotEmpty) {
                  try {
                    context.read<AuthService>().verifyPhoneNumber(
                      phone: "+91${phoneController.text.toString()}",
                    );
                    Navigator.pushNamed(context, '/otp');
                  } catch (e) {
                    log(e.toString());
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter phone number")),
                  );
                }
              },
              child: Text("Send OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
