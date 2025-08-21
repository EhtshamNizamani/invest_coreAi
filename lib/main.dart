import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_coreai/screens/splash_screen/splash_screen.dart'; // Apni screen ka sahi path daalein

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtilInit ko GetMaterialApp ke bahar wrap karein
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Aap apne design ke hisaab se size set karein
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return GetMaterialApp( // Yahan MaterialApp ki jagah GetMaterialApp use karein
          debugShowCheckedModeBanner: false,
          title: 'Your App Name',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          // 'child' ko home me pass karein jo ScreenUtilInit se mil raha hai
          home: child,
        );
      },
      // Aapki app ki pehli screen yahan daalein
      child: const SplashScreen(),
    );
  }
}