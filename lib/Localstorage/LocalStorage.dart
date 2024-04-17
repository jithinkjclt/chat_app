import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  setUser(String email) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString("email", email);
  }

  getUser() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    return sh.getString("email");
  }
  deleteUser()async{
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.remove("email");
  }
}
