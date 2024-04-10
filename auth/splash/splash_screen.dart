import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/pages/auth/login/login_option/login_option_screen.dart';
import 'package:landlord/pages/landlord/home/bottom_navigation_bar/custom_bottom_nav.dart';
import 'package:landlord/pages/landlord/tedits/pages/home_page_land.dart';
import 'package:landlord/pages/tenants/bottom_nav/tenant_bottom_nav.dart';
import 'package:landlord/pages/tenants/dashboard/view/tenant_dashbord.dart';
import 'package:landlord/pages/tenants/topoedits/dashboard/homepagetenant.dart';
import 'package:landlord/utils/global_state.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/utils.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final provider = Provider.of<LocalAutProvider>(context, listen: false);
    final userData = provider.getUser();

    Future.delayed(const Duration(seconds: 3), () async {
      Utils.initDio();
      if (provider.getUser() != null) {
        GlobalState.instance.set('token', provider.getUser()?.token);
        if (userData?.roleId == 4) {
          NavUtil.navigateScreen(context, const HomePageLandy());
        } else {
          NavUtil.navigateScreen(context, const MyHomePageTenant());
        }
      } else {
        NavUtil.navigateScreen(context, const LoginOptionScreen());
      }
    });

    super.initState();
  }

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
      child: Center(
        child: Image.asset(
          'assets/drawer/app_logo.png',
          height: 146.w,
        ),
      ),
    ));
  }
}
