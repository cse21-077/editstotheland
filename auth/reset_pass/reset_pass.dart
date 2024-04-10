import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/provider/auth_provider.dart';
import 'package:landlord/pages/auth/components/auth_text_form_field.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class ResetPass extends StatelessWidget {
  const ResetPass({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final provider = Provider.of<AuthProvider>(context);
    // UserLogin userLogin = UserLogin();
    final otpController = TextEditingController();
    final emailController = TextEditingController();
    final passController = TextEditingController();

    return Form(
      key: formKey,
      child: Scaffold(
          body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/drawer/auth_background.png",
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Image.asset(
                  'assets/drawer/app_logo.png',
                  height: 120.h,
                ),
                SizedBox(
                  height: 50.h,
                ),
                AuthFromField(
                  controller: otpController,
                  hintText: "OTP",
                  title: "OTP",
                ),
                SizedBox(
                  height: 20.h,
                ),
                AuthFromField(
                  controller: emailController,
                  hintText: "EMAIL",
                  title: "EMAIL",
                ),
                SizedBox(
                  height: 20.h,
                ),
                AuthFromField(
                  controller: passController,
                  hintText: "xxxxxx",
                  title: "PASSWORD",
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 52.h,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          backgroundColor: AppColors.colorWhite),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          provider.resetPass(
                              otp: otpController.text,
                              email: emailController.text,
                              password: passController.text,
                              context: context);
                        }
                      },
                      child: Text(
                        'Reset_Password',
                        style: TextStyle(
                          color: AppColors.colorPrimary,
                          letterSpacing: 1.sp,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ).tr()),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
