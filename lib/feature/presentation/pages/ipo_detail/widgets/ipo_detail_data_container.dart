import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ipo_tracker/feature/presentation/state_management/ipo_detail_provider.dart';
import 'package:ipo_tracker/util/constants/asset_constant.dart';
import 'package:ipo_tracker/util/constants/color_constant.dart';
import 'package:ipo_tracker/util/constants/string_constant.dart';

import '../../../../../util/utility.dart';

class IpoDetailDataContainer extends StatelessWidget {
  const IpoDetailDataContainer({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer<IpoDetailProvider>(
      builder: (context, ipoDetailProvider,child) {
        return Container(
          color: ColorConstant.notificationGreyColor,
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Utility.borderRadius10),
                  ),
                  child:Container(
                    padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 10.w),
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
                       SizedBox(height: 5.h,),
                       Text(
                         ipoDetailProvider.ipoDetailModalClass?.data?.name ?? '',
                         style: TextStyle(
                             color: ColorConstant.primaryColor,
                             fontWeight: FontWeight.w600,
                             fontSize: 22.sp
                         ),
                         textAlign: TextAlign.center,
                       ),
                       SizedBox(height: 10.h,),

                       Padding(
                         padding:  EdgeInsets.symmetric(vertical: 5.h),
                         child: Text(
                           ipoDetailProvider.ipoDetailModalClass?.data?.offerDate ?? '',
                           style: TextStyle(
                               fontSize: 15,
                               fontWeight: FontWeight.w500,
                               color: ColorConstant.black
                           ),
                           textAlign: TextAlign.center,
                         ),
                       ),

                       Padding(
                         padding:  EdgeInsets.symmetric(vertical: 10.h),
                         child: Row(
                           children: [
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
                                             fontSize: 12.sp
                                         ),
                                         textAlign: TextAlign.center,
                                       ),
                                     ],
                                   ),
                                   SizedBox(
                                     height: 2.h,
                                   ),
                                   Text(
                                     ipoDetailProvider.ipoDetailModalClass?.data?.lotSize.toString() ?? '',
                                     style: TextStyle(color: ColorConstant.black, fontSize: 14.sp, fontWeight: FontWeight.w400),
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
                                         StringConstants.offerPrice,
                                         style: TextStyle(
                                             color: ColorConstant.greyCircleColor,
                                             fontSize: 12.sp
                                         ),
                                         textAlign: TextAlign.center,
                                       ),
                                     ],
                                   ),
                                   SizedBox(
                                     height: 2.h,
                                   ),
                                   Text(
                                     '₹ ${ipoDetailProvider.ipoDetailModalClass?.data?.offerPrice ?? ''}',
                                     style: TextStyle(color: ColorConstant.black, fontSize: 14.sp, fontWeight: FontWeight.w400),
                                     textAlign: TextAlign.center,
                                   ),
                                 ],
                               ),
                             ),



                           ],
                         ),
                       ),
                     ],
                    ),
                  ),
                ),

               // if(!(ipoDetailProvider.ipoDetailModalClass?.data?.isListed ?? true))
                if(!(ipoDetailProvider.ipoDetailModalClass?.data?.isListed??true)) Card(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Utility.borderRadius10),
                  ),
                  child:Container(
                    padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 5.w),
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
                         padding:  EdgeInsets.symmetric(vertical: 2.h),
                         child: Text(
                           StringConstants.expectedListingEarning,
                           style: TextStyle(
                             color: ColorConstant.primaryColor,
                             fontSize: 15.sp,
                             fontWeight: FontWeight.w500
                           ),
                           textAlign: TextAlign.center,
                         ),
                       ),
                       SizedBox(height: 6.h,),
                       Container(
                         padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                         decoration: BoxDecoration(
                           color: ColorConstant.primaryColorBg, // Background color of the container
                           borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               child: Text(
                                 StringConstants.expectedGmp,
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                             SizedBox(width: 10.w,),
                             Expanded(
                               child: Text(
                                 '₹ ${ipoDetailProvider.ipoDetailModalClass?.data?.expectedPrem}',
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 16.sp,
                                     fontWeight: FontWeight.w500
                                 ),
            
                               ),
                             )
                           ],
                         ),
                       ),
                       Container(
                         padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 12.h),
                         decoration: BoxDecoration(
                           color: ColorConstant.white, // Background color of the container
                           borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                         ),
                         child:  Row(
                           children: [
                             Expanded(
                               child: Text(
                                 StringConstants.estProfitRetail,
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
                               ),
                             ),
                             SizedBox(width: 10.w,),
                             Expanded(
                               child: Text(
                                 '₹ ${ipoDetailProvider.ipoDetailModalClass?.data?.estRetailProfit}',
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 14.sp,
                                     fontWeight: FontWeight.w500
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                       Container(
                         padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                         decoration: BoxDecoration(
                           color: ColorConstant.primaryColorBg, // Background color of the container
                           borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               child: Text(
                                 StringConstants.estProfitHni,
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
                               ),
                             ),
                             SizedBox(width: 10.w,),
                             Expanded(
                               child: Text(
                                 '₹ ${ipoDetailProvider.ipoDetailModalClass?.data?.estHniProfit}',
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 14.sp,
                                     fontWeight: FontWeight.w500
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),


                     ],
                    ),
                  ),
                ),

                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Utility.borderRadius10),
                  ),
                  child:Container(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
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
                         padding:  EdgeInsets.symmetric(vertical: 4.h),
                         child: Text(
                           StringConstants.ipoDetails,
                           style: TextStyle(
                             color: ColorConstant.primaryColor,
                             fontSize: 15.sp,
                             fontWeight: FontWeight.w500
                           ),
                           textAlign: TextAlign.center,
                         ),
                       ),
                       SizedBox(height: 6.h,),
                       Utility.dividerContainer,

                       Container(
                         margin: EdgeInsets.symmetric(horizontal: 5.w),
                         padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                         decoration: BoxDecoration(
                           color: ColorConstant.white, // Background color of the container
                           borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               flex: 2,
                               child: Text(
                                 StringConstants.openDate,
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                             SizedBox(width: 10.w,),
                             Expanded(
                               flex: 3,
                               child: Text(
                                 ipoDetailProvider.ipoDetailModalClass?.data?.openDate ?? '',
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
            
                               ),
                             )
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.symmetric(horizontal: 5.w),
                         padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                         decoration: BoxDecoration(
                           color: ColorConstant.primaryColorBg, // Background color of the container
                           borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               flex: 2,
                               child: Text(
                                 StringConstants.closeDate,
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                             SizedBox(width: 10.w,),
                             Expanded(
                               flex: 3,
                               child: Text(
                                 ipoDetailProvider.ipoDetailModalClass?.data?.closeDate ?? '',
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
            
                               ),
                             )
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.symmetric(horizontal: 5.w),
                         padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                         decoration: BoxDecoration(
                           color: ColorConstant.white, // Background color of the container
                           borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               flex: 2,
                               child: Text(
                                 StringConstants.allotmentDate,
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                             SizedBox(width: 10.w,),
                             Expanded(
                               flex: 3,
                               child: Text(
                                 ipoDetailProvider.ipoDetailModalClass?.data?.allotmentDate ?? '',
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),

                               ),
                             )
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.symmetric(horizontal: 5.w),
                         padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                         decoration: BoxDecoration(
                           color: ColorConstant.primaryColorBg, // Background color of the container
                           borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               flex: 2,
                               child: Text(
                                 StringConstants.refundDate,
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                             SizedBox(width: 10.w,),
                             Expanded(
                               flex: 3,
                               child: Text(
                                 ipoDetailProvider.ipoDetailModalClass?.data?.refundDate ?? '',
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),

                               ),
                             )
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.symmetric(horizontal: 5.w),
                         padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                         decoration: BoxDecoration(
                           color: ColorConstant.white, // Background color of the container
                           borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               flex: 2,
                               child: Text(
                                 StringConstants.listingDate,
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                             SizedBox(width: 10.w,),
                             Expanded(
                               flex: 3,
                               child: Text(
                                 ipoDetailProvider.ipoDetailModalClass?.data?.listingDate ?? '',
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
            
                               ),
                             )
                           ],
                         ),
                       ),
                       if(ipoDetailProvider.ipoDetailModalClass?.data?.isListed ?? false)Container(
                         margin: EdgeInsets.symmetric(horizontal: 5.w),
                         padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                         decoration: BoxDecoration(
                           color: ColorConstant.primaryColorBg, // Background color of the container
                           borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               flex: 2,
                               child: Text(
                                 StringConstants.listedColon,
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                             SizedBox(width: 10.w,),
                             Expanded(
                               flex: 3,
                               child: Text(
                                   StringConstants.yes,
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),

                               ),
                             )
                           ],
                         ),
                       ),
                       if(ipoDetailProvider.ipoDetailModalClass?.data?.isListed ?? false)Container(
                         margin: EdgeInsets.symmetric(horizontal: 5.w),
                         padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                         decoration: BoxDecoration(
                           color: ColorConstant.white, // Background color of the container
                           borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               flex: 2,
                               child: Text(
                                 StringConstants.listPrice,
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                             SizedBox(width: 10.w,),
                             Expanded(
                               flex: 3,
                               child: Text(
                                   '₹ ${ipoDetailProvider.ipoDetailModalClass?.data?.listingPrice}/-',
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),

                               ),
                             )
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.symmetric(horizontal: 5.w),
                         padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                         decoration: BoxDecoration(
                           color: ColorConstant.primaryColorBg, // Background color of the container
                           borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               flex: 2,
                               child: Text(
                                 StringConstants.faceValue,
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                             SizedBox(width: 10.w,),
                             Expanded(
                               flex: 3,
                               child: Text(
                                 ipoDetailProvider.ipoDetailModalClass?.data?.faceValue!=null ? '₹ ${ipoDetailProvider.ipoDetailModalClass?.data?.faceValue} Per Equity Share' : '',
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
            
                               ),
                             )
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.symmetric(horizontal: 5.w),
                         padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                         decoration: BoxDecoration(
                           color: ColorConstant.white, // Background color of the container
                           borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               flex: 2,
                               child: Text(
                                 StringConstants.issuePrice,
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                             SizedBox(width: 10.w,),
                             Expanded(
                               flex: 3,
                               child: Text(
                                 ipoDetailProvider.ipoDetailModalClass?.data?.offerPrice!=null ? '₹ ${ipoDetailProvider.ipoDetailModalClass?.data?.offerPrice} Per Share' : '',
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w500
                                 ),
            
                               ),
                             )
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.symmetric(horizontal: 5.w),
                         padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                         decoration: BoxDecoration(
                           color: ColorConstant.primaryColorBg, // Background color of the container
                           borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               flex: 2,
                               child: Text(
                                 StringConstants.issueSize,
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                             SizedBox(width: 10.w,),
                             Expanded(
                               flex: 3,
                               child: Text(
                                 ipoDetailProvider.ipoDetailModalClass?.data?.issueSize!=null ? '₹ ${ipoDetailProvider.ipoDetailModalClass?.data?.issueSize}' : '',
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
            
                               ),
                             )
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.symmetric(horizontal: 5.w),
                         padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                         decoration: BoxDecoration(
                           color: ColorConstant.white, // Background color of the container
                           borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               flex: 2,
                               child: Text(
                                 StringConstants.marketLot,
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                             SizedBox(width: 10.w,),
                             Expanded(
                               flex: 3,
                               child: Column(
                                 children: [
                                   Row(
                                     children: [
                                       Expanded(
                                         flex:2,
                                         child: Text(
                                           StringConstants.retail,
                                           style: TextStyle(
                                               color: ColorConstant.black,
                                               fontSize: 13.sp,
                                               fontWeight: FontWeight.w400
                                           ),
            
                                         ),
                                       ),
                                       Expanded(
                                         flex: 3,
                                         child: Text(
                                           '${ipoDetailProvider.ipoDetailModalClass?.data?.retailLotShares} Shares\n(₹ ${ipoDetailProvider.ipoDetailModalClass?.data?.retailLotAmount}/-)',
                                           style: TextStyle(
                                               color: ColorConstant.black,
                                               fontSize: 13.sp,
                                               fontWeight: FontWeight.w500
                                           ),
            
                                         ),
                                       ),
            
                                     ],
                                   ),
                                   SizedBox(height: 5.h,),
                                   Row(
                                     children: [
                                       Expanded(
                                         flex:2,
                                         child: Text(
                                           StringConstants.shni,
                                           style: TextStyle(
                                               color: ColorConstant.black,
                                               fontSize: 13.sp,
                                               fontWeight: FontWeight.w400
                                           ),
            
                                         ),
                                       ),
                                       Expanded(
                                         flex: 3,
                                         child: Text(
                                           '${ipoDetailProvider.ipoDetailModalClass?.data?.shniLotShares} Shares\n(₹ ${ipoDetailProvider.ipoDetailModalClass?.data?.shniLotAmount}/-)',
                                           style: TextStyle(
                                               color: ColorConstant.black,
                                               fontSize: 13.sp,
                                               fontWeight: FontWeight.w400,
                                           ),
            
                                         ),
                                       ),
            
                                     ],
                                   ),
                                   SizedBox(height: 5.h,),
                                   Row(
                                     children: [
                                       Expanded(
                                         flex:2,
                                         child: Text(
                                           StringConstants.bhni,
                                           style: TextStyle(
                                               color: ColorConstant.black,
                                               fontSize: 13.sp,
                                               fontWeight: FontWeight.w400
                                           ),
            
                                         ),
                                       ),
                                       Expanded(
                                         flex:3,
                                         child: Text(
                                           '${ipoDetailProvider.ipoDetailModalClass?.data?.bhniLotShares} Shares\n(₹ ${ipoDetailProvider.ipoDetailModalClass?.data?.bhniLotAmount}/-)',
                                           style: TextStyle(
                                               color: ColorConstant.black,
                                               fontSize: 13.sp,
                                               fontWeight: FontWeight.w400
                                           ),
            
                                         ),
                                       ),
            
                                     ],
                                   ),
                                 ],
                               )
                             )
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.symmetric(horizontal: 5.w),
                         padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                         decoration: BoxDecoration(
                           color: ColorConstant.primaryColorBg, // Background color of the container
                           borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               flex: 2,
                               child: Text(
                                 StringConstants.listingAt,
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                             SizedBox(width: 10.w,),
                             Expanded(
                               flex: 3,
                               child: Text(
                                 ipoDetailProvider.ipoDetailModalClass?.data?.listingAt ?? '',
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),

                               ),
                             )
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.symmetric(horizontal: 5.w),
                         padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                         decoration: BoxDecoration(
                           color: ColorConstant.white, // Background color of the container
                           borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               flex: 2,
                               child: Text(
                                 StringConstants.retailPortion,
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                             SizedBox(width: 10.w,),
                             Expanded(
                               flex: 3,
                               child: Text(
                                 ipoDetailProvider.ipoDetailModalClass?.data?.retailPartition!=null ? '${ipoDetailProvider.ipoDetailModalClass?.data?.retailPartition} %': '',
                                 style: TextStyle(
                                     color: ColorConstant.black,
                                     fontSize: 13.sp,
                                     fontWeight: FontWeight.w400
                                 ),

                               ),
                             )
                           ],
                         ),
                       ),
                     ],
                    ),
                  ),
                )
            
              ],
            ),
          ),
        );
      }
    );
  }
}
