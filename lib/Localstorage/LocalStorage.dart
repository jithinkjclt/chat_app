import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
 static setUser(String email) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString("email", email);
  }

 static Future<String?> getUser() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String? data= sh.getString("email");
    return data;
  }

  deleteUser() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.remove("email");
  }
}
