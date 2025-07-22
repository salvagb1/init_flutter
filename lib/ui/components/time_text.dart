import 'package:flutter/material.dart';

class TimeText extends StatelessWidget {
  const TimeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '6am - 8am',
            style: TextStyle(fontSize: 10, color: Color(0xff7B6F72)),
          ),
          Text(
            '600ml',
            style: TextStyle(fontSize: 10, color: Color(0xffC58BF2)),
          ),
        ],
      ),
    );
  }
}
