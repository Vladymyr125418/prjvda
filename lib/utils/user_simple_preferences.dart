import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences{
  static SharedPreferences? _preferences;


  static Future init() async {
  _preferences = await SharedPreferences.getInstance();
  }
  // set get level after pressing save button
  static Future setVal(var key, int value) async => await _preferences!.setInt(key, value);
  static int? getVal(var key) => _preferences?.getInt(key);
  static Future setSkin(var key, String name) async => await _preferences!.setString(key, name);
  static String? getSkin(var key) => _preferences?.getString(key);
  static Future addSkinList(var key, String list) async => await _preferences!.setString(key, list);
  static String? getSkinList(var key) => _preferences?.getString(key);
}