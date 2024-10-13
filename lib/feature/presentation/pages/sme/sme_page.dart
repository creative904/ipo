import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ipo_tracker/feature/presentation/state_management/listed_sme_provider.dart';

import '../../../../util/constants/color_constant.dart';
import '../../../../util/utility.dart';

import '../../state_management/current_sme_provider.dart';

import '../../state_management/sme_provider.dart';
import '../current_Sme/current_Sme_page.dart';
import '../ipo/widgets/tab_item.dart';
import '../listed_sme/listed_sme_page.dart';

class SmePage extends StatefulWidget {
  const SmePage({super.key});

  @override
  State<SmePage> createState() => _SmePageState();
}

class _SmePageState extends State<SmePage> with SingleTickerProviderStateMixin {

  List<Widget> tabItemList=[
    const CurrentSmePage(),
    const ListedSmePage(),
  ];

  TabController? tabController;
  SmeProvider? smeProvider;
  CurrentSmeProvider? currentSmeProvider;
  ListedSmeProvider? listedSmeProvider;

  @override
  void initState() {
    smeProvider=Provider.of<SmeProvider>(context,listen: false);
    currentSmeProvider=Provider.of<CurrentSmeProvider>(context,listen: false);
    listedSmeProvider=Provider.of<ListedSmeProvider>(context,listen: false);

    smeProvider?.init();
    currentSmeProvider?.callApiCurrentSme();
    listedSmeProvider?.callApiListedSme();


    tabController= TabController(length: smeProvider?.tabList.length ?? 0, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<SmeProvider>(
            builder: (context, smeProvider, child) {
              return Container(
                color: ColorConstant.primaryColor,
                child: TabBar(
                  controller: tabController,
                  onTap: (index){
                    smeProvider.changeTabIndex(index);
                  },

                  indicatorColor: ColorConstant.yellowishColor,
                  indicatorWeight: 5,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 12.0.w),
                  tabs: [
                    TabItem(icon: smeProvider.tabList[0].icon,title: smeProvider.tabList[0].title, isSelected: smeProvider.tabIndex==0,),
                    TabItem(icon: smeProvider.tabList[1].icon,title: smeProvider.tabList[1].title, isSelected: smeProvider.tabIndex==1,),
                  ],
                ),
              );
            }
        ),
        Utility.dividerContainer,
        Expanded(
          child: Selector<SmeProvider, int>(
              selector: (_, SmeProvider) => SmeProvider.tabIndex,
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
