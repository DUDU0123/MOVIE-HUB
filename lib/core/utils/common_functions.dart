import 'package:movie_hub/core/constants/texts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonFunctions{
  
 static Future<void> setUserAuthStatus({required bool isLoggedIn})async{
    SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
   await sharedPreferences.setBool(userAuthStatus, isLoggedIn);
  }
 static Future<bool?> getUserAuthStatus()async{
    SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
   return sharedPreferences.getBool(userAuthStatus);
  }
}