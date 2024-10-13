
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ipo_tracker/feature/presentation/pages/allotment/allotment_page.dart';
import 'package:ipo_tracker/feature/presentation/pages/bonus/bonus_info.dart';
import 'package:ipo_tracker/feature/presentation/pages/dividend/dividend_info.dart';
import 'package:ipo_tracker/feature/presentation/pages/home_page/home_page.dart';
import 'package:ipo_tracker/feature/presentation/pages/ipo_investor_categories/ipo_investor_categories_page.dart';
import 'package:ipo_tracker/feature/presentation/pages/rights/rights_info.dart';
import 'package:ipo_tracker/feature/presentation/pages/rights/rights_page.dart';
import 'package:ipo_tracker/feature/presentation/pages/setting/setting_page.dart';
import 'package:ipo_tracker/feature/presentation/pages/sme_detail/sme_detail_page.dart';
import 'package:ipo_tracker/feature/presentation/pages/split/split_page.dart';
import 'package:ipo_tracker/feature/presentation/pages/split/splits_info.dart';



import 'package:ipo_tracker/router/route_constant.dart';


import 'package:ipo_tracker/di/injection_container.dart';


import 'package:ipo_tracker/firebase/analytic_observer.dart';

import 'package:ipo_tracker/main_common.dart';
import 'package:ipo_tracker/router/navigation_service.dart';

import '../feature/presentation/pages/bonus/bonus_page.dart';
import '../feature/presentation/pages/dividend/dividend_page.dart';
import '../feature/presentation/pages/ipo_detail/ipo_detail_page.dart';
import '../feature/presentation/pages/splash.dart';


class AppRouter{

  static final goRouter = GoRouter(
    initialLocation: AppRouterPath.splash,
    routes: routes,
    navigatorKey: getIt<NavigationService>().navigatorKey,
    // observers: <NavigatorObserver>[routeObserver, getIt<ObserverAnalytics>().observer],
    observers: <NavigatorObserver>[routeObserver],
  );

  static List<RouteBase> routes=[
    GoRoute(
        name: RouteName.routeNameSplash,
        path: AppRouterPath.splash,
        builder: (BuildContext context, GoRouterState state) =>   const SplashPage()
    ),

    GoRoute(

        path: AppRouterPath.home,
        builder: (BuildContext context, GoRouterState state) =>   const HomePage()
    ),

    GoRoute(

        path: AppRouterPath.viewIpo,
          builder: (BuildContext context, GoRouterState state) {
          final ipoPasser= state.extra as IpoPasser?;
          return IpoDetailPage(ipoPasser: ipoPasser,);
          }

    ),

    GoRoute(

        path: AppRouterPath.viewSme,
        builder: (BuildContext context, GoRouterState state) {
          final ipoPasser= state.extra as IpoPasser?;
          return SmeDetail(ipoPasser: ipoPasser,);
        }

    ),

    GoRoute(
        path: AppRouterPath.dividend,
        builder: (BuildContext context, GoRouterState state) {
          return DividendPage();
        }
    ),
    GoRoute(
        path: AppRouterPath.bonus,
        builder: (BuildContext context, GoRouterState state) {
          return BonusPage();
        }
    ),
    GoRoute(
        path: AppRouterPath.split,
        builder: (BuildContext context, GoRouterState state) {
          return SplitPage();
        }
    ),
    GoRoute(
        path: AppRouterPath.right,
        builder: (BuildContext context, GoRouterState state) {
          return RightsPage();
        }
    ),

    GoRoute(
        path: AppRouterPath.setting,
        builder: (BuildContext context, GoRouterState state) {
          return SettingPage();
        }
    ),

    GoRoute(
        path: AppRouterPath.ipoInvestorCat,
        builder: (BuildContext context, GoRouterState state) {
          return IpoInvestorCategoriesPage();
        }
    ),


    GoRoute(
        path: AppRouterPath.dividendInfo,
        builder: (BuildContext context, GoRouterState state) {
          return DividendInfoPage();
        }
    ),
    GoRoute(
        path: AppRouterPath.bonusInfo,
        builder: (BuildContext context, GoRouterState state) {
          return BonusInfoPage();
        }
    ),
    GoRoute(
        path: AppRouterPath.rightInfo,
        builder: (BuildContext context, GoRouterState state) {
          return RightsInfo();
        }
    ),
    GoRoute(
        path: AppRouterPath.splitInfo,
        builder: (BuildContext context, GoRouterState state) {
          return SplitsInfo();
        }
    ),

    GoRoute(
        path: AppRouterPath.allotment,
        builder: (BuildContext context, GoRouterState state) {
          return AllotmentPage();
        }
    ),

  ];
}