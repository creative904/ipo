import 'package:flutter/cupertino.dart';

import '../constants/asset_constant.dart';
import '../constants/string_constant.dart';
import '../utility.dart';

class NoItemWidget extends StatelessWidget {
  const NoItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(AssetConstant.noData),
            height: 100,
            width: 100,
            fit: BoxFit.fill,
          ),
          Text(
            StringConstants.noNewUpdateFound,
            style: Utility.textStyle15pxW500GreyTextColor(),
          )
        ],
      ),
    );
  }
}
