
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipo_tracker/google_ads/app_open_handler.dart';

import 'package:ipo_tracker/router/routes.dart';
import 'package:ipo_tracker/themes/app_theme.dart';
import 'package:ipo_tracker/util/constants/string_constant.dart';
import 'package:ipo_tracker/di/injection_container.dart';

import 'package:ipo_tracker/firebase/analytic_observer.dart';
import 'package:ipo_tracker/util/screen_size.dart';

// main entry point of app
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

  @override
  void initState() {
    AppOpenAdManager.loadAd();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }


  @override
  void dispose() {
    getIt<ObserverAnalytics>().observer.unsubscribe(this as RouteAware);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  bool isPaused=false;// necesarry dont remove it . used when u page changes and call inter after close inter app open will show that we dont want
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
   if(state==AppLifecycleState.paused){
     isPaused=true;
   }
   if(state==AppLifecycleState.resumed && isPaused){
     AppOpenAdManager.showAdIfAvailable();
     isPaused=false;
   }
    super.didChangeAppLifecycleState(state);

  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_ , child) {

        ScreenSize.size=MediaQuery.sizeOf(context);
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: StringConstants.appName,
          routeInformationProvider: AppRouter.goRouter.routeInformationProvider,
          routeInformationParser: AppRouter.goRouter.routeInformationParser,
          routerDelegate: AppRouter.goRouter.routerDelegate,

          theme: getIt<AppThemeNotifier>().themeData,

        );
      },

    );
  }

}

