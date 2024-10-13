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
import '../../../data/modals/ipo_modal.dart';


class ListedIpoItem extends StatefulWidget {
  const ListedIpoItem({super.key, required this.ipo});

  final Ipos ipo;

  @override
  State<ListedIpoItem> createState() => _ListedIpoItemState();
}

class _ListedIpoItemState extends State<ListedIpoItem> {
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
                    'Listed On : ${widget.ipo.listingDate} at ₹${widget.ipo.listingPrice} ',
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

              SizedBox(
                height: 6.h,
              ),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 1.h),
                child: Text(
                  'Listing Price : ₹${widget.ipo.listingPrice} at a Premium of ${widget.ipo.listingPercent}%',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.greenColor
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 8.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  widget.ipo.nseCode!=null && widget.ipo.nseCode!.isNotEmpty ? 'NSE : ${widget.ipo.nseCode}': '',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: ColorConstant.primaryColor
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 3.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w,),
                child: Text(
                  widget.ipo.bseCode!=null && widget.ipo.bseCode!.isNotEmpty ? 'BSE : ${widget.ipo.bseCode}': '',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: ColorConstant.primaryColor
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 5.h,),



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
