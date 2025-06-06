// settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // dummy local states – nothing is saved anywhere
  bool _darkMode = false;
  bool _notifications = true;
  bool _location = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // nice gradient AppBar
      appBar: AppBar(
        title: const Text('Settings'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2193b0), Color(0xFF6dd5ed)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      // soft background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFDFBFB), Color(0xFFE2D1C3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            // headline
            Text(
              'Personalize your experience',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // card that wraps the three toggles
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Dark mode'),
                    subtitle: const Text('Switch between dark & light theme'),
                    value: _darkMode,
                    onChanged: (val) => setState(() => _darkMode = val),
                    secondary: const Icon(Icons.dark_mode),
                  ),
                  const Divider(height: 0),
                  SwitchListTile(
                    title: const Text('Push notifications'),
                    subtitle: const Text('Receive alerts & updates'),
                    value: _notifications,
                    onChanged: (val) =>
                        setState(() => _notifications = val),
                    secondary: const Icon(Icons.notifications_active),
                  ),
                  const Divider(height: 0),
                  SwitchListTile(
                    title: const Text('Location access'),
                    subtitle: const Text('Allow app to use location'),
                    value: _location,
                    onChanged: (val) => setState(() => _location = val),
                    secondary: const Icon(Icons.location_on),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
