import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// OTP verification screen with 6 separate boxes, like a PIN keypad
class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.phoneNumber});

  static const routeName = '/verifyOtp';

  final String phoneNumber;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _controllers = List.generate(6, (_) => TextEditingController());
  final _nodes = List.generate(6, (_) => FocusNode());

  /// combine the 6 single‑digit boxes into one string
  String get _otp => _controllers.map((c) => c.text).join();

  @override
  void dispose() {
    for (final c in _controllers) c.dispose();
    for (final n in _nodes) n.dispose();
    super.dispose();
  }

  /// builds one box – grey rounded background, single digit text field
  Widget _buildBox(int index) {
    return SizedBox(
      width: 48,
      child: TextField(
        controller: _controllers[index],
        focusNode: _nodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: const Color(0xFFF1F5FF), // light grey/blue like screenshot
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          // auto‑move focus forward/back
          if (value.isNotEmpty) {
            if (index < 5) {
              _nodes[index + 1].requestFocus();
            } else {
              _nodes[index].unfocus();
            }
          } else if (index > 0) {
            _nodes[index - 1].requestFocus();
          }
          setState(() {}); // refresh Verify btn enable state
        },
      ),
    );
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
            Center(child: Image.asset('assets/images/phone_login.png', height: 180)),
            const SizedBox(height: 40),
            Text(
              'We have sent an SMS with a 6‑digit code to\n${widget.phoneNumber}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 32),

            // --- six‑box OTP input ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, _buildBox),
            ),
            const SizedBox(height: 32),

            // --- Verify button ---
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _otp.length == 6 ? () {
                  // TODO: verify with Firebase Auth

                  Navigator.pushNamed(context, '/home');
                } : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3F7DFB),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text('Verify', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // TODO: resend code logic
              },
              child: const Text('Resend Code'),
            ),
          ],
        ),
      ),
    );
  }
}
