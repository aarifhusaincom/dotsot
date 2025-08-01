import 'dart:async';

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
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      phoneNumber: phone,
      codeAutoRetrievalTimeout: (String verificationId1) {
        verificationId = verificationId1;
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
