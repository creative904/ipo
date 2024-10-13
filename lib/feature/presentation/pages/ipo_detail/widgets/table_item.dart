import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../util/constants/color_constant.dart';

class SubDetailTableItem extends StatelessWidget {
  const SubDetailTableItem({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5.h,horizontal: 2.w),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: ColorConstant.primaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
