import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipo_tracker/feature/presentation/pages/ipo_detail/ipo_detail_page.dart';
import 'package:ipo_tracker/router/route_constant.dart';
import 'package:ipo_tracker/router/routes.dart';
import 'package:ipo_tracker/util/constants/string_constant.dart';

import '../../../../../util/constants/asset_constant.dart';
import '../../../../../util/constants/color_constant.dart';
import '../../../../../util/utility.dart';
import '../../../../data/modals/ipo_modal.dart';

class CurrentIpoItem extends StatefulWidget {
  const CurrentIpoItem({super.key, required this.ipo});

  final Ipos ipo;

  @override
  State<CurrentIpoItem> createState() => _CurrentIpoItemState();
}

class _CurrentIpoItemState extends State<CurrentIpoItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AppRouter.goRouter.push(AppRouterPath.viewIpo,
            extra: IpoPasser(
              id: widget.ipo.sId,
              name: widget.ipo.name
            ));
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5.h),
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
      
               if(widget.ipo.isLive ?? false)
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
                        widget.ipo.name ?? '',
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
                  widget.ipo.offerDate ?? '',
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
                            widget.ipo.offerPrice ?? '',
                            style: TextStyle(
                                color: ColorConstant.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
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
                            widget.ipo.lotSize.toString(),
                            style: TextStyle(
                                color: ColorConstant.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
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
                            widget.ipo.subscriptions ?? '',
                            style: TextStyle(
                                color: ColorConstant.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

      
              if(widget.ipo.news?.isNotEmpty ?? false)
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w,),
                  child: Text(
                    widget.ipo.news ?? '',
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
