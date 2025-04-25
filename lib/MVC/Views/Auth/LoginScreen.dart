import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:walking_world/MVC/Utils/AppServices/GetRouteNames.dart';
import 'package:walking_world/MVC/Utils/Components/SpringWidget.dart';
import 'package:walking_world/MVC/Utils/Components/TextComponent.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Stack(
          children: [
            // Lottie background
            Center(
              child: Positioned.fill(
                child: Lottie.asset(
                  'assets/Animations/loginAnimation.json',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Blur overlay
            // Positioned.fill(
            //   child: BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            //     child: Container(
            //       color: Colors.white.withOpacity(0.1),
            //     ),
            //   ),
            // ),

            // Auth content at bottom
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 60.h, left: 24.w, right: 24.w, ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    

                    TextComponent(
  text: "Login to Walking World",
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontSize: 30.sp,
),
                   
                     Align(
                                  alignment: Alignment.bottomLeft,

                       child: TextComponent(
                         text: "Select any way to go through the app",
                         color: Colors.black,
                         fontWeight: FontWeight.w300,
                         fontSize: 15.sp,
                       ),
                     ),

                    // Apple Login Button
                    SizedBox(height: 10.h,),
                    SpringWidget(
                      onTap: () {
                       Get.offAllNamed(GetRouteName.Profilesetup);
                      },
                      child: Image.asset(
                        'assets/images/AppleButton.png',
                        width: double.infinity,
                      ),
                    ),
                    // SizedBox(height: 20.h),
                    SizedBox(height: 10.h,),

                    // Google Login Button
                    SpringWidget(
                      onTap: () {
                        // TODO: Google login logic
                      },
                      child: Image.asset(
                        'assets/images/AppleButton.png',
                        width: double.infinity,
                       
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
