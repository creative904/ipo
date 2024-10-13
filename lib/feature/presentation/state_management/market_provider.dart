import 'package:flutter/cupertino.dart';
import 'package:ipo_tracker/feature/data/modals/bonus_modal_class.dart';
import 'package:ipo_tracker/feature/data/modals/dividend_modal.dart';
import 'package:ipo_tracker/feature/data/modals/rights_modal_class.dart';
import 'package:ipo_tracker/feature/data/modals/splits_modal_class.dart';
import 'package:ipo_tracker/feature/domain/use_cases/market_use_case.dart';

import '../../../di/injection_container.dart';
import '../../../util/constants/string_constant.dart';
import '../../../util/internet_checker.dart';
import '../../../util/utility.dart';
import '../../domain/use_cases/ipo_use_case.dart';

class MarketProvider extends ChangeNotifier{

  bool isDividendDataLoading=false;
  List<Data> dividendList=[];
  Future<void> callApiDividend() async {

    isDividendDataLoading=true;
    dividendList=[];
    Future.delayed(Duration.zero,() =>  notifyListeners());

    bool isConnected= await InternetChecker.checkInternetConnection();
    if(!isConnected) {
      isDividendDataLoading=false;
      Future.delayed(Duration.zero,() =>  notifyListeners());
      return;
    }

    final Map<String, dynamic> params = {
      // StringConstants.pageNumber: pageNumber,
    };
    Map<String, dynamic>? resp;
    try{
      resp = await getIt<MarketUseCases>().callApiDividend(params);
      if( resp!=null ? resp.containsKey(StringConstants.success) && resp[StringConstants.success]==true : false ) {
        DividendModalClass dividendModalClass = DividendModalClass.fromJson(resp);

        dividendList= dividendModalClass.data ?? [];

      }
    }catch(error){
      Utility.printLog(StringConstants.error, error.toString());
    }
    finally {
      isDividendDataLoading=false;
      notifyListeners();
    }

  }

  bool isBonusDataLoading=false;
  List<BonusData> bonusList=[];
  Future<void> callApiBonus() async {

    isBonusDataLoading=true;
    bonusList=[];
    Future.delayed(Duration.zero,() =>  notifyListeners());


    bool isConnected= await InternetChecker.checkInternetConnection();
    if(!isConnected) {

      isBonusDataLoading=false;
      Future.delayed(Duration.zero,() =>  notifyListeners());
      return;
    }

    final Map<String, dynamic> params = {
      // StringConstants.pageNumber: pageNumber,
    };
    Map<String, dynamic>? resp;
    try{
      resp = await getIt<MarketUseCases>().callApiBonus(params);
      if( resp!=null ? resp.containsKey(StringConstants.success) && resp[StringConstants.success]==true : false ) {
        BonusModalClass bonusModalClass = BonusModalClass.fromJson(resp);

        bonusList= bonusModalClass.data ?? [];

      }
    }catch(error){
      Utility.printLog(StringConstants.error, error.toString());
    }
    finally {
      isBonusDataLoading=false;
      notifyListeners();
    }

  }

  bool isSplitsDataLoading=false;
  List<SplitData> splitList=[];
  Future<void> callApiSplits() async {

    isSplitsDataLoading=true;
    splitList=[];

    Future.delayed(Duration.zero,() =>  notifyListeners());


    bool isConnected= await InternetChecker.checkInternetConnection();
    if(!isConnected) {

      isSplitsDataLoading=false;
      Future.delayed(Duration.zero,() =>  notifyListeners());
      return;
    }


    final Map<String, dynamic> params = {
      // StringConstants.pageNumber: pageNumber,
    };
    Map<String, dynamic>? resp;
    try{
      resp = await getIt<MarketUseCases>().callApiSplits(params);
      if( resp!=null ? resp.containsKey(StringConstants.success) && resp[StringConstants.success]==true : false ) {
        SplitsModalClass splitsModalClass = SplitsModalClass.fromJson(resp);

        splitList= splitsModalClass.data ?? [];

      }
    }catch(error){
      Utility.printLog(StringConstants.error, error.toString());
    }
    finally {
      isSplitsDataLoading=false;
      notifyListeners();
    }

  }

  bool isRightsDataLoading=false;
  List<RightsData> rightsList=[];
  Future<void> callApiRights() async {

    isRightsDataLoading=true;
    rightsList=[];
    Future.delayed(Duration.zero,() =>  notifyListeners());


    bool isConnected= await InternetChecker.checkInternetConnection();
    if(!isConnected) {

      isRightsDataLoading=false;
      Future.delayed(Duration.zero,() =>  notifyListeners());
      return;
    }


    final Map<String, dynamic> params = {
      // StringConstants.pageNumber: pageNumber,
    };
    Map<String, dynamic>? resp;
    try{
      resp = await getIt<MarketUseCases>().callApiRights(params);
      if( resp!=null ? resp.containsKey(StringConstants.success) && resp[StringConstants.success]==true : false ) {
        RightsModalClass rightsModalClass = RightsModalClass.fromJson(resp);

        rightsList= rightsModalClass.data ?? [];

      }
    }catch(error){
      Utility.printLog(StringConstants.error, error.toString());
    }
    finally {
      isRightsDataLoading=false;
      notifyListeners();
    }

  }

}