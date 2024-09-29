import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';



class PrefrencesManager extends GetxController {
  RxString authToken = ''.obs;
  RxInt userId = 0.obs;

  Future<void> saveToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('authToken', token ?? '');
  }

  Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authToken.value = prefs.getString('authToken') ?? '';
    return authToken.value.isNotEmpty ? authToken.value : null;
  }

  Future<void> clearAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('authToken');
  }

  Future<void> saveUserId(int? id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', id ?? 0);
    userId.value = id ?? 0;
  }

  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId.value = prefs.getInt('userId') ?? 0;
    return userId.value;
  }

  Future<void> clearUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
  }

  static const String _isFirstLoginKey = 'isFirstLogin';

  Future<bool?> getIsFirstLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isFirstLoginKey);
  }

  Future<void> setIsFirstLogin(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isFirstLoginKey, value);
  }

  Future<void> setFeedTutorialShown(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('feedTutorialShown', value);
  }

  Future<bool> isFeedTutorialShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('feedTutorialShown') ?? false;
  }
}
