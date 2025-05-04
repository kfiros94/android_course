import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_phone_screen.dart'; // ← עדכון: שם הקובץ החדש
import 'screens/otp_verification_screen.dart';
import 'screens/downloads_screen.dart';   // ← הוסף
import 'screens/services_screen.dart'; 


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
        '/loginPhone': (_) => const LoginPhoneScreen(), // ← נתיב חדש
        '/verifyOtp': (_) => const OtpVerificationScreen(phoneNumber: ''), // placeholder
        '/downloads': (_) => const DownloadsScreen(), // ← חדש
        '/services': (_) => const ServicesScreen(),   // או: ServicesScreen.routeName
      },
    );
  }
}
