import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Attenglish_Logo.png', height: 180),

            const SizedBox(height: 60),
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Please login or sign up',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // --- כפתור התחברות בדוא״ל ---
            OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side: const BorderSide(color: Colors.black),
              ),
              child: const Text(
                'Login With Email',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),

            const SizedBox(height: 12),

            // === כפתור התחברות בטלפון ===
            OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, '/loginPhone'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side: const BorderSide(color: Colors.black),
                backgroundColor: const Color(0xFFF1F5FF), // גוון רקע עדין
              ),
              child: const Text(
                'Login With Phone Number',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),

            const SizedBox(height: 16),

            // --- כפתור הרשמה ---
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size(200, 50),
                backgroundColor: const Color(0xFF3F7DFB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Sign up',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
