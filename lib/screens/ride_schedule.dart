import 'package:flutter/material.dart';
import 'package:myapp/utils/app_colors.dart';
import 'package:myapp/widgets/custom_drawer.dart';
import 'package:myapp/widgets/bottom_nav_bar.dart';

class RideSchedule extends StatelessWidget {
  const RideSchedule({super.key});

  // Dummy schedule data
  final List<Map<String, String>> schedule = const [
    {'name': 'Station A', 'date': '2025-08-10', 'action': 'Start'},
    {'name': 'Station B', 'date': '2025-08-12', 'action': 'View'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ride Schedule',
          style: TextStyle(color: AppColors.textColor),
        ),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Upcoming Schedule", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Table(
              border: TableBorder.all(),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(1.5),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  children: const [
                    Padding(padding: EdgeInsets.all(8.0), child: Text("S. Name", style: TextStyle(fontWeight: FontWeight.bold))),
                    Padding(padding: EdgeInsets.all(8.0), child: Text("Date", style: TextStyle(fontWeight: FontWeight.bold))),
                    Padding(padding: EdgeInsets.all(8.0), child: Text("Action", style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                ),
                ...schedule.map((item) => TableRow(
                  children: [
                    Padding(padding: EdgeInsets.all(8.0), child: Text(item['name']!)),
                    Padding(padding: EdgeInsets.all(8.0), child: Text(item['date']!)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(item['action']!),
                      ),
                    ),
                  ],
                )).toList(),
              ],
            ),
            SizedBox(height: 20),
            Text("Latest History", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
              height: 100,
              color: Colors.grey[200],
              child: Center(child: Text("No history available")),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: null),
    );
  }
}
