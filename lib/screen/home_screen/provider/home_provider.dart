import 'package:flutter/foundation.dart';

import '../../../utils/shared_helper.dart';
import '../model/home_model.dart';

class HomeProvider with ChangeNotifier
{
  bool isOnline = false;
  double progressValue = 0.0;
  List<String>? bookMarkData = [];

  void getBookMark() async {
    ShareHelper shareHelper = ShareHelper();
    bookMarkData = await shareHelper.getBookMark();
    notifyListeners();
  }

  String browser = "Google";

  String get browserSet => browser;

  void setBrowser(String value) {
    browser = value;
    notifyListeners();
  }

  void changeStatus(bool status){
    isOnline = status;
    notifyListeners();
  }

  String maritalStatus = "Google";

  String get _maritalStatus => maritalStatus;

  void setMaritalStatus(String value) {
    maritalStatus = value;
    notifyListeners();
  }
  void progressBar(progress)
  {
    progressValue=progress/100;
    notifyListeners();
  }
}