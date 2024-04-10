import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class AuthFromField extends StatelessWidget {
  final Function()? onTap;
  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  final Function(String)? onChange;
  final Color? cursorColor;

  const AuthFromField(
      {Key? key,
      this.hintText,
      this.title,
      this.suffixIcon,
      this.controller,
      this.prefixIcon,
      this.onChange,
        this.cursorColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: TextStyle(
              letterSpacing: 1,
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700),
        ).tr(),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          cursorColor: cursorColor ?? AppColors.colorPrimary,
          style: const TextStyle(color: AppColors.colorWhite),
          controller: controller,
          onChanged: onChange,
          validator: (val) => val!.isEmpty ? 'Field must be filled' : null,
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.mainColorsh1.withOpacity(0.50),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(color: AppColors.colorPrimary, width: 1.0),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
              hintText: '$hintText'.tr(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(color: AppColors.stockColor.withOpacity(0.5)),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                BorderSide(color: AppColors.errorColor.withOpacity(0.5)),
              ),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintStyle: const TextStyle(
                  fontSize: 14,
                  color: AppColors.hintTextColor,
                  fontWeight: FontWeight.w400),
              border: const OutlineInputBorder()),
        )
      ],
    );
  }
}
