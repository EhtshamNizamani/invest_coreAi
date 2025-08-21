import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'personality_result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(   // 👈 Added scroll to fix overflow
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  Text(
                    'Find Your\nInvestor Type',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff030c38),
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Answer 2 quick questions so\nwe can tailor your journey.',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      height: 1.4,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Question 1/3',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'You\'ve just received \$10,000 you don\'t need for daily expenses.\nWhat do you do',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B365D),
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  // Option A
                  _buildOptionTile(
                    'A',
                    'Put it in a high-interest\nsavings account',
                    'A',
                  ),
                  SizedBox(height: 16.h),
                  // Option B
                  _buildOptionTile(
                    'B',
                    'Invest in a mix of stocks\nand bonds',
                    'B',
                  ),
                  SizedBox(height: 16.h),
                  // Option C
                  _buildOptionTile(
                    'C',
                    'Go all in on a few high-\npotential stocks or crypto',
                    'C',
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile(String letter, String text, String value) {
    final isSelected = selectedOption == value;

    return GestureDetector(
     // ✅ SAHI CODE
onTap: () {
  setState(() {
    selectedOption = value;
  });

  // 1 second ke baad sirf ek baar aage jaayega
  Future.delayed(const Duration(seconds: 1), () {
    // Check karein ki user abhi bhi isi screen par hai ya nahi
    if (mounted) {
      Get.off(() => const PersonalityResultScreen());
    }
  });
},
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Color(0xFF0066FF) : Color(0xFFE5E5E5),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12.r),
          color: isSelected
              ? Color(0xFF0066FF).withOpacity(0.05)
              : Color(0xfff3f6ff),
        ),
        child: Row(
          children: [
            Container(
              width: 32.w,
              height: 32.h,
              child: Center(
                child: Text(
                  letter,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF001a8e),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1B365D),
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
