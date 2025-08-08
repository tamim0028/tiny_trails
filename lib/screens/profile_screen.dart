import 'package:flutter/material.dart';
import 'package:myapp/routes.dart';
import 'package:myapp/utils/app_colors.dart';
import 'package:myapp/widgets/custom_drawer.dart';
import 'package:myapp/widgets/bottom_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic> userData = {};
  Map<String, dynamic> driverData = {};
  bool isDriver = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.get(
      Uri.parse('https://tinytrails.alaminse.online/api/profile'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        userData = data['user'] ?? {};
        if (data['user']['driver'] != null) {
          isDriver = true;
          driverData = data['user']['driver'];
        }
      });
    } else {
      print('Failed to load profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: AppColors.textColor)),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 20,
                    color: Color(0xFFB0CCE1).withOpacity(0.32),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        userData.containsKey('photo')
                            ? 'https://tinytrails.alaminse.online/${userData['photo']}'
                            : 'assets/img/profile_placeholder.png',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'User Information',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ProfileInfo(
                    label: 'Name',
                    value:
                        '${userData['first_name'] ?? ""} ${userData['last_name'] ?? ""}',
                  ),
                  ProfileInfo(
                    label: 'Email',
                    value: '${userData['email'] ?? ""}',
                  ),
                  ProfileInfo(
                    label: 'Phone',
                    value: '${userData['phone'] ?? ""}',
                  ),
                  ProfileInfo(
                    label: 'Address',
                    value: '${userData['address'] ?? ""}',
                  ),
                  ProfileInfo(
                    label: 'Birth Date',
                    value: '${userData['dob'] ?? ""}',
                  ),
                  ProfileInfo(
                    label: 'Gender',
                    value: '${userData['gender'] ?? ""}',
                  ),
                  ProfileInfo(
                    label: 'Height',
                    value: '${userData['height_cm'] ?? ""}',
                  ),
                  ProfileInfo(
                    label: 'Weight',
                    value: '${userData['weight_kg'] ?? ""}',
                  ),
                  ProfileInfo(
                    label: 'Country Name',
                    value: '${userData['country_name'] ?? ""}',
                  ),
                  ProfileInfo(
                    label: 'State Name',
                    value: '${userData['state_id'] ?? ""}',
                  ),
                  ProfileInfo(
                    label: 'City Name',
                    value: '${userData['city_name'] ?? ""}',
                  ),
                  SizedBox(height: 20),

                  // "driver":{"id":11,"user_id":"23","":"2027-06-09","":"uploads/driver/23/175423427059.jpg","":"",,"car_image":"uploads/driver/23/175423427030.jpg","face_embedding":null,"is_verified":"0","device_token":null,"status":"active","created_at":"2025-08-03T05:17:50.000000Z","updated_at":"2025-08-03T05:17:50.000000Z","deleted_at":null},"image_path":"https://tinytrails.alaminse.online/uploads/images"}}
                  if (isDriver) ...[
                    Text(
                      'Driver Information',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    ProfileInfo(
                      label: 'Driving License Number',
                      value: '${driverData['driving_license_number'] ?? ""}',
                    ),
                    ProfileInfo(
                      label: 'Driving License Expiry',
                      value: '${driverData['driving_license_expiry'] ?? ""}',
                    ),
                    ProfileInfo(
                      label: 'Car Model',
                      value: '${driverData['car_model'] ?? ""}',
                    ),
                    ProfileInfo(
                      label: 'Car Make',
                      value: '${driverData['car_make'] ?? ""}',
                    ),
                    ProfileInfo(
                      label: 'Car Year',
                      value: '${driverData['car_year'] ?? ""}',
                    ),
                    ProfileInfo(
                      label: 'Car Color',
                      value: '${driverData['car_color'] ?? ""}',
                    ),
                    ProfileInfo(
                      label: 'Car Plate Number',
                      value: '${driverData['car_plate_number'] ?? ""}',
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          userData.containsKey('Driving License')
                              ? 'https://tinytrails.alaminse.online/${driverData['driving_license_image']}'
                              : 'assets/img/profile_placeholder.png',
                        ),
                      ),
                    ),

                    
                    Center(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: userData.containsKey('Car')
                                ? NetworkImage(
                                    'https://tinytrails.alaminse.online/${driverData['car_image']}',
                                  )
                                : AssetImage(
                                        'assets/img/profile_placeholder.png',
                                      )
                                      as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(
                            8,
                          ), // Use 0 for sharp corners
                        ),
                      ),
                    ),
                  ],
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 32,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // TODO: Implement update profile functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Update profile functionality not implemented yet',
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Update Profile',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfo({Key? key, required this.label, required this.value})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$label:', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
