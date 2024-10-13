// import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ipo_tracker/feature/presentation/pages/home_page/widgets/botom_navigation_bar.dart';
import 'package:ipo_tracker/feature/presentation/pages/ipo/ipo_page.dart';
import 'package:ipo_tracker/feature/presentation/pages/market/market_page.dart';
import 'package:ipo_tracker/feature/presentation/pages/sme/sme_page.dart';
import 'package:ipo_tracker/feature/presentation/state_management/home_page_provider.dart';
import 'package:ipo_tracker/router/route_constant.dart';
import 'package:ipo_tracker/router/routes.dart';
import 'package:ipo_tracker/util/constants/color_constant.dart';
import 'package:ipo_tracker/util/utility.dart';

import 'package:ipo_tracker/util/constants/string_constant.dart';

import '../../state_management/current_ipo_provider.dart';
import '../../state_management/current_sme_provider.dart';
import '../../state_management/listed_ipo_provider.dart';
import '../../state_management/listed_sme_provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> dashBoardTabs=[
    const IpoPage(),
    const SmePage(),
    const MarketPage(),
  ];


  HomePageProvider? homePageProvider;
  CurrentIpoProvider? currentIpoProvider;
  ListedIpoProvider? listedIpoProvider;

  CurrentSmeProvider? currentSmeProvider;
  ListedSmeProvider? listedSmeProvider;


  @override
  void initState() {
    homePageProvider=Provider.of<HomePageProvider>(context,listen: false);
    currentIpoProvider=Provider.of<CurrentIpoProvider>(context,listen: false);
    listedIpoProvider=Provider.of<ListedIpoProvider>(context,listen: false);

    currentSmeProvider=Provider.of<CurrentSmeProvider>(context,listen: false);
    listedSmeProvider=Provider.of<ListedSmeProvider>(context,listen: false);


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: ColorConstant.primaryColor,
        title: Consumer<HomePageProvider>(
          builder: (context, homePageProvider,child) {
            return Padding(
              padding:  EdgeInsets.fromLTRB(20.w,0,0,0),
              child: Text(
                  homePageProvider.selectedTab,
                style: TextStyle(
                    color: ColorConstant.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500)
              ),
            );
          }
        ),
        actions: [
          // if(((homePageProvider?.selectedIndex ?? 0)!=2))
            Consumer<HomePageProvider>(
                builder: (context, homePageProvider,child) {
                return (homePageProvider.selectedIndex ?? 0)!=2 ?
                  InkWell(
                onTap: (){
                  currentIpoProvider?.callApiCurrentIpo();
                  listedIpoProvider?.callApiListedIpo();
                  currentSmeProvider?.callApiCurrentSme();
                  listedSmeProvider?.callApiListedSme();
                 // switch(homePageProvider?.selectedIndex ?? 0){
                 //   case 0: {
                 //     currentIpoProvider?.callApiCurrentIpo();
                 //     listedIpoProvider?.callApiListedIpo();
                 //     break;
                 //   }
                 //   case 1:{
                 //     currentSmeProvider?.callApiCurrentSme();
                 //     listedSmeProvider?.callApiListedSme();
                 //     break;
                 //   }
                 //   default:{
                 //     break;
                 //   }
                 // }
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(5.w,0,20.w,0),
                  child: Icon(
                    Icons.refresh,
                    size: 25.r,
                    color: ColorConstant.white,
                  ),
                ),
                          ) : Container();
              }
            ),
          InkWell(
            onTap: (){
              AppRouter.goRouter.push(AppRouterPath.setting);
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(5.w,0,20.w,0),
              child: Icon(
                Icons.settings,
                size: 25.r,
                color: ColorConstant.white,
              ),
            ),
          )
        ],
      ),
      body: Selector<HomePageProvider, int>(
        selector: (_, provider) => provider.selectedIndex,
        builder: (context, selectedIndex, child) =>Container(
          color: ColorConstant.notificationGreyColor,
          child: IndexedStack(
            index: selectedIndex,
            children: dashBoardTabs,
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
