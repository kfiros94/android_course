import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _isHidden = true;

  void _toggleVisibility() => setState(() => _isHidden = !_isHidden);

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_email == 't@t.com' && _password == 'p1!') {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        showDialog(
          context: context,
          builder:
              (_) => AlertDialog(
                title: const Text('Login Failed'),
                content: const Text('Invalid email or password.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login With Email')),
      backgroundColor: Colors.white, // Added to match HomeScreen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/login.png', height: 180),

            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Please enter email';
                        final re = RegExp(r'^[\w.%+-]+@[\w.-]+\.[A-Za-z]{2,}$');
                        return re.hasMatch(v)
                            ? null
                            : 'Enter a valid email address';
                      },
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
                          return 'Password must include:\n- At least 1 letter\n- At least 1 number\n- At least 1 special symbol';
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
                        'Login',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/signup'),
                      child: const Text('Don’t have an account? Sign up'),
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
