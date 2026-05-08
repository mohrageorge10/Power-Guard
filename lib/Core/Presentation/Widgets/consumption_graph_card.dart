import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';

class ConsumptionGraphCard extends StatelessWidget {
  final String value;
  final String trend;
  final bool trendPositive;
  final List<double>? points;

  const ConsumptionGraphCard({
    super.key,
    required this.value,
    required this.trend,
    this.trendPositive = true,
    this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.lightBg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.white, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.hourlyPulseTitle,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 15.5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppStrings.hourlyPulseTime,
                      style: TextStyle(
                        color: AppColors.textSubTitleColor.withAlpha(120),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: value.split(' ')[0],
                            style: const TextStyle(
                              color: Color(0xFF9EA3AE),
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const TextSpan(
                            text: ' kWh',
                            style: TextStyle(
                              color: Color(0xFF9EA3AE),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      trend,
                      style: const TextStyle(
                        color: Color(0xFF23E38E),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(8, 12, 12, 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF9DA5FF).withAlpha(30),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color(0xFF9DA5FF).withAlpha(50),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(9, (index) {
                          return Text(
                            "${900 - (index * 100)}",
                            style: TextStyle(
                              color: AppColors.pureBlack.withAlpha(180),
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: ClipRRect(
                        child: CustomPaint(
                          size: Size.infinite,
                          painter: _GraphPainter(
                            dataPoints:
                                points ??
                                [
                                  0.2,
                                  0.85,
                                  0.7,
                                  0.4,
                                  0.8,
                                  0.35,
                                  0.6,
                                  0.7,
                                  0.25,
                                  0.10,
                                  0.95,
                                  0.45,
                                  0.2,
                                  0.8,
                                ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(left: 39, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '00:00',
                    style: TextStyle(color: Color(0xFF9EA3AE), fontSize: 12),
                  ),
                  Text(
                    '06:00',
                    style: TextStyle(color: Color(0xFF9EA3AE), fontSize: 12),
                  ),
                  Text(
                    '12:00',
                    style: TextStyle(color: Color(0xFF9EA3AE), fontSize: 12),
                  ),
                  Text(
                    '18:00',
                    style: TextStyle(color: Color(0xFF9EA3AE), fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GraphPainter extends CustomPainter {
  final List<double> dataPoints;

  _GraphPainter({required this.dataPoints});

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = AppColors.blueGraph.withAlpha(40)
      ..strokeWidth = 0.8
      ..style = PaintingStyle.stroke;

    const int rows = 8;
    for (int i = 0; i <= rows; i++) {
      final double y = size.height - (i * (size.height / rows));
      _drawDashedLine(canvas, Offset(0, y), Offset(size.width, y), gridPaint);
    }

    if (dataPoints.isEmpty) {
      return;
    }

    final double xStep = size.width / (dataPoints.length - 1);
    final List<Offset> offsets = [];
    for (int i = 0; i < dataPoints.length; i++) {
      offsets.add(Offset(i * xStep, size.height * (1 - dataPoints[i])));
    }

    final path = Path()..moveTo(offsets[0].dx, offsets[0].dy);
    final fillPath = Path()
      ..moveTo(offsets[0].dx, size.height)
      ..lineTo(offsets[0].dx, offsets[0].dy);

    for (int i = 0; i < offsets.length - 1; i++) {
      final p1 = offsets[i];
      final p2 = offsets[i + 1];
      final controlX = p1.dx + (p2.dx - p1.dx) / 2;
      path.cubicTo(controlX, p1.dy, controlX, p2.dy, p2.dx, p2.dy);
      fillPath.cubicTo(controlX, p1.dy, controlX, p2.dy, p2.dx, p2.dy);
    }
    fillPath.lineTo(offsets.last.dx, size.height);
    fillPath.close();

    canvas.drawPath(
      fillPath,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.blueGraphBG.withAlpha(50),
            AppColors.blueGraphBG.withAlpha(0),
          ],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    canvas.drawPath(
      path,
      Paint()
        ..shader = LinearGradient(
          colors: [
            AppColors.blueGraphBG.withAlpha(180),
            AppColors.blueGraph.withAlpha(255),
          ],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
        ..strokeWidth = 2.5
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    const double dashWidth = 4;
    const double dashSpace = 4;
    double distance = 0;
    while (distance < (end.dx - start.dx)) {
      canvas.drawLine(
        Offset(start.dx + distance, start.dy),
        Offset(start.dx + distance + dashWidth, start.dy),
        paint,
      );
      distance += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant _GraphPainter oldDelegate) {
    return true;
  }
}
