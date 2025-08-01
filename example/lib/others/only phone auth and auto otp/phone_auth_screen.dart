import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuthScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  String? verificationId;
  bool isOtpSent = false;
  bool isLoading = false;

  void startPhoneAuth() async {
    setState(() => isLoading = true);

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${phoneController.text.trim()}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ✅ Auto-detected on Android
        await FirebaseAuth.instance.signInWithCredential(credential);
        showSuccess("Auto-verified & signed in!");
      },
      verificationFailed: (FirebaseAuthException e) {
        showError("Verification failed: ${e.message}");
      },
      codeSent: (String verId, int? resendToken) {
        setState(() {
          verificationId = verId;
          isOtpSent = true;
        });
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
      },
      timeout: const Duration(seconds: 60),
    );

    setState(() => isLoading = false);
  }

  void verifyOtp() async {
    final smsCode = otpController.text.trim();

    if (verificationId == null) return;

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: smsCode,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      showSuccess("Signed in manually with OTP!");
    } catch (e) {
      showError("OTP verification failed");
    }
  }

  void showSuccess(String msg) => ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.green));

  void showError(String msg) => ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.red));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Phone Auth")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Enter Phone Number",
                    ),
                  ),
                  if (isOtpSent)
                    TextField(
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Enter OTP"),
                    ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isOtpSent ? verifyOtp : startPhoneAuth,
                    child: Text(isOtpSent ? "Verify OTP" : "Send OTP"),
                  ),
                ],
              ),
      ),
    );
  }
}
