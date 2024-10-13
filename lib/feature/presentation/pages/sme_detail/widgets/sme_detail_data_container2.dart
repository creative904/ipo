import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ipo_tracker/feature/presentation/state_management/ipo_detail_provider.dart';
import 'package:ipo_tracker/feature/presentation/state_management/sme_detail_provider.dart';
import 'package:ipo_tracker/util/constants/asset_constant.dart';
import 'package:ipo_tracker/util/constants/color_constant.dart';
import 'package:ipo_tracker/util/constants/string_constant.dart';

import '../../../../../util/utility.dart';
import '../../ipo_detail/widgets/table_item.dart';



class SmeDetailDataContainer2 extends StatefulWidget {
  const SmeDetailDataContainer2({super.key});

  @override
  State<SmeDetailDataContainer2> createState() => _SmeDetailDataContainer2State();
}

class _SmeDetailDataContainer2State extends State<SmeDetailDataContainer2> {

  SmeDetailProvider? smeDetailProvider;
  @override
  void initState() {
    smeDetailProvider=Provider.of<SmeDetailProvider>(context,listen:false);
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints) {
        return SingleChildScrollView(
          child: Container(
            color: ColorConstant.notificationGreyColor,
            padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    StringConstants.subscriptionDetails,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: ColorConstant.primaryColor,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: constraints.maxWidth+50.w,
                    decoration: const BoxDecoration(
                      color: ColorConstant.white,

                    ),
                    child: Table(
                      border: TableBorder.all(),
                      columnWidths: {
                        0: FlexColumnWidth(2.5), // First column (wider)
                        1: FlexColumnWidth(2.5), // Second column (narrower)
                        2: FlexColumnWidth(3), // Third column (wider)
                      },// Optional: Adds border to the table
                      children: [
                        TableRow(
                          children: [
                            SubDetailTableItem( title: 'Category', ),
                            SubDetailTableItem( title: 'Times', ),
                            SubDetailTableItem( title: 'Bid Amount', )
                          ],
                        ),
                        TableRow(
                          children: [
                            SubDetailTableItem( title: 'QIB', ),
                            SubDetailTableItem( title: '8.16', ),
                            SubDetailTableItem( title: '215.71 CR', )
                          ],
                        ),
                        TableRow(
                          children: [
                            SubDetailTableItem( title: 'HNI', ),
                            SubDetailTableItem( title: '136.75', ),
                            SubDetailTableItem( title: '7,1891.90 CR', ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SubDetailTableItem( title: 'Retail', ),
                            SubDetailTableItem( title: '56.81', ),
                            SubDetailTableItem( title: '6,871.93 CR', ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SubDetailTableItem( title: 'Total', ),
                            SubDetailTableItem( title: '59', ),
                            SubDetailTableItem( title: '14,269.54 CR', ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    '${StringConstants.totalRetailApplication} : 3,789,373', // will get from ipo premium app
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: ColorConstant.primaryColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    '${StringConstants.chancesToGET} 1 ${StringConstants.outOf} 45 ${StringConstants.peopleRetailInv}',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: ColorConstant.primaryColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),


                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    StringConstants.subBidWise,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: ColorConstant.primaryColor,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: constraints.maxWidth+50.w,
                    decoration: BoxDecoration(
                      color: ColorConstant.white,

                    ),
                    child: Table(
                      border: TableBorder.all(),
                      columnWidths: {
                        0: FlexColumnWidth(3), // First column (wider)
                        1: FlexColumnWidth(3), // Second column (narrower)
                        2: FlexColumnWidth(3), // Third column (wider)
                        3: FlexColumnWidth(3), // Third column (wider)
                      },// Optional: Adds border to the table
                      children: [
                        TableRow(
                          children: [
                            SubDetailTableItem( title: 'Category', ),
                            SubDetailTableItem( title: 'Offered', ),
                            SubDetailTableItem( title: 'Applied', ),
                            SubDetailTableItem( title: 'Times', )
                          ],
                        ),
                        TableRow(
                          children: [
                            SubDetailTableItem( title: 'QIB', ),
                            SubDetailTableItem( title: '3,107,455', ),
                            SubDetailTableItem( title: '9,805,185', ),
                            SubDetailTableItem( title: '3.16', ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SubDetailTableItem( title: 'HNI', ),
                            SubDetailTableItem( title: '2,387,215', ),
                            SubDetailTableItem( title: '326,449,825', ),
                            SubDetailTableItem( title: '136.75', ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SubDetailTableItem( title: 'HNI(>10L)', ),
                            SubDetailTableItem( title: '1,591,477', ),
                            SubDetailTableItem( title: '177,837,985', ),
                            SubDetailTableItem( title: '111.74', ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SubDetailTableItem( title: 'HNI(<10L)', ),
                            SubDetailTableItem( title: '795,738', ),
                            SubDetailTableItem( title: '148,611,840', ),
                            SubDetailTableItem( title: '186.76', ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SubDetailTableItem( title: 'Retail', ),
                            SubDetailTableItem( title: '5,498,330', ),
                            SubDetailTableItem( title: '312,360,425', ),
                            SubDetailTableItem( title: '56.81', ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SubDetailTableItem( title: 'Total', ),
                            SubDetailTableItem( title: '10,993,000', ),
                            SubDetailTableItem( title: '648,615,435', ),
                            SubDetailTableItem( title: '59', ),
                          ],
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
                          color: ColorConstant.black,
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
                                fontSize: 18.sp,
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
                                  smeDetailProvider?.smeDetailModalClass?.data?.openDate ?? '',
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
                                  smeDetailProvider?.smeDetailModalClass?.data?.closeDate ?? '',
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
                                  smeDetailProvider?.smeDetailModalClass?.data?.allotmentDate ?? '',
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
                                  smeDetailProvider?.smeDetailModalClass?.data?.refundDate ?? '',
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
                                  smeDetailProvider?.smeDetailModalClass?.data?.listingDate ?? '',
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
                        // if(smeDetailProvider?.smeDetailModalClass?.data?.isListed ?? false)Container(
                        //   margin: EdgeInsets.symmetric(horizontal: 5.w),
                        //   padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                        //   decoration: BoxDecoration(
                        //     color: ColorConstant.primaryColorBg, // Background color of the container
                        //     borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                        //   ),
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //         flex: 2,
                        //         child: Text(
                        //           StringConstants.listedColon,
                        //           style: TextStyle(
                        //               color: ColorConstant.black,
                        //               fontSize: 13.sp,
                        //               fontWeight: FontWeight.w400
                        //           ),
                        //           textAlign: TextAlign.center,
                        //         ),
                        //       ),
                        //       SizedBox(width: 10.w,),
                        //       Expanded(
                        //         flex: 3,
                        //         child: Text(
                        //           StringConstants.yes,
                        //           style: TextStyle(
                        //               color: ColorConstant.black,
                        //               fontSize: 13.sp,
                        //               fontWeight: FontWeight.w400
                        //           ),
                        //
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // if(smeDetailProvider?.smeDetailModalClass?.data?.isListed ?? false) Container(
                        //   margin: EdgeInsets.symmetric(horizontal: 5.w),
                        //   padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                        //   decoration: BoxDecoration(
                        //     color: ColorConstant.white, // Background color of the container
                        //     borderRadius: BorderRadius.circular(Utility.borderRadius5), // Rounded corners
                        //   ),
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //         flex: 2,
                        //         child: Text(
                        //           StringConstants.listPrice,
                        //           style: TextStyle(
                        //               color: ColorConstant.black,
                        //               fontSize: 13.sp,
                        //               fontWeight: FontWeight.w400
                        //           ),
                        //           textAlign: TextAlign.center,
                        //         ),
                        //       ),
                        //       SizedBox(width: 10.w,),
                        //       Expanded(
                        //         flex: 3,
                        //         child: Text(
                        //           '₹ ${smeDetailProvider?.smeDetailModalClass?.data?.listingPrice}/-',
                        //           style: TextStyle(
                        //               color: ColorConstant.black,
                        //               fontSize: 13.sp,
                        //               fontWeight: FontWeight.w400
                        //           ),
                        //
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),

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
                                  smeDetailProvider?.smeDetailModalClass?.data?.faceValue!=null ? '₹ ${smeDetailProvider?.smeDetailModalClass?.data?.faceValue} Per Equity Share' : '',
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
                                  smeDetailProvider?.smeDetailModalClass?.data?.offerPrice!=null ? '₹ ${smeDetailProvider?.smeDetailModalClass?.data?.offerPrice} Per Equity Share' : '',
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
                                  smeDetailProvider?.smeDetailModalClass?.data?.issueSize!=null ? '₹ ${smeDetailProvider?.smeDetailModalClass?.data?.issueSize}' : '',
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
                                child: Text(
                                  '${smeDetailProvider?.smeDetailModalClass?.data?.retailLotShares} Shares (₹ ${smeDetailProvider?.smeDetailModalClass?.data?.retailLotAmount}/-)',
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
                                  smeDetailProvider?.smeDetailModalClass?.data?.listingAt ?? '',
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
                                  smeDetailProvider?.smeDetailModalClass?.data?.retailPartition!=null ? '${smeDetailProvider?.smeDetailModalClass?.data?.retailPartition} %': '',
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

