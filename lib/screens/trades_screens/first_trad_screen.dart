import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:invest_coreai/screens/ai_prompt/ai_prompt_screen.dart';
import 'package:invest_coreai/screens/trades_screens/copy_trading_screen.dart';

class FirstTradeScreen extends StatelessWidget {
  FirstTradeScreen({super.key});
  final priceHistory = [
    (DateTime(2024, 12, 19), 39000.0),
    (DateTime(2025, 2, 7), 47000.0),
    (DateTime(2025, 3, 28), 64000.0),
    (DateTime(2025, 5, 17), 60000.0),
    (DateTime(2025, 7, 6), 68000.0),
    (DateTime(2025, 8, 25), 72000.0),
    (DateTime(2025, 10, 14), 85000.0),
    (DateTime(2025, 12, 3), 100000.0),
  ];

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
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                // Title
                Center(
                  child: Text(
                    'S&P 500 ETF',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                // Graph
                SizedBox(
                  height: 250.h,
                  width: double.infinity,
                  child: FinancialChart(),
                ),
                SizedBox(height: 20.h),
                SizedBox(height: 16.h),

                // Tip
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Tip: ',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.green.shade600,
                        ),
                      ),
                      TextSpan(
                        text: 'Diversify to reduce risk',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.green.shade600,
                        ),
                      ),
                    ],
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
                          'Low',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      _buildTradeItem(
                        title: 'Berkshire Hathaway',
                        rightWidget: _buildRiskTag(
                          text:
                              'Low', // Image me "Law" hai, "Low" zyada relevant hai
                          backgroundColor: const Color(0xFFE6F4EA),
                          textColor: const Color(0xFF4CAF50),
                        ),
                      ),
                      _buildTradeItem(
                        title: 'Eli Lilly',
                        rightWidget: _buildRiskTag(
                          text: 'Moderato', // Image me "Moderato" hai
                          backgroundColor: const Color(0xFFFFF4E5),
                          textColor: const Color(0xFFFFA000),
                        ),
                      ),
                      _buildTradeItem(
                        title: 'Tesla',
                        rightWidget: _buildRiskTag(
                          text: 'High',
                          backgroundColor: const Color(0xFFFFEEEB),
                          textColor: const Color(0xFFF44336),
                        ),
                      ),
                      _buildTradeItem(
                        title: 'Palantir',
                        rightWidget: _buildRiskTag(
                          text: 'High',
                          backgroundColor: const Color(0xFFFFEEEB),
                          textColor: const Color(0xFFF44336),
                        ), // No tag here
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
                FlSpot(0, 1),
                FlSpot(1, 1.3),
                FlSpot(2, 1.2),
                FlSpot(3, 1.8),
                FlSpot(4, 1.5),
                FlSpot(5, 2.2),
                FlSpot(6, 2.0),
                FlSpot(7, 2.5),
                FlSpot(8, 2.4),
                FlSpot(9, 3.0),
                FlSpot(10, 2.8),
                FlSpot(11, 3.5),
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
      child: Wrap(
        // Wrap content ko automatically adjust karta hai
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
                style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade600),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          // Trader List
          _buildTraderRow('Michael S.', 'assets/images/person.png', 'Copy'),
          _buildTraderRow('Emily R.', 'assets/images/person.png', 'Copy'),
          _buildTraderRow(
            'William M.',
            'assets/images/person.png',
            'Copy Trade',
          ),
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
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.withAlpha(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(imagePath),
            ),
            SizedBox(width: 16.w),
            Text(
              name,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
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

class FinancialChart extends StatefulWidget {
  @override
  _FinancialChartState createState() => _FinancialChartState();
}

class _FinancialChartState extends State<FinancialChart> {
  String selectedPeriod = '1Y';

  final List<String> periods = ['1D', '1M', '3M', '6M', '1Y', '3Y', '5Y'];
  List<double> expandChartData(List<double> original, int factor) {
    final expanded = <double>[];

    for (int i = 0; i < original.length - 1; i++) {
      final start = original[i];
      final end = original[i + 1];

      // always add start
      expanded.add(start);

      // insert in-between values
      for (int j = 1; j < factor; j++) {
        final t = j / factor;
        expanded.add(start + (end - start) * t); // linear interpolation
      }
    }

    // add the last value
    expanded.add(original.last);
    return expanded;
  }

  final List<double> chartData = [
    0.4,
    0.42,
    0.45,
    0.48,
    0.52,
    0.55,
    0.58,
    0.62,
    0.65,
    0.68,
    0.72,
    0.76,
    0.82,
    0.88,
    0.92,
    0.95,
    0.98,
    0.96,
    0.94,
    0.92,
    0.90,
    0.88,
    0.85,
    0.83,
    0.80,
    0.78,
    0.76,
    0.74,
    0.72,
    0.70,
    0.68,
    0.65,
    0.62,
    0.58,
    0.55,
    0.52,
    0.48,
    0.45,
    0.42,
    0.38,
    0.35,
    0.32,
    0.28,
    0.25,
    0.22,
    0.18,
    0.15,
    0.12,
    0.08,
    0.05,
    0.08,
    0.12,
    0.18,
    0.25,
    0.32,
    0.38,
    0.45,
    0.52,
    0.58,
    0.65,
    0.72,
    0.78,
    0.82,
    0.85,
    0.88,
    0.90,
    0.88,
    0.85,
    0.82,
    0.78,
    0.75,
    0.72,
    0.68,
    0.65,
    0.62,
    0.58,
    0.55,
    0.52,
    0.48,
    0.45,
    0.48,
    0.52,
    0.58,
    0.65,
    0.72,
    0.78,
    0.82,
    0.85,
    0.88,
    0.85,
  ];

  @override
  Widget build(BuildContext context) {
    final List<double> expandedData = expandChartData(
      chartData,
      5,
    ); // ~450 points

    return Column(
      children: [
        // Time period selector
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: periods.map((period) {
              bool isSelected = period == selectedPeriod;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPeriod = period;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: isSelected ? Colors.blue : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    period,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: isSelected ? Colors.blue : Colors.grey[600],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        // Chart area
        Expanded(
          child: SizedBox(
            child: CustomPaint(
              painter: ChartPainter(expandedData),
              size: Size.infinite,
            ),
          ),
        ),
      ],
    );
  }
}

class ChartPainter extends CustomPainter {
  final List<double> data;

  ChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()
      ..color = Colors.blue.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 0.5;

    final textStyle = TextStyle(color: Colors.grey[600], fontSize: 12);

    // Draw horizontal grid lines and price labels
    final priceLabels = [
      '£92.00',
      '£88.00',
      '£84.00',
      '£80.00',
      '£76.00',
      '£72.00',
    ];
    for (int i = 0; i < priceLabels.length; i++) {
      double y = (size.height / (priceLabels.length - 1)) * i;

      // Draw grid line
      canvas.drawLine(Offset(60, y), Offset(size.width - 20, y), gridPaint);

      // Draw price label
      final textSpan = TextSpan(text: priceLabels[i], style: textStyle);
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(5, y - textPainter.height / 2));
    }

    // Draw date labels
    final dateLabels = ['22 Aug 24', '15 Jan 25', '10 Jun 25'];
    final datePositions = [80.0, size.width / 2, size.width - 80];

    for (int i = 0; i < dateLabels.length; i++) {
      final textSpan = TextSpan(text: dateLabels[i], style: textStyle);
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(datePositions[i] - textPainter.width / 2, size.height + 10),
      );
    }

    // Create path for the chart line
    final path = Path();
    final fillPath = Path();

    if (data.isNotEmpty) {
      double chartWidth = size.width - 80; // Account for padding
      double chartHeight = size.height;

      // Start the paths
      double startX = 60;
      double startY = chartHeight - (data[0] * chartHeight);
      path.moveTo(startX, startY);
      fillPath.moveTo(startX, chartHeight);
      fillPath.lineTo(startX, startY);

      // Create sharp-edged path by connecting points directly
      for (int i = 1; i < data.length; i++) {
        double x = startX + (chartWidth / (data.length - 1)) * i;
        double y = chartHeight - (data[i] * chartHeight);

        path.lineTo(x, y);
        fillPath.lineTo(x, y);
      }

      // Complete the fill path
      fillPath.lineTo(startX + chartWidth, chartHeight);
      fillPath.close();

      // Draw the filled area
      canvas.drawPath(fillPath, fillPaint);

      // Draw the line
      canvas.drawPath(path, paint);
    }

    // Draw expand icon in bottom right
    final expandIconPaint = Paint()
      ..color = Colors.grey[400]!
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    double iconSize = 16;
    double iconX = size.width - 30;
    double iconY = size.height - 20;

    canvas.drawRect(
      Rect.fromLTWH(iconX, iconY, iconSize, iconSize),
      expandIconPaint,
    );

    canvas.drawLine(
      Offset(iconX + 4, iconY - 4),
      Offset(iconX + 4, iconY + 4),
      expandIconPaint,
    );

    canvas.drawLine(
      Offset(iconX + 4, iconY - 4),
      Offset(iconX + 12, iconY - 4),
      expandIconPaint,
    );

    canvas.drawLine(
      Offset(iconX + iconSize - 4, iconY + iconSize + 4),
      Offset(iconX + iconSize - 4, iconY + iconSize - 4),
      expandIconPaint,
    );

    canvas.drawLine(
      Offset(iconX + iconSize - 4, iconY + iconSize + 4),
      Offset(iconX + 4, iconY + iconSize + 4),
      expandIconPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
