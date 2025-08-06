import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

// ValueNotifier<AuthService> authService = ValueNotifier(AuthService());
class AppState extends ChangeNotifier {
  int secondsRemaining = 120;
  bool isResendEnabled = false;
  Timer? timer;
  void startTimer() {
    isResendEnabled = false;
    secondsRemaining = 120;
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        notifyListeners();
      } else {
        isResendEnabled = true;
        timer.cancel();
        notifyListeners();
      }
    });
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();
  String verificationId = '';
  String currentPhone = '';

  ///
  Future<void> verifyPhoneNumber({required String phone}) async {
    await firebaseAuth.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        try {
          await firebaseAuth.signInWithCredential(credential);
          log("✅ Auto-verification successful");
          notifyListeners();
        } catch (e) {
          log("❌ Auto-verification failed: $e");
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        log("❌ Verification failed: ${e.message}");
      },
      codeSent: (String vId, int? resendToken) {
        verificationId = vId;
        currentPhone = phone;
        log("📩 Code sent. Verification ID saved. vId is $vId");
        notifyListeners();
      },
      phoneNumber: phone,
      codeAutoRetrievalTimeout: (String vId) {
        verificationId = vId; // ✅ Fallback storage
      },
    );
    currentPhone = phone;
    notifyListeners();
  }

  Future<PhoneAuthCredential> credential(String textOTP) async {
    return PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: textOTP,
    );
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<UserCredential> userCredential(PhoneAuthCredential credential) {
    return firebaseAuth.signInWithCredential(credential);
  }
}
