import 'package:flutter/material.dart';
import 'package:myapp/utils/app_colors.dart';

class BottomNavBar extends StatefulWidget {
  final int? selectedIndex;
  final Color? backgroundColor;

  const BottomNavBar({super.key, this.selectedIndex, this.backgroundColor});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bluetooth),
          label: 'Pair Band',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_shipping),
          label: 'Pickup Request',
        ),
      ],
      currentIndex: widget.selectedIndex != null ? widget.selectedIndex! : 0,
      selectedItemColor: AppColors.backgroundColor,
      onTap: (int index) {
        Navigator.pushNamed(context, getRouteName(index));
      },
    );
  }

  String getRouteName(int index) {
    switch (index) {
      case 0:
        return '/dashboard';
      case 1:
        return '/pair_band';
      case 2:
        return '/pickup_request';
      default:
        return '/dashboard';
    }
  }
}
