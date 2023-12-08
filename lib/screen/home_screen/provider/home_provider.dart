import 'package:flutter/foundation.dart';

import '../model/home_model.dart';

class HomeProvider with ChangeNotifier
{
  // ignore: non_constant_identifier_names
  // List<Map> MyWebBrowser = [
  //   {
  //     'uri': "https://www.google.com/",
  //     'search': "https://www.google.com/search?q=",
  //   },
  //   {
  //     'uri': "https://www.yahoo.com/?guccounter=1",
  //     'search': "https://www.yahoo.com/search?q=",
  //   },
  //   {
  //     'uri': "https://www.bing.com/",
  //     'search': "https://www.bing.com/search?q=",
  //   },
  //   {
  //     'uri': "https://duckduckgo.com/",
  //     'search': "https://duckduckgo.com/search?q=",
  //   },
  // ];
  bool isOnline = false;
  double progressValue = 0.0;


  List<HomeModel> services =[
    HomeModel(link: "https://myaadhaar.uidai.gov.in/genricDownloadAadhaar"),
    HomeModel(link: "https://myaadhaar.uidai.gov.in/du"),
    HomeModel(link: "https://myaadhaar.uidai.gov.in/verify-email-mobile"),
    HomeModel(link: "https://myaadhaar.uidai.gov.in/genricPVC"),
    HomeModel(link: "https://myaadhaar.uidai.gov.in/check-aadhaar-validity"),
    HomeModel(link: "https://www.myntra.com/shop/women"),
  ];

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