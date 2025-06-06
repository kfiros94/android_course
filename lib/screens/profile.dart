// profile.dart
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // avatar + name
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/pinguin.jpg'), // add file to assets
            ),
            const SizedBox(height: 16),
            Text(
              'Pinguin', // display name
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),

            // content / contact details
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('user@email.com'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('+972-50-000-0000'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // dummy buttons for LinkedIn & GitHub
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // dummy action
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('LinkedIn link coming soon')),
                    );
                  },
                  icon: const Icon(Icons.work),
                  label: const Text('LinkedIn'),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    // dummy action
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('GitHub link coming soon')),
                    );
                  },
                  icon: const Icon(Icons.code),
                  label: const Text('GitHub'),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // additional info – placeholder
            Text(
              'Additional information goes here. '
              'You can replace this text with any bio or details you like.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
