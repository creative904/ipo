import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipo_tracker/feature/presentation/pages/current_ipo/widgets/view_button.dart';
import 'package:ipo_tracker/feature/presentation/pages/ipo_detail/ipo_detail_page.dart';
import 'package:ipo_tracker/router/route_constant.dart';
import 'package:ipo_tracker/router/routes.dart';
import 'package:ipo_tracker/util/constants/string_constant.dart';

import '../../../../../util/constants/asset_constant.dart';
import '../../../../../util/constants/color_constant.dart';
import '../../../../../util/utility.dart';
import '../../../../data/modals/ipo_modal.dart';

class CurrentIpoItem2 extends StatefulWidget {
  const CurrentIpoItem2({super.key, required this.ipo});

  final Ipos ipo;

  @override
  State<CurrentIpoItem2> createState() => _CurrentIpoItem2State();
}

class _CurrentIpoItem2State extends State<CurrentIpoItem2> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AppRouter.goRouter.push(AppRouterPath.viewIpo,
            extra: IpoPasser(
              id: widget.ipo.sId,
              name: widget.ipo.name,
              isFromListedIpo: false
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
                // color: ColorConstant.greyCircleColor,
                color: ColorConstant.black,
                width: 1.w
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                        widget.ipo.name ?? '',
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
                  widget.ipo.offerDate ?? '',
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
                  '${widget.ipo.premiumOrDiscount} : ₹ ${widget.ipo.expectedPrem}',
                  style: GoogleFonts.poppins(
                    textStyle:TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: widget.ipo.premiumOrDiscount==StringConstants.premium ? ColorConstant.greenColor :ColorConstant.darkRedColor
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
                            widget.ipo.offerPrice ?? '',
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
                            '${widget.ipo.lotSize}',
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
                          StringConstants.minAmount,
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
                          StringConstants.estProfitRetail,
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
                                  color: widget.ipo.premiumOrDiscount==StringConstants.premium ? ColorConstant.greenColor :ColorConstant.darkRedColor,
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
                          StringConstants.estProfitHni,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: ColorConstant.greyCircleColor,
                                fontSize: 14.sp
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            '249340.00',
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
                    )
                  ],
                ),
              ),

      
              if(widget.ipo.news?.isNotEmpty ?? false)
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    widget.ipo.news ?? '',
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
