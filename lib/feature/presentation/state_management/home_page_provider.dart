import 'package:flutter/cupertino.dart';
import 'package:ipo_tracker/util/constants/string_constant.dart';


class HomePageProvider extends ChangeNotifier{

  int selectedIndex=0;


  String selectedTab=StringConstants.ipo;

  void setBottomIndex(int index){
    selectedIndex=index;
    switch(index){
      case 0:
        selectedTab=StringConstants.ipo;
        break;
      case 1:
        selectedTab=StringConstants.sme;
        break;
      case 2:
        selectedTab=StringConstants.market;
        break;
    }
    notifyListeners();
  }



  void init(){
    selectedIndex=0;
    selectedTab=StringConstants.ipo;
  }






}