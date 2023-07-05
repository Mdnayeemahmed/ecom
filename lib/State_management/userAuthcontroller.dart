import 'dart:convert';

import 'package:ecom/Data/model/profile_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userAuthcontroller extends GetxController {
  static String? _token;
  static ProfileData? _profileData;


  static String? get token =>_token;
  static ProfileData? get profile =>_profileData;


  Future<bool> isLogin() async {
    await gettoken();
    await getProfileData();
    return _token != null;
  }

  Future<void> savetoken(String usertoken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = usertoken;
    await prefs.setString('crafty_token', usertoken);
  }

  Future<void> saveProfileData(ProfileData profile) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _profileData = profile;
    await prefs.setString('user_profile', profile.toJson().toString());
  }

  Future<void> gettoken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = await prefs.getString('crafty_token');
  }

  Future<void> getProfileData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _profileData = ProfileData.fromJson(jsonDecode(prefs.getString('user_profile') ?? '{}'));
  }

  Future<void> cleartoken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
