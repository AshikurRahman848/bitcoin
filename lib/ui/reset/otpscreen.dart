import 'package:bitcoin/ui/reset/newpassword.dart';
import 'package:bitcoin/utils/backgroundpaint.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin/ui/signup.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController pinController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
            ),
            painter: BackgroundPainter(),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 70),
                Image.asset(
                  'assets/images/logo.png',
                  width: 250,
                  height: 250,
                ),
                const SizedBox(height: 10),
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
                  'An authentication code has been sent to\n(+88) 0123 456 XXXX',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 30),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                          controller: pinController,
                          focusNode: focusNode,
                          length: 4,
                          defaultPinTheme: defaultPinTheme,
                          autofocus: true,
                          onCompleted: (pin) {
                            debugPrint('onCompleted: $pin');
                            // Add your logic for completed pin input here
                          },
                          onChanged: (value) {
                            debugPrint('onChanged: $value');
                            // Add your logic for changed pin input here
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Validate the form and navigate to the New Password screen
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NewPasswordScreen(),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 200),
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
                          // Navigate to Sign Up screen
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
          ),
        ],
      ),
    );
  }
}
