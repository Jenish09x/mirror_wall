import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper
{
  Future<void> setBookMark(List<String> bookMarkData)
  async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList("Url", bookMarkData);
  }
  Future<List<String>?> getBookMark()
  async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return  preferences.getStringList('Url');
  }

}