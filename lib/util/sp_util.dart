import 'package:shared_preferences/shared_preferences.dart';

class SpUtil{


  static void put<T>(String key,T value)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch(T){
      case String:
        prefs.setString(key, value as String);
        break;
      case int:
        prefs.setInt(key, value as int);
        break;
      case bool:
        prefs.setBool(key, value as bool);
        break;
      case double:
        prefs.setDouble(key, value as double);
        break;
    }
  }


  static Future<Object> get(String key)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static remove(String key)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }




}