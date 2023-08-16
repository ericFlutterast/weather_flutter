import 'package:flutter/material.dart';
import 'degrees.dart';

class HourForecastItem extends StatelessWidget {
  final String hour;
  final Widget icon;
  final dynamic temp;

  const HourForecastItem({
    super.key,
    required this.hour,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          hour,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        icon,
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '$temp',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 2),
            if (temp is int) ...[
              CustomPaint(
                painter: DegreesCircle(color: Colors.white, size: 5, width: 2, offset: const Offset(0, 0)),
                size: const Size(0, 13),
              ),
            ]
          ],
        )
      ],
    );
  }
}
