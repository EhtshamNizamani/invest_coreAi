import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopTradersScreen extends StatefulWidget {
  const TopTradersScreen({super.key});

  @override
  State<TopTradersScreen> createState() => _TopTradersScreenState();
}

class _TopTradersScreenState extends State<TopTradersScreen> {
  int _selectedTabIndex = 0;
  int _bottomNavIndex = 1; // Middle icon is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                // Title
                Text(
                  'Top Traders',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.h),
                // Tabs
                _buildTabs(),
                SizedBox(height: 24.h),
                // Trader List
                _buildTraderListItem(
                  imagePath: 'assets/images/person.png', // Apne asset path se match karein
                  name: 'Michael S.',
                  rightWidget: Text(
                    '+13.5%',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                _buildTraderListItem(
                  imagePath: 'assets/images/person.png', // Apne asset path se match karein
                  name: 'Emily R.',
                  rightWidget: Text(
                    'Medium',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  subText: '+13.5%',
                ),
                SizedBox(height: 40.h),
                // Bottom stats section
                _buildBottomStats(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Row(
      children: [
        _buildTabItem('Top', 0),
        SizedBox(width: 16.w),
        _buildTabItem('Interested', 1),
        SizedBox(width: 16.w),
        _buildTabItem('Avance', 2), // As per image
      ],
    );
  }

  Widget _buildTabItem(String title, int index) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: isSelected
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: const Color(0xFF3730A3),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            )
          : Text(
              title,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
    );
  }

  Widget _buildTraderListItem({
    required String imagePath,
    required String name,
    required Widget rightWidget,
    String? subText,
  }) {
    return Row(
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
            if (subText != null) ...[
              SizedBox(height: 4.h),
              Text(
                subText,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ],
        ),
        const Spacer(),
        rightWidget,
      ],
    );
  }

  Widget _buildBottomStats() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Traders',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NETA',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'links',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            Text(
              '2143%',
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}