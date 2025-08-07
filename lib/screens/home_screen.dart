import 'package:flutter/material.dart';
import 'package:myapp/routes.dart';
import 'package:myapp/widgets/bottom_nav_bar.dart';
import 'package:myapp/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Go to Login'),
              onPressed: () {
                Navigator.pushNamed(context, Routes.login);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Go to Dashboard'),
              onPressed: () {
                Navigator.pushNamed(context, Routes.dashboard);
              },
            ),
          ],
        ),
      ),
      
    );
  }
}
