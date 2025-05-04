import 'package:flutter/material.dart';
import 'otp_verification_screen.dart';   // ← הוסף import

class LoginPhoneScreen extends StatefulWidget {
  const LoginPhoneScreen({super.key});

  static const routeName = '/loginPhone';

  @override
  State<LoginPhoneScreen> createState() => _LoginPhoneScreenState();
}

class _LoginPhoneScreenState extends State<LoginPhoneScreen> {
  final _phoneController = TextEditingController();

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

            // --- Phone number input ---
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // --- Send code button ---
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  final phone = _phoneController.text.trim();
                  if (phone.isEmpty) return;

                  // TODO: trigger Firebase Auth verifyPhoneNumber here

                  // מעבר למסך אימות‑OTP
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
