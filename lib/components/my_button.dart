import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
    required this.isSpaceBetweenEnabled
  });

  final bool isSpaceBetweenEnabled;
  final String text;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: isSpaceBetweenEnabled ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 20,
            ),
            const Icon(
              Icons.arrow_circle_right,
              size: 25,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
