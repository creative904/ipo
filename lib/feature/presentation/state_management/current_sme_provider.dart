import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../di/injection_container.dart';
import '../../../util/constants/string_constant.dart';
import '../../../util/internet_checker.dart';
import '../../../util/utility.dart';
import '../../data/modals/sme_modal.dart';

import '../../domain/use_cases/sme_use_case.dart';

class CurrentSmeProvider extends ChangeNotifier{

  bool isDataLoading=false;
  List<SMEs> currentSmeList=[];
  Future<void> callApiCurrentSme() async {

    isDataLoading=true;
    currentSmeList=[];
    Future.delayed(Duration.zero,() =>  notifyListeners());

    bool isConnected= await InternetChecker.checkInternetConnection();
    if(!isConnected) {
      isDataLoading=false;
      Future.delayed(Duration.zero,() =>  notifyListeners());
      return;
    }


    final Map<String, dynamic> params = {
      // StringConstants.pageNumber: pageNumber,
    };
    Map<String, dynamic>? resp;
    try{
      resp = await getIt<SmeUseCases>().callApiCurrentSme(params);
      if( resp!=null ? resp.containsKey(StringConstants.success) && resp[StringConstants.success]==true : false ) {
        SmeModalClass smeModalClass = SmeModalClass.fromJson(resp);

        currentSmeList= smeModalClass.data?.sMEs ?? [];

      }
    }catch(error){
      Utility.printLog(StringConstants.error, error.toString());
    }
    finally {
      isDataLoading=false;
      notifyListeners();
    }

  }


}