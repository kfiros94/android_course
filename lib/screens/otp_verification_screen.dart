import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// מסך הזנת קוד‑SMS (OTP)
class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.phoneNumber});

  static const routeName = '/verifyOtp';

  /// מספר הטלפון שאליו נשלח הקוד (להצגה או ל‑re‑send)
  final String phoneNumber;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Verify Code', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Image.asset('assets/images/phone_login.png', height: 180),
            ),
            const SizedBox(height: 40),
            Text(
              'We have sent an SMS with a 6‑digit code to\n${widget.phoneNumber}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 32),

            // קלט הקוד
            TextField(
              controller: _otpController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 6,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                counterText: '',
                hintText: '••••••',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: אמת את הקוד עם Firebase Auth או שירות אחר

                  // אחרי אימות מוצלח – מעבר לדף הבית *עם* אפשרות חזרה
                  Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3F7DFB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Verify', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 16),

            TextButton(
              onPressed: () {
                // TODO: שלח קוד מחדש
              },
              child: const Text('Resend Code'),
            )
          ],
        ),
      ),
    );
  }
}
