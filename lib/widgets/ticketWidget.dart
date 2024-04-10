import 'dart:math';

import 'package:flightui/utils/constants.dart';
import 'package:flightui/utils/textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';

class TicketShape extends StatelessWidget {
  const TicketShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ClipPath(
        clipper: MyCustomClipper(),
        child: CustomPaint(
          painter: MyCustomPainter(),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: ticketContent(),
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

class ticketContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var commonSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DXB",
                  style: appTextStyle(AppColors.blackColor,
                      commonSize.width * 0.05, FontWeight.w600),
                ),
                Text(
                  "Dubai",
                  style: appTextStyle(AppColors.TextColor2,
                      commonSize.width * 0.033, FontWeight.w500),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                children: [
                  Text(
                    "Flight Time",
                    style: appTextStyle(AppColors.TextColor2,
                        commonSize.width * 0.045, FontWeight.w600),
                  ),
                  Text(
                    "1H 30M",
                    style: appTextStyle(AppColors.blackColor,
                        commonSize.width * 0.035, FontWeight.w700),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "DEL",
                  style: appTextStyle(AppColors.blackColor,
                      commonSize.width * 0.05, FontWeight.w600),
                ),
                Text(
                  "Delhi",
                  style: appTextStyle(AppColors.TextColor2,
                      commonSize.width * 0.033, FontWeight.w500),
                )
              ],
            )
          ],
        ),
        Gap(commonSize.height * 0.015),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: commonSize.width * 0.02),
          child: Stack(
            children: [
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.33,
                  top: -2.5,
                  child: Icon(
                    Ionicons.airplane,
                    size: MediaQuery.of(context).size.width * 0.06,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "10:30 AM",
                    style: appTextStyle(AppColors.blackColor,
                        commonSize.width * 0.033, FontWeight.w600),
                  ),
                  const pointToPointWidget(),
                  Text(
                    "12:30 PM",
                    style: appTextStyle(AppColors.blackColor,
                        commonSize.width * 0.033, FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
        Gap(commonSize.height * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: commonSize.width * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Indigo Airlines",
                style: appTextStyle(AppColors.blackColor,
                    commonSize.width * 0.05, FontWeight.w600),
              ),
              Text(
                '\$199 ',
                style: appTextStyle(AppColors.blackColor,
                    commonSize.width * 0.04, FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class pointToPointWidget extends StatelessWidget {
  const pointToPointWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.015,
              width: MediaQuery.of(context).size.height * 0.02,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blackColor, width: 4),
                  shape: BoxShape.circle,
                  color: AppColors.secondaryColor),
            ),
            Expanded(
              child: CustomPaint(
                painter: DashedPainter(),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.015,
              width: MediaQuery.of(context).size.height * 0.02,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blackColor, width: 4),
                  shape: BoxShape.circle,
                  color: AppColors.secondaryColor),
            ),
          ],
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

class DashedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final double dashWidth = 5;
    final double dashSpace = 5;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
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
      print(currentX);
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
