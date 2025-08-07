import 'package:flutter/material.dart';
import 'package:myapp/screens/booking_ride.dart';
import 'package:myapp/screens/driver_details.dart';
import 'package:myapp/screens/kid_list.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/payment_gateway.dart';
import 'package:myapp/screens/ride_schedule.dart';
import 'package:myapp/screens/signup_screen.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/pair_band_screen.dart';
import 'package:myapp/screens/pickup_request_screen.dart';
import 'package:myapp/screens/profile_screen.dart';
import 'package:myapp/screens/subscription.dart';
import 'package:myapp/screens/zone_setup_screen.dart';
import 'package:myapp/screens/attendance_report_screen.dart';
import 'package:myapp/screens/notification_center_screen.dart';
import 'package:myapp/screens/dashboard_screen.dart';

class Routes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String dashboard = '/dashboard';
  static const String pairBand = '/pair_band';
  static const String pickupRequest = '/pickup_request';
  static const String profile = '/profile';
  static const String zoneSetup = '/zone_setup';
  static const String attendanceReport = '/attendance_report';
  static const String notificationCenter = '/notification_center';
  static const String driverDetails = '/driver_details';
  static const String kidList = '/kid_list';
  static const String rideSchedule = '/ride_schedule';
  static const String bookingRide = '/booking_ride';
  static const String subscribtion = '/subscribtion';
  static const String paymentGateway = '/payment_gateway';


  static Map<String, WidgetBuilder> get routes {
    return {
      login: (context) => LoginScreen(),
      signup: (context) => SignupScreen(),
      home: (context) => HomeScreen(),
      dashboard: (context) => DashboardScreen(),
      pairBand: (context) => PairBandScreen(),
      pickupRequest: (context) => PickupRequestScreen(),
      profile: (context) => ProfileScreen(),
      zoneSetup: (context) => ZoneSetupScreen(),
      attendanceReport: (context) => AttendanceReportScreen(),
      notificationCenter: (context) => NotificationCenterScreen(),
      driverDetails: (context) => DriverDetails(),
      kidList: (context) => KidListScreen(),
      rideSchedule: (context) => RideSchedule(),
      bookingRide: (context) => BookingRide(),
      subscribtion: (context) => Subscribtion(),
      paymentGateway: (context) => PaymentGateway(),
      
    };
}
}
