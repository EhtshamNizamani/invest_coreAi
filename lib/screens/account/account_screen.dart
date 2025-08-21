import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int _bottomNavIndex = 2; // Rightmost icon is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              // Profile Picture and Name
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60.r,
                      backgroundImage: AssetImage('assets/images/person.png'), // Apne asset path se match karein
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              // Progress Bar
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: LinearProgressIndicator(
                  value: 0.7, // 70% progress
                  minHeight: 8.h,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4338CA)),
                ),
              ),
              SizedBox(height: 40.h),
              // Menu Items
              _buildMenuItem('Progress'),
              _buildMenuItem('Settings'),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Divider(height: 1, color: Color(0xFFF3F4F6)),
      ],
    );
  }
}