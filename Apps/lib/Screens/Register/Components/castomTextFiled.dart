import 'package:authentication_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class buildTextField extends StatelessWidget {
   buildTextField({required this.controller,
     required this.hint,
     required this.icon,
   required this.label,
     required this.validator
   });
  TextEditingController controller;
   final String label;
  String hint;
  IconData icon;
  String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0).r,
      child: SizedBox(
        width: 220.w,
        height: 90.h,
        child: TextFormField(
          controller: controller,
          validator: validator,
          cursorColor: textBlack,
          style: TextStyle(fontSize: subFontSize.sp),
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: textBlack),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: textBlack),
            ),
            icon: Icon(
              icon,
              color: textBlack,
            ),
            labelText: label,
            hintText: hint,
            labelStyle: TextStyle(
              color: textBlack,
              fontSize: mainFontSize.sp,
              fontWeight: mainFontWeight,
            ),
            hintStyle: TextStyle(
              color: textBlack,
              fontSize: subFontSize.sp,
            ),
          ),
        ),
      ),
    );
  }
}
