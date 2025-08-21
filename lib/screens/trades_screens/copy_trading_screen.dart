import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CopyTradingScreen extends StatelessWidget {
  const CopyTradingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0D253C)),
          onPressed: () => Get.back(),
        ),
        
        // centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                        'Copy Trading',
                        style: TextStyle(
              color: const Color(0xFF0D253C),
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
                        ),
                      ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView(
                children: [
                  _buildTraderListItem('Michael S.', '+15,3%', 'assets/images/person.png'),
                  _buildTraderListItem('Emily R.', '+13,5%', 'assets/images/person.png'),
                  _buildTraderListItem('William M.', '+57,0%', 'assets/images/person.png'),
                ],
              ),
            ),
            // Copy Trade Button
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0070F3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () {
                    // Logic to copy trade
                  },
                  child: Text(
                    'Copy Trade',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTraderListItem(String name, String percentage, String imagePath) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28.r,
                backgroundImage: AssetImage(imagePath),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    percentage,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                percentage,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}