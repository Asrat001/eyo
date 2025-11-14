import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../utils/constants.dart';


class LocalStorageService {
  SharedPreferences? _preferences;
  final FlutterSecureStorage _flutterSecuredStorage =
  const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  LocalStorageService() {
    _init();
  }

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// get is onboarding
  bool getIsDoneOnboarding() {
    final isDoneOnboarding = _preferences?.getBool(
      LocalStorageKey.isDoneOnboarding,
    );
    if (isDoneOnboarding == null) {
      return false;
    }

    debugPrint("onboarding state from local storage: ${isDoneOnboarding}");

    return isDoneOnboarding;
  }

  /// set is onboarding
  Future<void> setIsDoneOnboarding(bool value) async {
    if (_preferences == null) {
      print("onboarding state Error Saving  value: ${value}");
      return;
    }
    print("onboarding state value: ${value}");
    await _preferences?.setBool(LocalStorageKey.isDoneOnboarding, value);
  }

  /// delete is onboarding
  Future<void> deleteIsDoneOnboarding() async {
    if (_preferences == null) {
      return;
    }
    await _preferences?.remove(LocalStorageKey.isDoneOnboarding);
  }

  /// set refresh token
  Future<void> setRefreshToken(String token) async {
    debugPrint("refresh token: $token");
    await _flutterSecuredStorage.write(
      key: LocalStorageKey.refreshToken,
      value: token,
    );
  }

  /// get refresh token
  Future<String?> getRefreshToken() async {
    return await _flutterSecuredStorage.read(key: LocalStorageKey.refreshToken);
  }

  /// delete refresh token
  Future<void> deleteRefreshToken() async {
    await _flutterSecuredStorage.delete(key: LocalStorageKey.refreshToken);
  }

  /// set token
  Future<void> setAccessToken(String token) async {
    debugPrint("token: $token");

    await _flutterSecuredStorage.write(
      key: LocalStorageKey.accessToken,
      value: token,
    );
  }

  bool getIsGuest() {
    final isGuest = _preferences?.getString(LocalStorageKey.accessToken);
    if (isGuest == null) {
      return true;
    }
    return false;
  }

  /// get token
  Future<String?> getAccessToken() {
    return _flutterSecuredStorage.read(key: LocalStorageKey.accessToken);
  }

  /// delete token
  Future<void> deleteAccessToken() async {
    await _flutterSecuredStorage.delete(key: LocalStorageKey.accessToken);
  }

  /// set is dark mode
  Future<void> setIsDarkMode(bool value) async {
    if (_preferences == null) {
      return;
    }
    await _preferences?.setBool(LocalStorageKey.isDarkMode, value);
  }

  /// get is dark mode
  bool getIsDarkMode() {
    final isDarkMode = _preferences?.getBool(LocalStorageKey.isDarkMode);
    if (isDarkMode == null) {
      return false;
    }
    return isDarkMode;
  }

  /// clear all
  Future<void> clear() async {
    if (_preferences == null) {
      return;
    }
    await _preferences?.clear();
    await _flutterSecuredStorage.deleteAll();
  }

  // set app theme mode
  Future<void> setAppThemeMode(bool isDarkMode) async {
    log('setAppThemeMode: $isDarkMode');
    if (_preferences != null) {
      await _preferences!.setBool(LocalStorageKey.themeMode, isDarkMode);
    }
  }

  bool getAppThemeMode() {
    log('getAppThemeMode ${_preferences?.getBool(LocalStorageKey.themeMode)}');
    return _preferences?.getBool(LocalStorageKey.themeMode) ?? false;
  }

  void deleteAppThemeMode() {
    log('deleteAppThemeMode');
    _preferences?.remove(LocalStorageKey.themeMode);
  }

  // /// Clear all authentication data
  Future<void> clearAuthData() async {
    if (_preferences == null) {
      return;
    }
    await deleteAccessToken();
    await deleteRefreshToken();
    // Add any other auth-related data that needs to be cleared
  }

  // /// Set user data - accepts UserData object and handles JSON encoding
  // Future<void> setUserData(UserResponseModel userData) async {
  //   debugPrint("setting user name at set user : ${userData.userName}");
  //   if (_preferences == null) {
  //     return;
  //   }
  //   try {
  //     final userDataJson = jsonEncode(userData.toJson());
  //     await _preferences?.setString(LocalStorageKey.userData, userDataJson);
  //   } catch (e) {
  //     debugPrint("Error saving user data ${e.toString()}");
  //   }
  // }
  //
  // /// Get user data - handles JSON decoding and returns UserData object
  // UserResponseModel? getUserData() {
  //   log('getting user  data: ');
  //   if (_preferences == null) {
  //     log('getting user  data: null error ');
  //     return null;
  //   }
  //   final userDataJson = _preferences?.getString(LocalStorageKey.userData);
  //   if (userDataJson == null) {
  //     log('getting user  data: user null error ');
  //     return null;
  //   }
  //   try {
  //     return UserResponseModel.fromJson(jsonDecode(userDataJson));
  //   } catch (e) {
  //     log('Error decoding user data: $e');
  //     return null;
  //   }
  // }

  // /// Delete user data
  // Future<void> deleteUserData() async {
  //   if (_preferences == null) {
  //     return;
  //   }
  //   await _preferences?.remove(LocalStorageKey.userData);
  // }
}

