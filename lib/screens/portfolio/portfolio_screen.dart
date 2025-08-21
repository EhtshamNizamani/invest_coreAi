import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:invest_coreai/screens/account/account_screen.dart';
import 'package:invest_coreai/screens/trades_screens/top_traders_screen.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  int _selectedTabIndex = 0;
  int _bottomNavIndex = 0;
  final screen  = [
    PortfolioScreen(),
    TopTradersScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
      // bottomNavigationBar: _buildBottomNavBar(screen:screen),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        onPressed: () => Get.back(),
      ),
      title: Text(
        'Virtual Portfolio',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTabs(),
            SizedBox(height: 24.h),
            _buildTotalValue(),
            SizedBox(height: 24.h),
            _buildDonutChartSection(),
            SizedBox(height: 30.h),
            _buildPerformanceSection(),
            SizedBox(height: 30.h),
            _buildRecentTrades(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Row(
      children: [
        _buildTabItem('Balance', 0),
        SizedBox(width: 24.w),
        _buildTabItem('Overview', 1),
        SizedBox(width: 24.w),
        _buildTabItem('Settings', 2),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? const Color(0xFF0052CC) : Colors.grey.shade500,
            ),
          ),
          SizedBox(height: 4.h),
          if (isSelected)
            Container(
              height: 3.h,
              width: 25.w,
              color: const Color(0xFF0052CC),
            )
        ],
      ),
    );
  }

  Widget _buildTotalValue() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total value',
          style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade600),
        ),
        SizedBox(height: 8.h),
        Text(
          '\$12,450',
          style: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Text(
              '+34%',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 16.w),
            Text(
              '+28%',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDonutChartSection() {
    return Row(
      children: [
        SizedBox(
          width: 120.w,
          height: 120.h,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  color: const Color(0xFF003380), // Darkest Blue
                  value: 60,
                  showTitle: false,
                  radius: 20,
                ),
                PieChartSectionData(
                  color: const Color(0xFF66B2FF), // Lighter Blue
                  value: 25,
                  showTitle: false,
                  radius: 20,
                ),
                PieChartSectionData(
                  color: const Color(0xFF0052CC), // Medium Blue
                  value: 15,
                  showTitle: false,
                  radius: 20,
                ),
              ],
              centerSpaceRadius: 40,
            ),
          ),
        ),
        SizedBox(width: 30.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLegendItem(const Color(0xFF003380), 'Technology'),
            SizedBox(height: 12.h),
            _buildLegendItem(const Color(0xFF66B2FF), 'Consumer'),
            SizedBox(height: 12.h),
            _buildLegendItem(const Color(0xFF0052CC), 'Friends'),
          ],
        )
      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 12.w,
          height: 12.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(width: 8.w),
        Text(text, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildPerformanceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Performance',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 18.r,
              backgroundColor: const Color(0xFF0052CC),
            ),
            SizedBox(width: 12.w),
            Text(
              'AMP',
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SizedBox(
                height: 40.h,
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false),
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 3), FlSpot(1, 1), FlSpot(2, 4),
                          FlSpot(3, 2), FlSpot(4, 5), FlSpot(5, 3),
                          FlSpot(6, 4),
                        ],
                        isCurved: true,
                        color: const Color(0xFF0052CC),
                        barWidth: 3,
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Text(
              '+35%',
              style: TextStyle(
                color: Colors.green,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text('1M', style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600)),
            SizedBox(width: 16.w),
            Text('1Y', style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600)),
            SizedBox(width: 16.w),
            Text('ALL', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
          ],
        )
      ],
    );
  }

  Widget _buildRecentTrades() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Trades',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.h),
        _buildTradeItem('Buy', 'AMP', '+3.30%'),
      ],
    );
  }

  Widget _buildTradeItem(String action, String stock, String change) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            text: '$action ',
            style: TextStyle(fontSize: 20.sp, color: Colors.grey.shade600),
            children: <TextSpan>[
              TextSpan(
                text: stock,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              )
            ],
          ),
        ),
        const Spacer(),
        Text(
          change,
          style: TextStyle(
            color: Colors.green,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}