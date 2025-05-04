import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _isHidden = true;

  void _toggleVisibility() => setState(() => _isHidden = !_isHidden);

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: wire up your signup logic (e.g. call API)
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      backgroundColor: Colors.white, // Added to match HomeScreen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/signup.png', height: 100),

            const SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator:
                          (v) =>
                              (v == null ||
                                      !RegExp(
                                        r'^[\w.%+-]+@[\w.-]+\.[A-Za-z]{2,}$',
                                      ).hasMatch(v))
                                  ? 'Enter a valid email'
                                  : null,
                      onSaved: (v) => _email = v!,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isHidden ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: _toggleVisibility,
                        ),
                      ),
                      obscureText: _isHidden,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Please enter password';
                        }
                        final hasLetter = RegExp(r'[A-Za-z]').hasMatch(v);
                        final hasNumber = RegExp(r'\d').hasMatch(v);
                        final hasSymbol = RegExp(
                          r'[!@#$%^&*(),.?":{}|<>]',
                        ).hasMatch(v);
                        if (!hasLetter || !hasNumber || !hasSymbol) {
                          return 'Password must include letter, number & symbol';
                        }
                        return null;
                      },
                      onSaved: (v) => _password = v!,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        minimumSize: const Size(200, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Create Account',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
