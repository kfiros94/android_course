import 'package:flutter/material.dart';
import 'otp_verification_screen.dart';

class LoginPhoneScreen extends StatefulWidget {
  const LoginPhoneScreen({super.key});

  static const routeName = '/loginPhone';

  @override
  State<LoginPhoneScreen> createState() => _LoginPhoneScreenState();
}

class _LoginPhoneScreenState extends State<LoginPhoneScreen> {
  final _phoneController = TextEditingController();

  /// Sorted alphabetically by country name
  static const _countries = [
    {'label': '🇦🇺 +61', 'prefix': '+61'},  // Australia
    {'label': '🇧🇷 +55', 'prefix': '+55'},  // Brazil
    {'label': '🇬🇧 +44', 'prefix': '+44'},  // Britain / UK
    {'label': '🇫🇷 +33', 'prefix': '+33'},  // France
    {'label': '🇩🇪 +49', 'prefix': '+49'},  // Germany
    {'label': '🇮🇳 +91', 'prefix': '+91'},  // India
    {'label': '🇮🇱 +972', 'prefix': '+972'}, // Israel
    {'label': '🇮🇹 +39', 'prefix': '+39'},  // Italy
    {'label': '🇯🇵 +81', 'prefix': '+81'},  // Japan
    {'label': '🇲🇽 +52', 'prefix': '+52'},  // Mexico
    {'label': '🇳🇱 +31', 'prefix': '+31'},  // Netherlands
    {'label': '🇪🇸 +34', 'prefix': '+34'},  // Spain
    {'label': '🇺🇸 +1',  'prefix': '+1'},   // USA
  ];

  String _selectedPrefix = _countries.first['prefix']!;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Image.asset(
                'assets/images/phone_login.png',
                height: 160,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Login With Phone',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            const Text(
              'Enter your phone number and we\'ll send you an SMS code.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 32),

            // --- Country prefix + phone input ---
            Row(
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedPrefix,
                    items: _countries
                        .map(
                          (c) => DropdownMenuItem<String>(
                            value: c['prefix'],
                            child: Text(c['label']!),
                          ),
                        )
                        .toList(),
                    onChanged: (v) {
                      if (v != null) {
                        setState(() => _selectedPrefix = v);
                      }
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // --- Send code button ---
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  final phone = '$_selectedPrefix${_phoneController.text.trim()}';
                  if (phone.length < 5) return; // rudimentary check

                  // TODO: trigger Firebase Auth verifyPhoneNumber here

                  Navigator.pushNamed(
                    context,
                    OtpVerificationScreen.routeName,
                    arguments: phone,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3F7DFB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Send Code', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}