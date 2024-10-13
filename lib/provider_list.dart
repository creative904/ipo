

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


import 'package:ipo_tracker/di/injection_container.dart';
import 'package:ipo_tracker/feature/presentation/state_management/current_ipo_provider.dart';
import 'package:ipo_tracker/feature/presentation/state_management/home_page_provider.dart';
import 'package:ipo_tracker/feature/presentation/state_management/ipo_provider.dart';
import 'package:ipo_tracker/feature/presentation/state_management/listed_ipo_provider.dart';
import 'package:ipo_tracker/feature/presentation/state_management/listed_sme_provider.dart';

import 'feature/presentation/state_management/current_sme_provider.dart';
import 'feature/presentation/state_management/ipo_detail_provider.dart';
import 'feature/presentation/state_management/market_provider.dart';
import 'feature/presentation/state_management/sme_detail_provider.dart';
import 'feature/presentation/state_management/sme_provider.dart';




class ListProvider extends MultiProvider {
  ListProvider({super.key, required List<SingleChildWidget> providers})
      : super(providers: providers);

  static List<SingleChildWidget> providerList = [

    ChangeNotifierProvider<IpoProvider>(create: (_) => getIt<IpoProvider>()),
    ChangeNotifierProvider<HomePageProvider>(create: (_) => getIt<HomePageProvider>()),
    ChangeNotifierProvider<CurrentIpoProvider>(create: (_) => getIt<CurrentIpoProvider>()),
    ChangeNotifierProvider<ListedIpoProvider>(create: (_) => getIt<ListedIpoProvider>()),
    ChangeNotifierProvider<IpoDetailProvider>(create: (_) => getIt<IpoDetailProvider>()),
    ChangeNotifierProvider<SmeProvider>(create: (_) => getIt<SmeProvider>()),
    ChangeNotifierProvider<CurrentSmeProvider>(create: (_) => getIt<CurrentSmeProvider>()),
    ChangeNotifierProvider<ListedSmeProvider>(create: (_) => getIt<ListedSmeProvider>()),
    ChangeNotifierProvider<SmeDetailProvider>(create: (_) => getIt<SmeDetailProvider>()),
    ChangeNotifierProvider<MarketProvider>(create: (_) => getIt<MarketProvider>()),

  ];
}
