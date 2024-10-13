import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipo_tracker/feature/data/modals/sme_modal.dart';
import 'package:ipo_tracker/router/route_constant.dart';
import 'package:ipo_tracker/router/routes.dart';
import 'package:ipo_tracker/util/constants/string_constant.dart';

import '../../../../../util/constants/asset_constant.dart';
import '../../../../../util/constants/color_constant.dart';
import '../../../../../util/utility.dart';
import '../../current_ipo/widgets/view_button.dart';
import '../../ipo_detail/ipo_detail_page.dart';


class CurrentSmeItem2 extends StatefulWidget {
  const CurrentSmeItem2({super.key, required this.sme});

  final SMEs sme;

  @override
  State<CurrentSmeItem2> createState() => _CurrentSmeItem2State();
}

class _CurrentSmeItem2State extends State<CurrentSmeItem2> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AppRouter.goRouter.push(AppRouterPath.viewSme,
            extra: IpoPasser(
                id: widget.sme.sId,
                name: widget.sme.name,
              isFromListedIpo: false,
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
                color: ColorConstant.black,
                width: 1.w
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // if(widget.sme.isLive ?? false)
              if(true)
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
                        style: GoogleFonts.poppins(
                          textStyle:TextStyle(
                              color: ColorConstant.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      )
                  ),
                ),

              SizedBox(height: 5.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child: SizedBox(
                        height: 70.h, // Specify the height of the rectangle
                        child: Image.network(
                          'https://api.altiusinvestech.com/all/companyLogo/H3fKflJv2gOr1709816963p70jBdjD4mjL.jpg',
                          fit: BoxFit.contain, // Fit the image within the box
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(child: CircularProgressIndicator()); // Show a loading indicator while image is loading
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Center(child: Text('Error loading image')); // Show error message if image fails to load
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w,),
                    Expanded(
                      flex: 3,
                      child: Text(
                        widget.sme.name ?? '',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorConstant.primaryColor
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  widget.sme.offerDate ?? '',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorConstant.black
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 15.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  '${widget.sme.premiumOrDiscount} : ₹ ${widget.sme.expectedPrem}',
                  style: GoogleFonts.poppins(
                      textStyle:TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: widget.sme.premiumOrDiscount==StringConstants.premium ? ColorConstant.greenColor :ColorConstant.darkRedColor
                      )
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 5.h,),
              Utility.dividerContainer,

              SizedBox(
                height: 6.h,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          StringConstants.offerPrice,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: ColorConstant.greyCircleColor,
                                fontSize: 14.sp
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10.w,),
                        Expanded(
                          child: Text(
                            widget.sme.offerPrice ?? '',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: ColorConstant.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h,),
                    Row(
                      children: [
                        Text(
                          StringConstants.lotSize,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: ColorConstant.greyCircleColor,
                                fontSize: 14.sp
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10.w,),
                        Expanded(
                          child: Text(
                            '${widget.sme.lotSize}',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: ColorConstant.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h,),
                    Row(
                      children: [
                        Text(
                          StringConstants.minAmountNotRetail,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: ColorConstant.greyCircleColor,
                                fontSize: 14.sp
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10.w,),
                        Expanded(
                          child: Text(
                            '14,964',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: ColorConstant.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h,),
                    Row(
                      children: [
                        Text(
                          StringConstants.estProfit,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: ColorConstant.greyCircleColor,
                                fontSize: 14.sp
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10.w,),
                        Expanded(
                          child: Text(
                            '17,810.00',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: widget.sme.premiumOrDiscount==StringConstants.premium ? ColorConstant.greenColor :ColorConstant.darkRedColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),

                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),


              if(widget.sme.news?.isNotEmpty ?? false)
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    widget.sme.news ?? '',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: ColorConstant.darkRedColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              SizedBox(
                height: 6.h,
              ),
              ViewButton(),

              SizedBox(
                height: 10.h,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
