// import 'package:flutter/material.dart';
// import 'package:myapp/widgets/bottom_nav_bar.dart';
// import 'package:myapp/widgets/custom_drawer.dart';

// class PickupRequest extends StatelessWidget {
//   const PickupRequest({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pickup Request'),
//       ),
//       drawer: CustomDrawer(),
//       body: Center(
//         child: Text('Pickup Request Screen'),
//       ),
//       bottomNavigationBar: BottomNavBar(selectedIndex: 2),
//     );
//   }
// }


import 'package:flutter/material.dart';

import 'package:myapp/widgets/bottom_nav_bar.dart';
import 'package:myapp/widgets/custom_drawer.dart';

class PickupRequestScreen extends StatefulWidget {
  const PickupRequestScreen({super.key});

  @override
  State<PickupRequestScreen> createState() => _PickupRequestScreenState();
}

class _PickupRequestScreenState extends State<PickupRequestScreen> {
  final TextEditingController _nameController = TextEditingController();
  TimeOfDay? _selectedTime;
  DateTime? _selectedDate;
  String? _selectedLocation;
  String? _pickedImage;

  final List<String> _locations = [
    'New York City, USA',
    'Los Angeles, USA',
    'Chicago, USA',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pickup Request'),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pickup Name
            const Text(
              'Pickup Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter pickup name',
              ),
            ),
            const SizedBox(height: 16),
            // Pickup Time
            const Text(
              'Pickup Time',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  setState(() {
                    _selectedTime = picked;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedTime != null
                          ? _selectedTime!.format(context)
                          : 'Select time',
                    ),
                    const Icon(Icons.access_time),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Pickup Date
            const Text(
              'Pickup Date',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    _selectedDate = picked;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(
                    //   _selectedDate != null
                    //       ? DateFormat('dd MMM, yyyy').format(_selectedDate!)
                    //       : 'Select date',
                    // ),
                    const Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Pickup Location
            const Text(
              'Pickup Location',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              value: _selectedLocation,
              hint: const Text('Select location'),
              items: _locations
                  .map(
                    (location) => DropdownMenuItem(
                      value: location,
                      child: Text(location),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedLocation = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // Pickup Image
            const Text(
              'Pickup Image',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () {
                // Implement your image picker logic here
                setState(() {
                  _pickedImage = 'image_uploaded.jpg';
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_pickedImage ?? 'Upload Image'),
                    const Icon(Icons.upload),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  // Submit logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pickup requested')),
                  );
                },
                child: const Text(
                  'Request a pickup',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: null),
    );
  }
}
