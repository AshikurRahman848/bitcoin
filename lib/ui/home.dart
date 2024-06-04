import 'package:flutter/material.dart';
import 'dart:ui';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  // Define positions for the circles
  // Modify these values to change the positions of the circles
  final double circle1Top = 50;
  final double circle1Left = 50;
  final double circle1Size = 50;

  final double circle2Top = 150;
  final double circle2Left = 150;
  final double circle2Size = 70;

  final double circle3Top = 250;
  final double circle3Left = 250;
  final double circle3Size = 90;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080319),
      body: Stack(
        children: [
          // Circles
          Positioned(
            top: circle1Top,
            left: circle1Left,
            child: Container(
              width: circle1Size,
              height: circle1Size,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: circle2Top,
            left: circle2Left,
            child: Container(
              width: circle2Size,
              height: circle2Size,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: circle3Top,
            left: circle3Left,
            child: Container(
              width: circle3Size,
              height: circle3Size,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Blur layer
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
              child: Container(
                color:
                    Colors.black.withOpacity(0.1), // Adjust opacity if needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Homeview(),
  ));
}
