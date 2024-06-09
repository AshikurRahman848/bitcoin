import 'package:flutter/material.dart';

enum BorderSideType { top, bottom, left, right }

class CustomGradientBorder extends StatelessWidget {
  final Widget child;
  final Gradient? gradient;
  final double? borderWidth;
  final Color? borderColor;
  final Set<BorderSideType> borderSideTypes;
  final BorderRadius? borderRadius;

  CustomGradientBorder({
    required this.child,
    this.gradient,
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
    this.borderSideTypes = const {
      BorderSideType.top,
      BorderSideType.bottom,
      BorderSideType.left,
      BorderSideType.right
    },
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(borderRadius ?? 0),
        borderRadius: borderRadius,
        border: Border(
          top: borderSideTypes.contains(BorderSideType.top)
              ? BorderSide(color: borderColor ?? Colors.transparent, width: borderWidth ?? 0)
              : BorderSide.none,
          bottom: borderSideTypes.contains(BorderSideType.bottom)
              ? BorderSide(color: borderColor ?? Colors.transparent, width: borderWidth ?? 0)
              : BorderSide.none,
          left: borderSideTypes.contains(BorderSideType.left)
              ? BorderSide(color: borderColor ?? Colors.transparent, width: borderWidth ?? 0)
              : BorderSide.none,
          right: borderSideTypes.contains(BorderSideType.right)
              ? BorderSide(color: borderColor ?? Colors.transparent, width: borderWidth ?? 0)
              : BorderSide.none,
        ),
        gradient: gradient,
      ),
      child: child,
    );
  }
}
 
//
//import 'package:bitcoin/utils/border_paint.dart';
// import 'package:flutter/material.dart';

// class GradientBorder extends StatelessWidget {
//   final Widget child;
//   final Gradient gradient;
//   final double borderWidth;
//   final BorderRadius borderRadius;
//   final bool topBorder;
//   final bool bottomBorder;
//   final bool leftBorder;
//   final bool rightBorder;

//   const GradientBorder({super.key, 
//     required this.child,
//     required this.gradient,
//     this.borderWidth = 1.0,
//     this.borderRadius = BorderRadius.zero,
//     this.topBorder = true,
//     this.bottomBorder = true,
//     this.leftBorder = true,
//     this.rightBorder = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: BorderPainter(
//         gradient: gradient,
//         borderWidth: borderWidth,
//         borderRadius: borderRadius,
//         topBorder: topBorder,
//         bottomBorder: bottomBorder,
//         leftBorder: leftBorder,
//         rightBorder: rightBorder,
//       ),
//       child: child,
//     );
//   }
// }