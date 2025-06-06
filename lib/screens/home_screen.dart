// lib/home_screen.dart

import 'package:flutter/material.dart';
import 'downloads_screen.dart';
import 'services_screen.dart';

/// מסך הבית – Back = התנתקות (חזרה ל-'/')
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          automaticallyImplyLeading: false, // הסרה של כפתור חזרה אוטומטי
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/', // חזרה ל־WelcomeScreen
                  (route) => false,
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: NetworkImage(
                  'https://cdni.iconscout.com/illustration/premium/thumb/sign-up-illustration-download-in-svg-png-gif-file-formats--new-user-registering-log-register-form-maggy-pack-design-development-illustrations-4097209.png',
                ),
                height: 100,
              ),
              const SizedBox(height: 60),
              const Text(
                'You have successfully logged in!',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // --- Downloads button ---
              SizedBox(
                width: 180,
                height: 48,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.download),
                  label: const Text('Downloads'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, DownloadsScreen.routeName);
                  },
                ),
              ),

              const SizedBox(height: 20), // ריווח בין הכפתורים

              // --- Services button ---
              SizedBox(
                width: 180,
                height: 48,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.miscellaneous_services),
                  label: const Text('Services'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, ServicesScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
