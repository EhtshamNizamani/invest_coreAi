import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:invest_coreai/screens/main/main_screen.dart';
import 'package:invest_coreai/screens/portfolio/portfolio_screen.dart';

// Tile ke data ko manage karne ke liye ek helper class
class GameTileData {
  final String? text;
  final IconData? icon;
  final Color backgroundColor;
  final Color foregroundColor;

  GameTileData({
    this.text,
    this.icon,
    required this.backgroundColor,
    this.foregroundColor = Colors.white,
  });
}

class GameScreen extends StatelessWidget {
   GameScreen({super.key});

  // Grid ke liye sample data, jaisa image mein hai
  final List<GameTileData> gameTiles =  [
    GameTileData(text: 'AAPL', backgroundColor: Color(0xFF1E3A8A)),
    GameTileData(icon: Icons.arrow_upward_rounded, backgroundColor: Color(0xFF1E3A8A)),
    GameTileData(icon: Icons.arrow_upward_rounded, backgroundColor: Color(0xFF5EEAD4)),
    GameTileData(icon: Icons.person, backgroundColor: Color(0xFFE0E7FF), foregroundColor: Color(0xFF4338CA)),
    
    GameTileData(icon: Icons.arrow_upward_rounded, backgroundColor: Color(0xFF1E3A8A)),
    GameTileData(icon: Icons.arrow_upward_rounded, backgroundColor: Color(0xFF1E3A8A)),
    GameTileData(icon: Icons.arrow_upward_rounded, backgroundColor: Color(0xFF1E3A8A)),
    GameTileData(icon: Icons.arrow_upward_rounded, backgroundColor: Color(0xFF5EEAD4)),
    
    GameTileData(text: 'APP', backgroundColor: Color(0xFF1E3A8A)),
    GameTileData(text: 'AMP', backgroundColor: Color(0xFF1E3A8A)),
    GameTileData(text: 'AMP', backgroundColor: Color(0xFF8B5CF6)),
    GameTileData(icon: Icons.arrow_upward_rounded, backgroundColor: Color(0xFF5EEAD4)),
    
    GameTileData(text: 'APP', backgroundColor: Color(0xFF1E3A8A)),
    GameTileData(text: 'AMP', backgroundColor: Color(0xFF1E3A8A)),
    GameTileData(text: 'AMP', backgroundColor: Color(0xFF8B5CF6)),
    GameTileData(icon: Icons.arrow_upward_rounded, backgroundColor: Color(0xFF5EEAD4)),

    GameTileData(text: 'AAPL', backgroundColor: Color(0xFF1E3A8A)),
    GameTileData(text: 'AMP', backgroundColor: Color(0xFF1E3A8A)),
    GameTileData(icon: Icons.arrow_upward_rounded, backgroundColor: Color(0xFF5EEAD4)),
    GameTileData(icon: Icons.person, backgroundColor: Color(0xFFE0E7FF), foregroundColor: Color(0xFF4338CA)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              // Top header section
              _buildHeader(),
              SizedBox(height: 12.h),
              // Progress bar
              _buildProgressBar(),
              SizedBox(height: 24.h),
              // Grid Title
              Text(
                '30/100',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 16.h),
              // The Game Grid
              _buildGameGrid(),
              const Spacer(),
              // Bottom Buttons
              _buildActionButtons(),
              SizedBox(height: 16.h),
              _buildExitButton(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 14.r,
              backgroundColor: Colors.amber,
            ),
            SizedBox(width: 10.w),
            Text(
              '25.350',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Text(
          '30/100',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: LinearProgressIndicator(
        value: 0.3, // 30/100
        minHeight: 10.h,
        backgroundColor: Colors.grey.shade300,
        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4338CA)),
      ),
    );
  }

  Widget _buildGameGrid() {
    return GridView.builder(
      shrinkWrap: true, // Important for GridView inside Column
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 1, // To make tiles square
      ),
      itemCount: gameTiles.length,
      itemBuilder: (context, index) {
        final tile = gameTiles[index];
        return Container(
          decoration: BoxDecoration(
            color: tile.backgroundColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: tile.text != null
                ? Text(
                    tile.text!,
                    style: TextStyle(
                      color: tile.foregroundColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Icon(
                    tile.icon,
                    color: tile.foregroundColor,
                    size: 32.sp,
                  ),
          ),
        );
      },
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            side: BorderSide(color: Colors.grey.shade400),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            'USS POWER UP',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        OutlinedButton(
          onPressed: () {
Get.to(MainScreen());


          },
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            side: BorderSide(color: Colors.grey.shade400),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            'VIEW STOCK INFO',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExitButton() {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4F46E5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        onPressed: () {},
        child: Text(
          'EXIT TO MARKET',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}