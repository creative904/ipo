import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../util/constants/color_constant.dart';
import '../../../../../util/utility.dart';

class ViewButton extends StatelessWidget {
  const ViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: ColorConstant.primaryColorLight,
        borderRadius: BorderRadius.circular(Utility.borderRadius5),
        border: Border.all(
            color: ColorConstant.black,
            width: 1.w
        ),
      ),
      child: Text(
        "View",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: ColorConstant.primaryColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500),
          ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
