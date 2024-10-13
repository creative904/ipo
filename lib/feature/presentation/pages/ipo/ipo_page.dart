import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:ipo_tracker/feature/presentation/pages/ipo/widgets/tab_item.dart';
import 'package:ipo_tracker/feature/presentation/state_management/current_ipo_provider.dart';
import 'package:ipo_tracker/feature/presentation/state_management/ipo_provider.dart';
import 'package:ipo_tracker/feature/presentation/state_management/listed_ipo_provider.dart';

import '../../../../firebase/firebase_remote_config_service.dart';
import '../../../../google_ads/ad_helper.dart';
import '../../../../util/constants/color_constant.dart';
import '../../../../util/utility.dart';
import '../current_ipo/current_ipo_page.dart';
import '../listed_ipo/listed_ipo_page.dart';

class IpoPage extends StatefulWidget {
  const IpoPage({super.key});

  @override
  State<IpoPage> createState() => _IpoPageState();
}

class _IpoPageState extends State<IpoPage> with SingleTickerProviderStateMixin {

  List<Widget> tabItemList=[
    const CurrentIpoPage(),
    const ListedIpoPage(),
  ];

  TabController? tabController;
  IpoProvider? ipoProvider;
  CurrentIpoProvider? currentIpoProvider;
  ListedIpoProvider? listedIpoProvider;

  final remoteConfig = FirebaseRemoteConfigService();

  @override
  void initState() {



    ipoProvider=Provider.of<IpoProvider>(context,listen: false);
    currentIpoProvider=Provider.of<CurrentIpoProvider>(context,listen: false);
    listedIpoProvider=Provider.of<ListedIpoProvider>(context,listen: false);

    ipoProvider?.init();
    currentIpoProvider?.callApiCurrentIpo();
    listedIpoProvider?.callApiListedIpo();


    tabController= TabController(length: ipoProvider?.tabList.length ?? 0, vsync: this);

    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<IpoProvider>(
            builder: (context, ipoProvider, child) {
              return Container(
                color: ColorConstant.primaryColor,
                child: TabBar(

                  controller: tabController,
                  onTap: (index){
                    ipoProvider.changeTabIndex(index);
                  },

                  // indicator: BoxDecoration(
                  //   color: ColorConstant.primaryColor,
                  //   borderRadius: BorderRadius.circular(Utility.borderRadius5),
                  // ),
                  indicatorColor: ColorConstant.yellowishColor,
                  indicatorWeight: 5,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 12.0.w),
                  tabs: [
                    TabItem(icon: ipoProvider.tabList[0].icon,title: ipoProvider.tabList[0].title, isSelected: ipoProvider.tabIndex==0,),
                    TabItem(icon: ipoProvider.tabList[1].icon,title: ipoProvider.tabList[1].title, isSelected: ipoProvider.tabIndex==1,),
                    ],
                ),
              );
            }
        ),
        Utility.dividerContainer,



        Expanded(
          child: Selector<IpoProvider, int>(
              selector: (_, ipoProvider) => ipoProvider.tabIndex,
              builder: (context, tabIndex, child)=> IndexedStack(
                index: tabIndex,
                children: tabItemList,
              )
          ),
        )
      ],
    );
  }
}
