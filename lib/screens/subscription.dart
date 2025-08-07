import 'package:flutter/material.dart';
import 'package:myapp/utils/app_colors.dart';
import 'package:myapp/widgets/custom_drawer.dart';
import 'package:myapp/widgets/bottom_nav_bar.dart';

class Subscribtion extends StatelessWidget {
  const Subscribtion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Subscribtion',
          style: TextStyle(color: AppColors.textColor),
        ),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text(
          'Subscribtion',
          style: TextStyle(color: AppColors.textColor),
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: null),
    );
  }
}
