import 'dart:math';

import 'package:flightui/utils/constants.dart';
import 'package:flutter/material.dart';

class TicketShape extends StatelessWidget {
  const TicketShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ClipPath(
        clipper: MyCustomClipper(),
        child: CustomPaint(
          painter: MyCustomPainter(),
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    // Semi-circle on the left side
    double radiusLeft = size.height / 12; // adjust the radius as needed
    path.addArc(
      Rect.fromCircle(center: Offset(0, size.height / 1.5), radius: radiusLeft),
      -pi / 2, // Start angle
      pi, // Sweep angle
    );

    // Semi-circle on the right side
    double radiusRight = size.height / 12; // adjust the radius as needed
    path.addArc(
      Rect.fromCircle(
          center: Offset(size.width, size.height / 1.5), radius: radiusRight),
      pi / 2, // Start angle
      pi, // Sweep angle
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.secondaryColor;
    Paint borderPaint = Paint()
      ..color = AppColors.borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    double radius = size.height / 12;
    double semiCircleCenterY = size.height / 1.5;

    // Draw the main rectangle
    Rect mainRect = Rect.fromLTWH(0, 0, size.width, size.height);
    RRect mainRRect = RRect.fromRectAndCorners(
      mainRect,
      topLeft: const Radius.circular(20),
      topRight: const Radius.circular(20),
      bottomLeft: const Radius.circular(20),
      bottomRight: const Radius.circular(20),
    );
    canvas.drawRRect(mainRRect, paint);

    Path dashedLinePath = Path();
    dashedLinePath.moveTo(0, semiCircleCenterY);
    double dashWidth = 3;
    double dashSpace = 5;
    double currentX = 0;
    while (currentX < size.width) {
      dashedLinePath.lineTo(currentX + dashWidth, semiCircleCenterY);
      currentX += dashWidth + dashSpace;
      dashedLinePath.moveTo(currentX, semiCircleCenterY);
    }
    Paint dashedBorderPaint = Paint()
      ..color = AppColors.borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.square;
    canvas.drawPath(dashedLinePath, dashedBorderPaint);

    // Draw the left semi-circle
    Path leftSemiCirclePath = Path()
      ..addArc(
        Rect.fromCircle(center: Offset(0, semiCircleCenterY), radius: radius),
        -pi / 2,
        pi,
      );
    canvas.drawPath(leftSemiCirclePath, paint);
    canvas.drawPath(leftSemiCirclePath, borderPaint);

    // Draw the right semi-circle
    Path rightSemiCirclePath = Path()
      ..addArc(
        Rect.fromCircle(
          center: Offset(size.width, semiCircleCenterY),
          radius: radius,
        ),
        pi / 2,
        pi,
      );
    canvas.drawPath(rightSemiCirclePath, paint);
    canvas.drawPath(rightSemiCirclePath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
