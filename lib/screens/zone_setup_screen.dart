import 'package:flutter/material.dart';
import 'package:myapp/widgets/bottom_nav_bar.dart';
import 'package:myapp/widgets/custom_drawer.dart';

class ZoneSetupScreen extends StatelessWidget {
  const ZoneSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zone Setup'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text('Zone Setup Screen'),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
