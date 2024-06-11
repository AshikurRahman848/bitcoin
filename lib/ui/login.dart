import 'package:bitcoin/ui/reset/resetscreen.dart';
import 'package:bitcoin/ui/signup.dart';
import 'package:bitcoin/utils/backgroundpaint.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isPasswordVisible = false;

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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Image.asset('assets/images/logo.png',
                      width: 300, height: 300),
                  const SizedBox(height: 20),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      iconColor: Colors.white,
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'Email',
                      hintStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Navigating to another screen
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ResetScreenView(),
                        ));
                      },
                      child: const Text('Forgot Password?'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Sign-in logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Or by social accounts',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.facebook,
                            color: Colors.blue, size: 40),
                        onPressed: () {
                          // Facebook login logic here
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.markunread_outlined,
                            color: Colors.red, size: 40),
                        onPressed: () {
                          // Google login logic here
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.apple_sharp,
                            color: Colors.black, size: 40),
                        onPressed: () {
                          // Apple login logic here
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don’t have an account? ',
                          style: TextStyle(color: Colors.white)),
                      GestureDetector(
                        onTap: () {
                          // Navigating to another screen
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Signinview(),
                          ));
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
