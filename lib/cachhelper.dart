import 'package:shared_preferences/shared_preferences.dart';

class cachehelper {
  static  late SharedPreferences sharedprefernces;
  static  init() async {
    sharedprefernces = await SharedPreferences.getInstance();
  }

  String? getDataString({
    required String key,
  }) {
    return sharedprefernces.getString(key);
  }
  Future<bool>savedata(
      {required String key,required dynamic value})async{
    if(value is bool){
      return await sharedprefernces.setBool(key, value);
    }
    if(value is String){
      return await sharedprefernces.setString(key, value);
    }
    if(value is int){
      return await sharedprefernces.setInt(key, value);
    }
    else{
      return await sharedprefernces.setDouble(key, value);
    }
  }
  dynamic getdata({required String key}){
    return sharedprefernces.get(key);
  }
}
