import 'package:flutter/material.dart';
import 'package:myapp/routes.dart';
import 'package:myapp/utils/app_colors.dart';
import 'package:myapp/utils/header.dart';
import 'package:myapp/utils/kids_card_list.dart';
import 'package:myapp/utils/ride_history_page.dart';
import 'package:myapp/utils/ride_summary_card.dart';
import 'package:myapp/utils/todays_ride_page.dart';
import 'package:myapp/widgets/custom_drawer.dart';
import 'package:myapp/widgets/bottom_nav_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kids Section
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(
                      title: "Your Kids",
                      onViewAll: () {
                      Navigator.pushNamed(context, Routes.kidList);
                      },
                    ),
                    const SizedBox(height: 12),
                    const SizedBox(height: 260, child: KidsCardList()),
                  ],
                ),
              ),
            ),

            const Divider(thickness: 1),

            // Today's Ride Section
            SectionHeader(
              title: "Today’s Ride",
              onViewAll: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodaysRidePage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final rides = [
                    {
                      "destination": "School",
                      "pickupTime": "7:30 AM",
                      "driverName": "Mr. Karim",
                      "status": "On the way",
                    },
                    {
                      "destination": "Library",
                      "pickupTime": "9:00 AM",
                      "driverName": "Ms. Fatima",
                      "status": "Pending",
                    },
                  ];
                  final ride = rides[index];
                  return RideSummaryCard(
                    destination: ride["destination"]!,
                    pickupTime: ride["pickupTime"]!,
                    driverName: ride["driverName"]!,
                    status: ride["status"]!,
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            const Divider(thickness: 1),
            const SizedBox(height: 32),

            // View Ride History Button
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 36,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 3,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const RideHistoryPage()),
                      );
                    },
                    child: const Text(
                      "View Ride History",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 36,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 3,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.driverDetails);
                    },
                    child: const Text(
                      "View Driver Details",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 0),
    );
  }
}
