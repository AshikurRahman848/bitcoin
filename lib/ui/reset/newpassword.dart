import 'package:flutter/material.dart';
import 'package:bitcoin/utils/backgroundpaint.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool _isObscured1 = true;
  bool _isObscured2 = true;
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
            painter: BackgroundPainter(),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Reset your password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'At least 8 characters, with uppercase and lowercase letters',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 32),
                    _buildPasswordField(
                      controller: _passwordController1,
                      hintText: 'New Password',
                      isObscured: _isObscured1,
                      toggleObscured: () {
                        setState(() {
                          _isObscured1 = !_isObscured1;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildPasswordField(
                      controller: _passwordController2,
                      hintText: 'Confirm Password',
                      isObscured: _isObscured2,
                      toggleObscured: () {
                        setState(() {
                          _isObscured2 = !_isObscured2;
                        });
                      },
                      validator: (value) {
                        if (value != _passwordController1.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle password reset
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.purpleAccent,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required bool isObscured,
    required VoidCallback toggleObscured,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isObscured,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white54),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isObscured ? Icons.visibility_off : Icons.visibility,
            color: Colors.white54,
          ),
          onPressed: toggleObscured,
        ),
      ),
      validator: validator,
    );
  }
}
