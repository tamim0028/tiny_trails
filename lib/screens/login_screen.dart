import 'package:flutter/material.dart';
import 'package:myapp/routes.dart';
import 'package:myapp/utils/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCDD2), // Light pink
      body: SafeArea(
        child: Stack(
          children: [
            // Optional: background image at the bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/img/family.png', // replace with your asset path
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Content
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Social buttons
                  _buildSocialButton('Login with Facebook'),
                  _buildSocialButton('Login with Google'),
                  _buildSocialButton('Login with Apple'),

                  const SizedBox(height: 20),

                  // Email field
                  _buildTextField(label: 'Email'),

                  const SizedBox(height: 12),

                  // Password field
                  _buildTextField(label: 'Password', obscure: true),

                  const SizedBox(height: 20),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blue.shade800,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {Navigator.pushNamed(context, Routes.dashboard);},
                      child: const Text('Login',
                        style: TextStyle(
                          color: Colors.white, // Set text color to white
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Sign up link
                  const Text.rich(
                    TextSpan(
                      text: 'Need an account? ',
                      style: TextStyle(fontSize: 14),
                      children: [
                        TextSpan(
                          text: 'Sign up here',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Terms & policy
                  const Text(
                    'By signing in you agree to Kid Track Privacy Policy and T&C',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue.shade100,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {},
          child: Text(
            text,
            style: const TextStyle(color: Colors.black87),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
