import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipo_tracker/feature/data/modals/sme_modal.dart';
import 'package:ipo_tracker/router/route_constant.dart';
import 'package:ipo_tracker/router/routes.dart';
import 'package:ipo_tracker/util/constants/string_constant.dart';

import '../../../../../util/constants/asset_constant.dart';
import '../../../../../util/constants/color_constant.dart';
import '../../../../../util/utility.dart';
import '../../ipo_detail/ipo_detail_page.dart';


class CurrentSmeItem extends StatefulWidget {
  const CurrentSmeItem({super.key, required this.sme});

  final SMEs sme;

  @override
  State<CurrentSmeItem> createState() => _CurrentSmeItemState();
}

class _CurrentSmeItemState extends State<CurrentSmeItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AppRouter.goRouter.push(AppRouterPath.viewSme,
            extra: IpoPasser(
                id: widget.sme.sId,
                name: widget.sme.name
            ));
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Utility.borderRadius10),
        ),
        child:Container(
          decoration: BoxDecoration(
            color: ColorConstant.white,
            borderRadius: BorderRadius.circular(Utility.borderRadius5),
            border: Border.all(
                color: ColorConstant.greyCircleColor,
                width: 1.w
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              if(widget.sme.isLive ?? false)
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: ColorConstant.darkRedColor, // Background color of the container
                        borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                      ),
                      child: Text(
                        StringConstants.live,
                        style: TextStyle(
                            color: ColorConstant.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500
                        ),
                      )
                  ),
                ),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.sme.name ?? '',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ColorConstant.primaryColor
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
                child: Text(
                  widget.sme.offerDate ?? '',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.black
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          Text(
                            '₹ ${StringConstants.offerPrice}',
                            style: TextStyle(
                                color: ColorConstant.greyCircleColor,
                                fontSize: 13.sp
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            widget.sme.offerPrice ?? '',
                            style: TextStyle(color: ColorConstant.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Utility.verticalDividerContainer,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  AssetConstant.home,
                                  width: 16.0,
                                  height: 16.0,
                                  colorFilter:ColorFilter.mode(ColorConstant.greyCircleColor.withOpacity(1), BlendMode.srcIn)
                              ),

                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                StringConstants.lotSize,
                                style: TextStyle(
                                    color: ColorConstant.greyCircleColor,
                                    fontSize: 13.sp
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            widget.sme.lotSize.toString(),
                            style: TextStyle(color: ColorConstant.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Utility.verticalDividerContainer,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  AssetConstant.home,
                                  width: 16.0,
                                  height: 16.0,
                                  colorFilter:ColorFilter.mode(ColorConstant.greyCircleColor.withOpacity(1), BlendMode.srcIn)
                              ),

                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                StringConstants.subs,
                                style: TextStyle(
                                    color: ColorConstant.greyCircleColor,
                                    fontSize: 13.sp
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            widget.sme.subscriptions ?? '',
                            style: TextStyle(color: ColorConstant.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),


              if(widget.sme.news?.isNotEmpty ?? false)
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w,),
                  child: Text(
                    widget.sme.news ?? '',
                    style: TextStyle(
                        color: ColorConstant.darkRedColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              SizedBox(
                height: 12.h,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
