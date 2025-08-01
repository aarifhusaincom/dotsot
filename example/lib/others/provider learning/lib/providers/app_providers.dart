import 'package:flutter/material.dart';

class AgeCheck extends ChangeNotifier {
  int _age = 0;
  String _eligibleMessage = "";
  bool _isEligible = false;
  set checkEligibility(int age) {
    _age = age;
    if (age >= 18) {
      _isEligible = true;
      _eligibleMessage = "You are eligible to vote";
    } else {
      _isEligible = false;
      _eligibleMessage = "You are not eligible to vote";
    }
    notifyListeners();
  }

  String get eligibleMessage => _eligibleMessage;
  bool get isEligible => _isEligible;
  int get age => _age;
}

class OddEven extends ChangeNotifier {
  String _message = "";
  bool _isOdd = false;
  set checkOddEven(int number) {
    if (number % 2 == 0) {
      _isOdd = false;
      _message = "The number is even";
    } else {
      _isOdd = true;
      _message = "The number is odd";
    }
    notifyListeners();
  }

  String get message => _message;
  bool get isOdd => _isOdd;
}
