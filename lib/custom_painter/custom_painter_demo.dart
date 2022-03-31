import 'dart:math';
import 'dart:ui';

import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class CustomPainterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: CustomPaint(
            size: Size(300, 300),
            painter: DemoCustomPainter(100),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "2:45",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MARGIN_XLARGE,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: MARGIN_SMALL),
              Text(
                "pm",
                style: TextStyle(
                  color: WHITE_SECONDARY,
                  fontSize: MARGIN_MEDIUM_3,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 50,
          left: 25,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: SECONDARY_COLOR,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
            ),
            child: Image.asset(
              "assets/tooth.png",
              scale: 2,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: SECONDARY_COLOR,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
            ),
            child: Image.asset(
              "assets/tooth_brush.png",
              scale: 2,
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: 25,
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: SECONDARY_COLOR,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(0, 2),
                  spreadRadius: 2.0,
                  blurRadius: 2.0,
                ),
              ],
            ),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    "assets/syringe.png",
                    scale: 2,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: Colors.white,
                    size: 23,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class DemoCustomPainter extends CustomPainter {
  final double radius;

  DemoCustomPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 18.0
      ..color = SECONDARY_COLOR
      ..style = PaintingStyle.fill;

    var paint2 = Paint()
      ..strokeWidth = 4.0
      ..color = Color.fromRGBO(36, 102, 194, 1.0)
      ..style = PaintingStyle.fill;

    var paint3 = Paint()
      ..strokeWidth = 4.0
      ..color = PRIMARY_COLOR
      ..style = PaintingStyle.fill;

    var whiteLinePaint = Paint()
    ..strokeWidth = 4.0
    ..color = Colors.white
    ..style = PaintingStyle.fill;

    // var whitePointPaint = Paint()
    //   ..strokeWidth = 4.0
    //   ..color = Colors.white
    //   ..style = PaintingStyle.fill
    //   ..strokeCap = StrokeCap.round;

    // int count = 20;
    // double innerRadius = 100;
    // List<Offset> innerPoints = [];
    // double offset = 15 * pi / 180;
    // // double offset = 400;
    // for (int i = 0; i < count; i++) {
    //   double perRad = 2 * pi / count * i;
    //   innerPoints.add(Offset(
    //     innerRadius * cos(perRad + offset),
    //     innerRadius * sin(perRad + offset),
    //   ));
    // }

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final Paint newPaint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round;
    final double filledCircleRadius = 2;
    final int numberOfDots = 20;
    final double radiantStep = 2 * pi / numberOfDots;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 150, paint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 130, paint2);
    // canvas.drawPoints(PointMode.points, innerPoints, whitePointPaint);
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 100, paint2);
    for (int i = 0; i < numberOfDots; i++) {
      canvas.drawCircle(
        Offset(centerX + sin(i * radiantStep) * radius,
            centerY + cos(i * radiantStep) * radius),
        filledCircleRadius,
        newPaint,
      );
    }
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 80, paint3);
    canvas.drawLine(Offset(centerX + 100, centerY), Offset(centerX + 160, centerY), whiteLinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
