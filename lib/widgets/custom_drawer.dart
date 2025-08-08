import 'package:flutter/material.dart';
import 'package:myapp/routes.dart';
import 'package:myapp/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/services/auth_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 90, // 👈 Set your desired height here
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Tiny Trails',
                style: TextStyle(color: AppColors.textColor, fontSize: 24,fontWeight: FontWeight.w700,),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pushNamed(context, Routes.dashboard);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, Routes.profile);
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Zone Setup'),
            onTap: () {
              Navigator.pushNamed(context, Routes.zoneSetup);
            },
          ),
          ListTile(
            leading: Icon(Icons.report),
            title: Text('Attendance Report'),
            onTap: () {
              Navigator.pushNamed(context, Routes.attendanceReport);
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Push Notifications'),
            onTap: () {
              Navigator.pushNamed(context, Routes.notificationCenter);
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Driver Details'),
            onTap: () {
              Navigator.pushNamed(context, Routes.driverDetails);
            },
          ),
          ListTile(
            leading: Icon(Icons.child_care),
            title: Text('Kid List'),
            onTap: () {
              Navigator.pushNamed(context, Routes.kidList);
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Ride Schedule'),
            onTap: () {
              Navigator.pushNamed(context, Routes.rideSchedule);
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Booking Ride'),
            onTap: () {
              Navigator.pushNamed(context, Routes.bookingRide);
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Pickup Request'),
            onTap: () {
              Navigator.pushNamed(context, Routes.pickupRequest);
            },
          ),
          ListTile(
            leading: Icon(Icons.subscript),
            title: Text('Subscribtion'),
            onTap: () {
              Navigator.pushNamed(context, Routes.subscribtion);
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment Gateway'),
            onTap: () {
              Navigator.pushNamed(context, Routes.paymentGateway);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () async {
              AuthService authService = AuthService();
              bool loggedOut = await authService.logout();

              if (loggedOut) {
                Fluttertoast.showToast(
                    msg: "Logout Successful!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
                // Navigate to the login screen
                Navigator.pushReplacementNamed(context, Routes.login);
              } else {
                // Handle logout failure
                print('Logout failed!');
              }
            },
          ),
        ],
      ),
    );
  }
}
