import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool? isLoading;
  final bool isPrimary;

  const RoundedButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.isLoading = false,
      required this.isPrimary});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: isLoading! ? null : onPressed,
      child: Container(
        height: 48,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: isPrimary ? null : Border.all(color: Colors.blue),
            color: isPrimary ? Colors.blue : Colors.transparent),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
