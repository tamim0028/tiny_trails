import 'package:flutter/material.dart';
import 'package:myapp/utils/app_colors.dart';
import 'package:myapp/widgets/custom_drawer.dart';
import 'package:myapp/widgets/bottom_nav_bar.dart';

class RideSchedule extends StatelessWidget {
  const RideSchedule({super.key});

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
      body: Column(
        children: [
          // Top section with "Manage Schedule" and date selector.
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: const BoxDecoration(
              color: AppColors.backgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Manage Schedule',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Dec 2023',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 24),
                // Date selector row.
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    6,
                    (index) {
                      final dayNames = ['Thu', 'Fri', 'Sat', 'Sun', 'Mon', 'Tue'];
                      final date = 14 + index;
                      final isSelected = date == 17; // Example: Sunday is selected.
                      return Column(
                        children: [
                          Text(
                            dayNames[index],
                            style: TextStyle(
                              fontSize: 14,
                              color: isSelected ? AppColors.primary : AppColors.card,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            date.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: isSelected ? AppColors.primary : AppColors.card,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Schedule list and buttons section.
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  // "Location" and "Time" header.
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary),
                      ),
                      Text(
                        'Time',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Schedule items.
                  Expanded(
                    child: ListView(
                      children: [
                        _buildScheduleItem(context, 'Going to school', '7.30 AM'),
                        _buildScheduleItem(context, 'Arrived at school', '8.00 AM'),
                        _buildScheduleItem(context, 'Back from school', '2.30 PM'),
                        _buildScheduleItem(context, 'Arrived at home', '3.00 PM'),
                        _buildScheduleItem(context, 'Going to football training at school', '4.30 PM'),
                        _buildScheduleItem(context, 'Arrived at school', '5.00 PM'),
                        _buildScheduleItem(context, 'Back from school', '7.15 PM'),
                        _buildScheduleItem(context, 'Arrived at home', '8.00 PM'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // "Add" and "Remove" buttons.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text(
                            'Add',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.primary, width: 2),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text(
                            'Remove',
                            style: TextStyle(color: AppColors.primary, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: null),
    );
  }


  Widget _buildScheduleItem(BuildContext context, String location, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            location,
            style: const TextStyle(fontSize: 14, color: AppColors.primary),
          ),
          Text(
            time,
            style: const TextStyle(fontSize: 14, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
