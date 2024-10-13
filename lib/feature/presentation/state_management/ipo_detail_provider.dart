import 'package:flutter/cupertino.dart';
import 'package:ipo_tracker/feature/domain/use_cases/ipo_detail_use_case.dart';

import 'package:ipo_tracker/feature/domain/use_cases/ipo_use_case.dart';

import '../../../di/injection_container.dart';
import '../../../util/constants/asset_constant.dart';
import '../../../util/constants/string_constant.dart';
import '../../../util/internet_checker.dart';
import '../../../util/utility.dart';
import '../../data/modals/ipo_detail_modal.dart';
import '../../data/modals/ipo_modal.dart';


class IpoDetailProvider extends ChangeNotifier{




  bool isDataLoading=false;
  IpoDetailModalClass? ipoDetailModalClass;
  Future<void> callApiIpoDetail(String id) async {


    bool isConnected= await InternetChecker.checkInternetConnection();
    if(!isConnected) return;

    isDataLoading=true;
    Future.delayed(Duration.zero,() =>  notifyListeners());

    final Map<String, dynamic> params = {
      // StringConstants.pageNumber: pageNumber,
    };
    Map<String, dynamic>? resp;
    try{
      resp = await getIt<IpoDetailUseCases>().callApiIpoDetail(id);
      if( resp!=null ? resp.containsKey(StringConstants.success) && resp[StringConstants.success]==true : false ) {
         ipoDetailModalClass = IpoDetailModalClass.fromJson(resp);
      }
    }catch(error){
      Utility.printLog(StringConstants.error, error.toString());
    }
    finally {
      isDataLoading=false;
      notifyListeners();
    }

  }

  void init(){
    isDataLoading=false;
    ipoDetailModalClass=null;

  }


}