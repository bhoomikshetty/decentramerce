import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceServices {
  static SharedPreferences? pref;

  setSharedPref() async {
    pref = await SharedPreferences.getInstance();
    return pref;
  }
}
