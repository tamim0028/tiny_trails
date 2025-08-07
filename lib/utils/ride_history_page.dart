import 'package:flutter/material.dart';
import 'package:myapp/widgets/bottom_nav_bar.dart';
import 'package:myapp/widgets/custom_drawer.dart';

class RideHistoryPage extends StatelessWidget {
  const RideHistoryPage({super.key});

  final List<Map<String, String>> _rideHistory = const [
    {
      "date": "2025-08-01",
      "destination": "School",
      "driver": "Mr. Karim",
      "status": "Completed"
    },
    {
      "date": "2025-07-31",
      "destination": "Library",
      "driver": "Mrs. Fatima",
      "status": "Completed"
    },
    // Add more ride records here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ride History"),
      ),
      drawer: CustomDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _rideHistory.length,
        itemBuilder: (context, index) {
          final ride = _rideHistory[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: ListTile(
              title: Text("${ride['destination']}"),
              subtitle: Text("Driver: ${ride['driver']}"),
              trailing: Text(
                ride['status']!,
                style: TextStyle(
                  color: ride['status'] == "Completed"
                      ? Colors.green
                      : Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              isThreeLine: true,
              leading: CircleAvatar(
                child: Text(
                  ride['date']!.split('-').last, // day from date
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 0),
    );
    
  }
}
