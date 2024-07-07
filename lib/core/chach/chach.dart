import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper{
 static late SharedPreferences preferences;
 static Future<void> initCacheHelper()async{
     preferences =await SharedPreferences.getInstance();
  }

 static Future<void> setData(String key,dynamic value)async{
 await  preferences.setString(key, value);
  }
  static Future<String?> getData(String key)async{
  await preferences.getString(key);

  }

}