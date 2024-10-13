import 'package:flutter/cupertino.dart';


import '../../../util/constants/asset_constant.dart';
import '../../../util/constants/string_constant.dart';



class TabModalClass{
  String icon;
  String title;
  TabModalClass({
    required this.icon, required this.title
  });
}

class SmeProvider extends ChangeNotifier{

  List<TabModalClass> tabList=[
    TabModalClass(icon: AssetConstant.home, title:StringConstants.currentUp ),
    TabModalClass(icon: AssetConstant.home, title:StringConstants.listed ),
   ];

  int tabIndex=0;
  void changeTabIndex(int index){
    tabIndex=index;
    notifyListeners();
  }


  void init(){
    tabIndex=0;
  }
}