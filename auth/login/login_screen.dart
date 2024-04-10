import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/user_model.dart';
import 'package:landlord/data/provider/auth_provider.dart';
import 'package:landlord/pages/auth/components/auth_text_form_field.dart';
import 'package:landlord/pages/auth/forget_pass/forget_pass_screen.dart';
import 'package:landlord/pages/auth/registration/signup_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final provider = Provider.of<AuthProvider>(context);
    UserLogin userLogin = UserLogin();

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
                  hintText: "Email",
                  title: "Email",
                  cursorColor: AppColors.colorWhite,
                  onChange: (email) {
                    userLogin.email = email;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                AuthFromField(
                  cursorColor: AppColors.colorWhite,
                  hintText: "Enter your password",
                  title: "Password",
                  onChange: (password) {
                    userLogin.password = password;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 18.h,
                      width: 18.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.stockColor)),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    CustomText(
                      text: 'Remember Me',
                      color: const Color(0xffEEEEEE),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.75,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        NavUtil.navigateScreen(
                            context, const ForgetPassScreen());
                      },
                      child: CustomText(
                        text: 'Forgot Password',
                        color: const Color(0xffEEEEEE),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.75,
                      ),
                    ),
                  ],
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
                          provider.login(
                              userLogin: userLogin, context: context);
                        }
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: AppColors.colorPrimary,
                          letterSpacing: 1.sp,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Don’t have any account?',
                      color: const Color(0xffEEEEEE),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.75,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    InkWell(
                      onTap: () {
                        NavUtil.navigateScreen(context, const SignUpScreen());
                      },
                      child: CustomText(
                        text: 'SIGN UP',
                        color: const Color(0xffEEEEEE),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        height: 1.75,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
