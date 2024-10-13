import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ipo_tracker/feature/presentation/pages/ipo_detail/widgets/title_app_bar.dart';
import 'package:ipo_tracker/feature/presentation/pages/market/widgets/title_container.dart';
import 'package:ipo_tracker/util/constants/string_constant.dart';
import 'package:share_plus/share_plus.dart';


import '../../../../google_ads/native_ad_container.dart';
import '../../../../util/constants/asset_constant.dart';
import '../../../../util/constants/color_constant.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TitleAppBar(title: StringConstants.settings),
            Expanded(
              child: Container(
                color: ColorConstant.notificationGreyColor,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                    child: Column(
                      children: [
                        TitleContainer(
                          bgColor: ColorConstant.lightOrangeColor ,
                          borderColor: ColorConstant.orangeColor ,
                          title: StringConstants.rateUs,
                          onTap: () async {

                            if (!await launchUrl(
                              Uri.parse(StringConstants.playStoreUrl),
                              mode: LaunchMode.externalApplication,)) {
                            throw Exception('Could not launch $StringConstants.playStoreUrl');
                            }
                          },
                          icon: Icons.star,
                        ),
                        SizedBox(height: 15.h,),
                        TitleContainer(
                          bgColor: ColorConstant.lightPistaColor ,
                          borderColor: ColorConstant.pistaColor ,
                          title: StringConstants.privacyPolicy,
                          onTap: () async {
                            if (await canLaunchUrl(Uri.parse(StringConstants.privacyPolicyUrl))) {
                            await launchUrl(Uri.parse(StringConstants.privacyPolicyUrl));
                            } else {
                            throw 'Could not launch email client';
                            }

                          },
                          icon: Icons.security,
                        ),
                        SizedBox(height: 15.h,),
                        TitleContainer(
                          bgColor: ColorConstant.lightYellowishColor ,
                          borderColor: ColorConstant.yellowishColor ,
                          title: StringConstants.share,
                          onTap: () async {
                            await Share.share(
                             'Check out this amazing IPO app: ${StringConstants.playStoreUrl}',
                            );
                          },
                          icon: Icons.share,
                        ),
                        SizedBox(height: 15.h,),
                        TitleContainer(
                          bgColor: ColorConstant.lightRedColor ,
                          borderColor: ColorConstant.darkRedColor ,
                          title: StringConstants.feedBack,
                          onTap: () async {
                            final Uri emailUri = Uri(
                              scheme: 'mailto',
                              path: 'pattelpattel23@gmail.com',  // Replace with your email
                            );

                            if (await canLaunchUrl(emailUri)) {
                              await launchUrl(emailUri);
                            } else {
                              throw 'Could not launch email client';
                            }
                          },
                          icon: Icons.feedback,
                        ),





                      ],
                    ),
                  ),
                ),
              ),
            ),

            NativeAdContainer(nativeAdTemplateStyle: 1,),

          ],
        ),
      ),
    );
  }
}
