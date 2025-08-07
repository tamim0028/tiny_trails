import 'package:flutter/material.dart';
import 'package:myapp/routes.dart';
import 'package:myapp/utils/app_colors.dart';
import 'package:myapp/widgets/custom_drawer.dart';
import 'package:myapp/widgets/bottom_nav_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 
  final _formKey = GlobalKey<FormState>();

  String name = "Jane Doe";
  String email = "janedoe@example.com";
  String phone = "+1 234 567 890";
  String address = "123 Main St, Springfield";

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
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    'assets/img/profile_placeholder.png',
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: InkWell(
                    onTap: () {
                      // Add profile image update functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Edit profile photo tapped'),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Form fields
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField(
                    label: "Full Name",
                    initialValue: name,
                    onSaved: (val) => name = val ?? name,
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    label: "Email Address",
                    initialValue: email,
                    onSaved: (val) => email = val ?? email,
                    validator: (val) {
                      if (val == null || !val.contains('@')) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    label: "Phone Number",
                    initialValue: phone,
                    onSaved: (val) => phone = val ?? phone,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    label: "Address",
                    initialValue: address,
                    onSaved: (val) => address = val ?? address,
                    maxLines: 2,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Profile updated successfully'),
                      ),
                    );
                    // TODO: Save changes to backend or local storage
                  }
                },
                child: const Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text('parent@email.com'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.kidList);
              },
              child: const Text('Manage Kids'),
            ),
            const SizedBox(height: 16),

            // Log out button
            TextButton(
              onPressed: () {
                // TODO: Implement logout functionality
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Logged out')));
              },
              child: Text(
                'Log Out',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

Widget _buildTextField({
  required String label,
  required String? initialValue,
  required FormFieldSetter<String> onSaved,
  FormFieldValidator<String>? validator,
  TextInputType keyboardType = TextInputType.text,
  int maxLines = 1,
  TextInputAction? textInputAction,
}) {
  return TextFormField(
    initialValue: initialValue,
    onSaved: onSaved,
    validator: validator,
    keyboardType: keyboardType,
    maxLines: maxLines,
    textInputAction: textInputAction,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  );
}
