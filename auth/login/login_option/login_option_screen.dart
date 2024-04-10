import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/pages/auth/login/login_screen.dart';
import 'package:landlord/pages/guest/screens/home_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class LoginOptionScreen extends StatelessWidget {
  const LoginOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/drawer/auth_background.png",
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/drawer/app_logo.png',
                  height: 120.h,
                ),
                SizedBox(
                  height: 50.h,
                ),
                InkWell(
                  onTap: () {
                    NavUtil.navigateScreen(context, const LoginScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.colorWhite,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0.sp),
                        child: const CustomText(
                          text: "Login as Landlord",
                          color: AppColors.colorPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                InkWell(
                  onTap: () {
                    NavUtil.navigateScreen(context, const LoginScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.colorWhite,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0.sp),
                        child: const CustomText(
                          text: "Login as Tenant",
                          color: AppColors.colorPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                InkWell(
                  onTap: () {
                    // Handle "Continue as Guest" action
                     NavUtil.navigateScreen(context, const GuestScreen());
                  },
                  child: const CustomText(
                    text: "Continue as Guest",
                    color: Color.fromARGB(255, 244, 244, 244),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
