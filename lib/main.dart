// main.dart
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_phone_screen.dart';
import 'screens/otp_verification_screen.dart';
import 'screens/downloads_screen.dart';
import 'screens/services_screen.dart';
import 'screens/dashboard_screen.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Separated Screens Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const WelcomeScreen(),
        '/login': (_) => const LoginScreen(),
        '/signup': (_) => const SignupScreen(),
        '/home': (_) => const HomeScreen(),
        '/loginPhone': (_) => const LoginPhoneScreen(),
        '/verifyOtp': (_) => const OtpVerificationScreen(phoneNumber: ''),
        '/downloads': (_) => const DownloadsScreen(),
        '/services': (_) => const ServicesScreen(),
        // /dashboard is handled in onGenerateRoute because it needs an argument
      },
      // build DashboardScreen with the selected service name
      onGenerateRoute: (settings) {
        if (settings.name == '/dashboard') {
          final serviceName = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => DashboardScreen(serviceName: serviceName),
          );
        }
        return null; // unknown route
      },
    );
  }
}
