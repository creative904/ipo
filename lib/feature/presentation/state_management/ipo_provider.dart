import 'package:flutter/cupertino.dart';

import 'package:ipo_tracker/feature/domain/use_cases/ipo_use_case.dart';

import '../../../di/injection_container.dart';
import '../../../util/constants/asset_constant.dart';
import '../../../util/constants/string_constant.dart';
import '../../../util/utility.dart';
import '../../data/modals/ipo_modal.dart';


class TabModalClass{
  String icon;
  String title;
  TabModalClass({
    required this.icon, required this.title
  });
}

class IpoProvider extends ChangeNotifier{

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