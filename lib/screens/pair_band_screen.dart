import 'package:flutter/material.dart';
import 'package:myapp/widgets/bottom_nav_bar.dart';
import 'package:myapp/widgets/custom_drawer.dart';

class PairBandScreen extends StatelessWidget {
  const PairBandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pair Band'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text('Pair Band Screen'),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1),
    );
  }
}
