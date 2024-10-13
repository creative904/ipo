import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../di/injection_container.dart';
import '../../../util/constants/string_constant.dart';
import '../../../util/internet_checker.dart';
import '../../../util/utility.dart';
import '../../data/modals/ipo_modal.dart';
import '../../domain/use_cases/ipo_use_case.dart';

class ListedIpoProvider extends ChangeNotifier{

  bool isDataLoading=false;
  List<Ipos> listedIpoList=[];
  Future<void> callApiListedIpo() async {
    isDataLoading=true;
    listedIpoList=[];
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
      resp = await getIt<IpoUseCases>().callApiListedIpo(params);
      if( resp!=null ? resp.containsKey(StringConstants.success) && resp[StringConstants.success]==true : false ) {
        IpoModalClass ipoModalClass = IpoModalClass.fromJson(resp);

        listedIpoList= ipoModalClass.data?.ipos ?? [];

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