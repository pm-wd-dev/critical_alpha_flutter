import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

class SpeedometerGauge extends StatelessWidget {
  final double value;
  final double maxValue;
  final String label;
  final double size;
  final Color? gaugeColor;
  final Color? backgroundColor;

  const SpeedometerGauge({
    super.key,
    required this.value,
    required this.maxValue,
    required this.label,
    this.size = 100,
    this.gaugeColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size * 0.65, // Semi-circle height
          child: CustomPaint(
            painter: SpeedometerPainter(
              value: value,
              maxValue: maxValue,
              gaugeColor: gaugeColor ?? AppColors.primary,
              backgroundColor: backgroundColor ?? Colors.grey[300]!,
            ),
            child: Container(),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontFamily: AppFonts.poppins,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class SpeedometerPainter extends CustomPainter {
  final double value;
  final double maxValue;
  final Color gaugeColor;
  final Color backgroundColor;

  SpeedometerPainter({
    required this.value,
    required this.maxValue,
    required this.gaugeColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = math.min(size.width / 2, size.height) * 0.9;

    // Draw background arc (semi-circle)
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.15
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCenter(center: center, width: radius * 2, height: radius * 2),
      math.pi,
      math.pi,
      false,
      backgroundPaint,
    );

    // Draw value arc
    final percentage = (value / maxValue).clamp(0.0, 1.0);
    final sweepAngle = math.pi * percentage;

    final valuePaint = Paint()
      ..color = gaugeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.15
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCenter(center: center, width: radius * 2, height: radius * 2),
      math.pi,
      sweepAngle,
      false,
      valuePaint,
    );

    // Draw needle/indicator
    final needleAngle = math.pi + sweepAngle;
    final needleLength = radius * 0.7;
    final needleEnd = Offset(
      center.dx + needleLength * math.cos(needleAngle),
      center.dy + needleLength * math.sin(needleAngle),
    );

    final needlePaint = Paint()
      ..color = gaugeColor
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(center, needleEnd, needlePaint);

    // Draw center circle
    final centerCirclePaint = Paint()
      ..color = gaugeColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius * 0.08, centerCirclePaint);

    // Draw inner white circle
    final innerCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius * 0.05, innerCirclePaint);
  }

  @override
  bool shouldRepaint(SpeedometerPainter oldDelegate) {
    return oldDelegate.value != value || oldDelegate.maxValue != maxValue;
  }
}

// Progress bar widget for categories
class CategoryProgressBar extends StatelessWidget {
  final String category;
  final double value;
  final double maxValue;
  final IconData icon;

  const CategoryProgressBar({
    super.key,
    required this.category,
    required this.value,
    required this.maxValue,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (value / maxValue).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 18,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.poppins,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Stack(
                  children: [
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: percentage,
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '${value.toStringAsFixed(0)}/${maxValue.toStringAsFixed(0)}',
            style: TextStyle(
              fontSize: 11,
              fontFamily: AppFonts.poppins,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}