import 'package:flutter/cupertino.dart';

class RootProvider extends ChangeNotifier {
  String? customScaffoldTitleAr;

  String? StudentPic;

  String? route;

  Future<void> setCustomScaffoldTitleAr(String? name) async {
    customScaffoldTitleAr = name;
    notifyListeners();
  }

  Future<void> setStudentPic(String? pic) async {
    StudentPic = pic;
    notifyListeners();
  }

  Future<void> setRoute(String? rout) async {
    route = rout;
    notifyListeners();
  }
}
