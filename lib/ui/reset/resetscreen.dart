import 'package:bitcoin/ui/reset/otpscreen.dart';
import 'package:bitcoin/ui/signup.dart';
import 'package:bitcoin/utils/backgroundpaint.dart';
import 'package:flutter/material.dart';

class ResetScreenView extends StatefulWidget {
  const ResetScreenView({super.key});

  @override
  State<ResetScreenView> createState() => _ResetScreenViewState();
}

class _ResetScreenViewState extends State<ResetScreenView> {
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
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 70),
                      Image.asset('assets/images/logo.png',
                          width: 300, height: 300),
                      const SizedBox(height: 20),
                      const Text(
                        'OTP Authentication',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'An authentication code will be sent to\n(+88) 0123 456 XXXX',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          // Navigating to another screen
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const OtpScreen(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Get OTP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have an account? ',
                      style: TextStyle(color: Colors.white),
                    ),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
