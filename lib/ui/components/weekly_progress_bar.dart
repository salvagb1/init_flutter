import 'package:flutter/material.dart';

class WeeklyProgressBar extends StatelessWidget {
  final String dayLabel;
  final double totalHeight;
  final double progressHeight;
  final Color progressColor;

  const WeeklyProgressBar({
    super.key,
    required this.dayLabel,
    required this.totalHeight,
    required this.progressHeight,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Contenedor principal de la barra
        Container(
          height: totalHeight,
          width: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xffF7F8F8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Parte que representa el progreso
              Container(
                height: progressHeight,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: progressColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(dayLabel),
      ],
    );
  }
}
