import 'package:flutter/material.dart';

class CustomInfoButton extends StatelessWidget {
  final String value;
  final String label;
  final VoidCallback? onPressed;

  const CustomInfoButton({
    super.key,
    required this.value,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded( // Para que se repartan el espacio en el Row
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          elevation: MaterialStateProperty.all(3),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 20)),
        ),
        onPressed: onPressed ?? () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Color(0xff92A3FD),
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xff7B6F72),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
