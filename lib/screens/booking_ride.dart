// import 'package:flutter/material.dart';
// import 'package:myapp/utils/app_colors.dart';
// import 'package:myapp/widgets/custom_drawer.dart';
// import 'package:myapp/widgets/bottom_nav_bar.dart';

// class BookingRide extends StatelessWidget {
//   const BookingRide({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Booking Ride',
//           style: TextStyle(color: AppColors.textColor),
//         ),
//       ),
//       drawer: CustomDrawer(),
//       body: Center(
//         child: Text(
//           'Booking Ride',
//           style: TextStyle(color: AppColors.textColor),
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(selectedIndex: null),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:myapp/utils/app_colors.dart';
import 'package:myapp/widgets/custom_drawer.dart';
import 'package:myapp/widgets/bottom_nav_bar.dart';

class BookingRide extends StatelessWidget {
  const BookingRide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Ride K-12',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          // Map Placeholder
          Container(
            height: 250,
            color: Colors.grey[300],
            child: const Center(
              child: Icon(
                Icons.map,
                size: 80,
                color: Colors.grey,
              ),
            ),
          ),
          // Pickup & Dropoff Info
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Student Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Frankie Henry",
                      style: TextStyle(fontSize: 14),
                    ),
                    const Divider(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Pickup",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "4:16 PM",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Dropoff",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "4:45 PM",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            "Early Arrival",
                            style: TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Schedule Info
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Card(
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: const Text("Schedule"),
                    subtitle: const Text("Mon, Tue, Wed, Thu, Fri"),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text("Pickup Location"),
                    subtitle: const Text("Huntleigh Drive @ Winchester Place"),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text("Dropoff Location"),
                    subtitle: const Text("Tyler Middle School"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: null),
    );
  }
}
