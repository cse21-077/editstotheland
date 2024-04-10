import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/registration_model.dart';
import 'package:landlord/pages/auth/components/auth_text_form_field.dart';
import 'package:landlord/pages/auth/login/login_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../data/provider/auth_provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final provider = Provider.of<AuthProvider>(context);
    UserRegistration userRegistration = UserRegistration();

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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70.h,
                ),
                CustomText(
                  text: 'Create_Account',
                  color: const Color(0xffEEEEEE),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  height: 1.75,
                ),
                CustomText(
                  text: 'create_an_account_to_continue!',
                  color: const Color(0xffEEEEEE),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
                SizedBox(
                  height: 30.h,
                ),
                AuthFromField(
                  title: "name",
                  hintText: "name",
                  cursorColor: AppColors.colorWhite,
                  onChange: (val) {
                    userRegistration.name = val;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                AuthFromField(
                  title: "Phone",
                  hintText: "123345566",
                  cursorColor: AppColors.colorWhite,
                  onChange: (val) {
                    userRegistration.phone = val;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                AuthFromField(
                  title: "EMAIL",
                  hintText: "email@gmail.com",
                  cursorColor: AppColors.colorWhite,
                  onChange: (val) {
                    userRegistration.email = val;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                AuthFromField(
                  title: "PASSWORD",
                  hintText: "Enter your password",
                  cursorColor: AppColors.colorWhite,
                  onChange: (val) {
                    userRegistration.password = val;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                AuthFromField(
                  title: "Confirm_Password",
                  hintText: "Enter your confirm password",
                  cursorColor: AppColors.colorWhite,
                  onChange: (val) {
                    userRegistration.confirmPassword = val;
                  },
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
                          if (userRegistration.password ==
                              userRegistration.confirmPassword) {
                            provider.registration(
                                userRegistration: userRegistration,
                                context: context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: const Text(
                                  'Password_and_confirm_password',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ).tr()));
                          }
                        }
                      },
                      child: Text(
                        'Sign_In',
                        style: TextStyle(
                          color: AppColors.colorPrimary,
                          letterSpacing: 1.sp,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Already_have_any_account?',
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
                        NavUtil.navigateScreen(context, const LoginScreen());
                      },
                      child: CustomText(
                        text: 'Sign_In',
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
