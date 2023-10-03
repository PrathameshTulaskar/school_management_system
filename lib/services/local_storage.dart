
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService{

  static late SharedPreferences _sharedPreferences;

  static Future<void> initialize() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String _keyAuthToken = "authToken";
  static const String _keyFcmToken = "fcmToken";
  static const String _keyUserType = "userType";



  // clear local storage data
  static Future<void> clearData() async{
    await _sharedPreferences.clear();
  }


  // auth token
  static Future<bool> setAuthToken(String authToken) async {
    return await _sharedPreferences.setString(_keyAuthToken, authToken);
  }

  static dynamic getAuthToken(){
    return _sharedPreferences.getString(_keyAuthToken);
  }


  // fcm token
  static Future<bool> setFcmToken(String fcmToken) async {
    return await _sharedPreferences.setString(_keyFcmToken, fcmToken);
  }

  static dynamic getFcmToken(){
    return _sharedPreferences.getString(_keyFcmToken);
  }


  // name
  static Future<bool> setUserType(String? userType) async {
    if(userType==null){
      return false;
    }
    return await _sharedPreferences.setString(_keyUserType, userType);
  }

  static dynamic getUserType(){
    return _sharedPreferences.getString(_keyUserType);
  }



}

