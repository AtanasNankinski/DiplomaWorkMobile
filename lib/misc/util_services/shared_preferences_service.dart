import 'package:shared_preferences/shared_preferences.dart';

import 'package:diploma_work_mobile/auth/user_model.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance = SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return _instance;
  }

  SharedPreferencesService._internal();

  late SharedPreferences sharedPreferences;

  Future<void> setup() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setOnboarding(bool value) async {
    await sharedPreferences.setBool(SharedPreferencesKeys.onboarding.toString(), value);
  }

  bool getOnboarding() {
    final bool? data = sharedPreferences.getBool(SharedPreferencesKeys.onboarding.toString());
    if(data != null){
      return data;
    }else {
      return false;
    }
  }

  Future<void> setUser(int id, String name, String email, int userType, String token) async {
    await sharedPreferences.setInt(SharedPreferencesKeys.authId.toString(), id);
    await sharedPreferences.setString(SharedPreferencesKeys.authName.toString(), name);
    await sharedPreferences.setString(SharedPreferencesKeys.authEmail.toString(), email);
    await sharedPreferences.setInt(SharedPreferencesKeys.authUserType.toString(), userType);
    await sharedPreferences.setString(SharedPreferencesKeys.authToken.toString(), token);
  }

  Future<void> clearUser() async {
    await sharedPreferences.remove(SharedPreferencesKeys.authId.toString());
    await sharedPreferences.remove(SharedPreferencesKeys.authName.toString());
    await sharedPreferences.remove(SharedPreferencesKeys.authEmail.toString());
    await sharedPreferences.remove(SharedPreferencesKeys.authUserType.toString());
    await sharedPreferences.remove(SharedPreferencesKeys.authToken.toString());
  }

  User getUser(){
    int? id = sharedPreferences.getInt(SharedPreferencesKeys.authId.toString());
    String? name = sharedPreferences.getString(SharedPreferencesKeys.authName.toString());
    String? email = sharedPreferences.getString(SharedPreferencesKeys.authEmail.toString());
    int? userType = sharedPreferences.getInt(SharedPreferencesKeys.authUserType.toString());
    String? token = sharedPreferences.getString(SharedPreferencesKeys.authToken.toString());

    if(_checkUserData(id, name, email, userType, token)){
      return User(id: id!, name: name!, email: email!, userType: userType!, accessToken: token!);
    }
    return User(id: null, name: "", email: "", userType: 0, accessToken: "");
  }

  Future<void> updateUsername(String name) async {
    await sharedPreferences.setString(SharedPreferencesKeys.authName.toString(), name);
  }

  _checkUserData(int? id, String? name, String? email, int? userType, String? token){
    if(id != null && name != null && email != null && userType != null && token != null){
      return true;
    }
    return false;
  }
}

enum SharedPreferencesKeys {
  onboarding,
  authId,
  authName,
  authEmail,
  authUserType,
  authToken,
}