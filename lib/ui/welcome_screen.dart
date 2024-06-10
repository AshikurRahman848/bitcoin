import 'package:bitcoin/common/rounder_button.dart';
import 'package:bitcoin/ui/login.dart';
import 'package:bitcoin/ui/signup.dart';
import 'package:bitcoin/utils/backgroundpaint.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
          Padding(
            padding: const EdgeInsets.only(
                top: 200.0), // Adjust top padding as needed
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/welcome.png',
                          height: 200,
                          width: 200,
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Welcome to Bitcoin Canvas',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Track, Visualize, Learn Bitcoin. It\'s That Easy',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 150),
                  // Spacer to push buttons to the bottom
                  // const Spacer(),
                  RoundedButton(
                    title: 'Create an Account',
                    onPressed: () {
                      // Navigating to another screen
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Signinview(),
                      ));
                    },
                    isPrimary: true,
                  ),
                  const SizedBox(height: 16),
                  RoundedButton(
                    title: 'Log In',
                    onPressed: () {
                      // Navigating to another screen
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ));
                    },
                    isPrimary: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
