import 'package:flutter/material.dart';
import 'package:myapp/widgets/bottom_nav_bar.dart';
import 'package:myapp/widgets/custom_drawer.dart';

class TodaysRidePage extends StatelessWidget {
  const TodaysRidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todays Ride')),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Destination: School",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("Pickup: 7:30 AM"),
                    Text("Driver: Mr. Karim"),
                    SizedBox(height: 8),
                    Text(
                      "Status: On the way",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
            // You can add more ride cards here
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 0),
    );
  }
}
