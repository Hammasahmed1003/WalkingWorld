import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:walking_world/MVC/Utils/AppServices/GetRouteNames.dart';

import 'MVC/Utils/AppServices/GetRoutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

     return ScreenUtilInit(
  designSize: const Size(360, 690),
      minTextAdapt: true, 

      splitScreenMode: true,
builder: (_, child) {
    return GetMaterialApp(
      title: 'Flutter Demo',
        debugShowCheckedModeBanner: false, 

      theme: ThemeData(
      
        useMaterial3: true,
      ),
         getPages: AppPages.pages,
      initialRoute:
        GetRouteName.Loginscreen
    );
});
  }
}

