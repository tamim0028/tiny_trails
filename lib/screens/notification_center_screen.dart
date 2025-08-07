import 'package:flutter/material.dart';
import 'package:myapp/widgets/bottom_nav_bar.dart';
import 'package:myapp/widgets/custom_drawer.dart';

class NotificationCenterScreen extends StatelessWidget {
  const NotificationCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Center'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text('Notification Center Screen'),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: null),
    );
  }
}
