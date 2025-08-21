import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:invest_coreai/screens/ai_prompt/ai_prompt_screen.dart';
import 'package:invest_coreai/screens/trades_screens/copy_trading_screen.dart';

class FirstTradeScreen extends StatelessWidget {
  const FirstTradeScreen({super.key});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                // Title
                Text(
                  'Marart',
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: 30.h),
                // Graph
                _buildGraph(),
                SizedBox(height: 20.h),
                // Tip
                Text(
                  'Tip: Diversify to reduce risk',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 20.h),
                // List of Trades
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _buildTradeItem(
                        title: 'Utilities ETF',
                        rightWidget: Text(
                          'ABC',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      _buildTradeItem(
                        title: 'ABC Corp',
                        rightWidget: _buildRiskTag(
                          text: 'Low', // Image me "Law" hai, "Low" zyada relevant hai
                          backgroundColor: const Color(0xFFE6F4EA),
                          textColor: const Color(0xFF4CAF50),
                        ),
                      ),
                      _buildTradeItem(
                        title: 'DEF Co',
                        rightWidget: _buildRiskTag(
                          text: 'Moderato', // Image me "Moderato" hai
                          backgroundColor: const Color(0xFFFFF4E5),
                          textColor: const Color(0xFFFFA000),
                        ),
                      ),
                      _buildTradeItem(
                        title: 'Technology ETF',
                        rightWidget: _buildRiskTag(
                          text: 'High',
                          backgroundColor: const Color(0xFFFFEEEB),
                          textColor: const Color(0xFFF44336),
                        ),
                      ),
                      _buildTradeItem(
                        title: 'GHI Inc',
                        rightWidget: const SizedBox(), // No tag here
                      ),
                    ],
                  ),
                ),
                // Confirm Button
                Container(
                  width: double.infinity,
                  height: 56.h,
                  margin: EdgeInsets.only(bottom: 20.h),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0070F3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
  Get.bottomSheet(
    const CopyTradesBottomSheet(),
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
    ),
    isScrollControlled: true, // Yeh important hai
  );
                    },
                    child: Text(
                      'Confirm Trade',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget for trade items
  Widget _buildTradeItem({required String title, required Widget rightWidget}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A1A1A),
                ),
              ),
              rightWidget,
            ],
          ),
        ),
        const Divider(height: 1, color: Color(0xFFEEEEEE)),
      ],
    );
  }

  // Helper widget for risk tags (Low, Moderate, High)
  Widget _buildRiskTag({
    required String text,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
      ),
    );
  }

  // Widget for the graph
  Widget _buildGraph() {
    return SizedBox(
      height: 150.h,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 1), FlSpot(1, 1.3), FlSpot(2, 1.2), FlSpot(3, 1.8),
                FlSpot(4, 1.5), FlSpot(5, 2.2), FlSpot(6, 2.0), FlSpot(7, 2.5),
                FlSpot(8, 2.4), FlSpot(9, 3.0), FlSpot(10, 2.8), FlSpot(11, 3.5),
              ],
              isCurved: false,
              color: const Color(0xFF0070F3),
              barWidth: 2.5,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF0070F3).withOpacity(0.2),
                    const Color(0xFF0070F3).withOpacity(0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class CopyTradesBottomSheet extends StatelessWidget {
  const CopyTradesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Wrap( // Wrap content ko automatically adjust karta hai
        children: [
          // Handle
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Center(
            child: Text(
              'Start with Copy Trades',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0D253C),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Center(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Follow a top investor\'s move to kickstart your portfolio.',
                style: TextStyle(
                  
                  fontSize: 16.sp,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          // Trader List
          _buildTraderRow('Michael S.', 'assets/images/person.png', 'Copy'),
          _buildTraderRow('Emily R.', 'assets/images/person.png', 'Copy'),
          _buildTraderRow('William M.', 'assets/images/person.png', 'Copy Trade'),
          SizedBox(height: 32.h),
          // Skip Button
          SizedBox(
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
                Get.back(); // Pehle bottom sheet band karein
                Get.to(() => const AiPromptScreen());
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildTraderRow(String name, String imagePath, String actionText) {
    return InkWell(
      onTap: () {
        Get.back(); // Pehle bottom sheet band karein
        Get.to(() => const CopyTradingScreen());
      },
      child:  Container(
        margin: EdgeInsets.symmetric(vertical: 6.h),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey.withAlpha(12)),
        padding: EdgeInsets.symmetric(vertical: 16.h,),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: Image.asset(imagePath),
            ),
            SizedBox(width: 16.w),
            Text(
              name,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Text(
              actionText,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0070F3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}