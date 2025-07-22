import 'package:flutter/material.dart';

class CardSmall extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const CardSmall({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffF7F8F8),
            blurRadius: 10.0,
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xff92A3FD),
            ),
          ),
          Center(
            child: Image.asset(
              image,
              width: 120,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
