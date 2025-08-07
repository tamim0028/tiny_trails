import 'package:flutter/material.dart';
import 'package:myapp/routes.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/dashboard_screen.dart';
import 'package:myapp/services/auth_service.dart';
import 'package:myapp/utils/app_colors.dart'; // Import AppColors


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService().getCurrentUser(),
      builder: (context, AsyncSnapshot<String?> snapshot) {
        Widget home;
        if (snapshot.hasData) {
          home = DashboardScreen();
        } else {
          home = HomeScreen();
        }

        return MaterialApp(
          title: 'Tiny Trails',
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.backgroundColor,
          ),
          debugShowCheckedModeBanner: false,
          routes: Routes.routes,
          home: home,
        );
      },
    );
  }
}
