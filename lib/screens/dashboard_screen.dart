// lib/dashboard_screen.dart

import 'package:flutter/material.dart';
import 'profile.dart';         // existing import
import 'settings_screen.dart'; // existing import

class DashboardScreen extends StatelessWidget {
  final String serviceName;

  const DashboardScreen({super.key, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    // ① Define desired button width, height, and font size here:
    const double buttonWidth = 114;
    const double buttonHeight = 48;
    const double buttonFontSize = 12; // ← controls the label’s font size

    // ② Common style for all bottom buttons, now with fixedSize + textStyle:
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      fixedSize: const Size(buttonWidth, buttonHeight),
      shape: const StadiumBorder(),

      // Global textStyle for the label inside each ElevatedButton.icon:
      textStyle: const TextStyle(
        fontSize: buttonFontSize,
        fontWeight: FontWeight.w600,
      ),

      // Background color (change as needed)
      backgroundColor: const Color.fromARGB(255, 180, 178, 180),
    );

    return Scaffold(
      // 1) AppBar with a back‐arrow on the top‐left
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Dashboard'),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),

            // --- Welcome text
            Text(
              'Welcome to $serviceName',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            // --- All three buttons in one row, each using buttonStyle:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Settings button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SettingsScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.settings),
                  label: const Text('Settings'),
                  style: buttonStyle,
                ),

                const SizedBox(width: 10),

                // Profile button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ProfileScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.person),
                  label: const Text('Profile'),
                  style: buttonStyle,
                ),

                const SizedBox(width: 10),

                // Home button (navigates to '/home')
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/home'));
                  },
                  icon: const Icon(Icons.home),
                  label: const Text('Home'),
                  style: buttonStyle,
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
  