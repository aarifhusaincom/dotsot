import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSettings extends ChangeNotifier {
  static SharedPreferences? prefs;

  /// user
  static String? _user;
  String? get user => _user;

  /// notification
  static bool? _isNotification;
  bool? get isNotification => _isNotification;

  ///dark theme
  static bool? _isDarkTheme;
  bool? get isDarkTheme => _isDarkTheme;

  /// vibration settings by default on
  static bool? _isVibration;
  bool? get isVibration => _isVibration;

  static Future<void> getPref() async {
    prefs = await SharedPreferences.getInstance();

    /// check user if not then set it to NA
    if (prefs?.containsKey("user") == false) {
      await prefs?.setString('user', "Unknow User");
      _user = prefs?.getString('user');
    } else {
      _user = prefs?.getString('user');
    }

    /// check notification if not then set it to false
    if (prefs?.containsKey("notification") == false) {
      await prefs?.setBool('notification', false);
      _isNotification = prefs?.getBool('notification');
    } else {
      _isNotification = prefs?.getBool('notification');
    }

    /// check dark theme if not then set it to false
    if (prefs?.containsKey("darkTheme") == false) {
      await prefs?.setBool('darkTheme', false);
      _isDarkTheme = prefs?.getBool('darkTheme');
    } else {
      _isDarkTheme = prefs?.getBool('darkTheme');
    }

    /// check vibration  if not then set it to false
    if (prefs?.containsKey("vibration ") == false) {
      await prefs?.setBool('vibration ', false);
      _isVibration = prefs?.getBool('vibration ');
    } else {
      _isVibration = prefs?.getBool('vibration ');
    }
  }

  /// set user
  Future<void> setUser(String value) async {
    await prefs?.setString('user', value);
    _user = prefs?.getString('user');
    notifyListeners();
  }

  /// notification setting
  Future<void> setNotification(bool value) async {
    await prefs?.setBool('notification', value);
    _isNotification = prefs?.getBool('notification');
    notifyListeners();
  }

  /// set dark theme
  Future<void> setDarkTheme(bool value) async {
    await prefs?.setBool('darkTheme', value);
    _isDarkTheme = prefs?.getBool('darkTheme');
    notifyListeners();
  }

  /// set vibration setting
  Future<void> setVibration(bool value) async {
    await prefs?.setBool('vibration', value);
    _isVibration = prefs?.getBool('vibration');
    notifyListeners();
  }
}
