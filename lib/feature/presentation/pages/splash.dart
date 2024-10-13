import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ipo_tracker/router/route_constant.dart';
import 'package:ipo_tracker/router/routes.dart';
import 'package:ipo_tracker/util/constants/asset_constant.dart';

import 'package:ipo_tracker/secure_storage/app_shared_preferences.dart';
import 'package:ipo_tracker/secure_storage/shared_prefrence_keys.dart';

import 'ipo_detail/ipo_detail_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) async {
      AppRouter.goRouter.go(AppRouterPath.home);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Image(
            height: 200,
            width: 200,
            image: AssetImage(AssetConstant.appIcon),
          )
        )
    );
  }
}
