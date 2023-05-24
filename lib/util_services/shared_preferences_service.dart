import 'package:shared_preferences/shared_preferences.dart';

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
}

enum SharedPreferencesKeys {
  onboarding,
}