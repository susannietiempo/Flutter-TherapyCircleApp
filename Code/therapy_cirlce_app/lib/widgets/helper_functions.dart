import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferenceFirstNameKey = "FIRSTNAMEKEY";
  static String sharedPreferenceLastNameKey = "LASTNAMEKEY";
  static String sharedPreferenceUserEmailKey = "USEREMAILKEY";
  static String prefsName = "firstName";

//fave functions

  static addFnameToSP(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(prefsName, name);
  }

  static readFnameToSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString(prefsName);
    return stringValue;
  }

  static Future<bool> saveUserLoggedInSharedPreference(
      bool isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(
        sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveFirstNameSharedPreference(String firstName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceFirstNameKey, firstName);
  }

  static Future<bool> saveLastNameSharedPreference(String lastName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceLastNameKey, lastName);
  }

  static Future<bool> saveUserEmailSharedPreference(String userEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserEmailKey, userEmail);
  }

  /// fetching data from sharedpreference

  static Future<bool> getUserLoggedInSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(sharedPreferenceUserLoggedInKey);
  }

  static Future<String> getFirstNameSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceFirstNameKey);
  }

  static Future<String> getLastNameSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceLastNameKey);
  }

  static Future<String> getUserEmailSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserEmailKey);
  }

  static Future<bool> clearPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.clear();
  }


}
