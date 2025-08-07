import 'package:flutter/material.dart';

class RideSummaryCard extends StatelessWidget {
  final String destination;
  final String pickupTime;
  final String driverName;
  final String status;

  const RideSummaryCard({
    super.key,
    required this.destination,
    required this.pickupTime,
    required this.driverName,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor = status.toLowerCase() == 'on the way'
        ? Colors.green
        : Colors.orange;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Destination: $destination",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text("Pickup: $pickupTime"),
            Text("Driver: $driverName"),
            const SizedBox(height: 8),
            Text(
              "Status: $status",
              style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
