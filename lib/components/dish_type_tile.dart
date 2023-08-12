import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:japanese_restaurant_app/theme/colors.dart';

class DishTypeTile extends StatelessWidget {
  const DishTypeTile({
    super.key,
    required this.name,
    required this.selectedIndex,
    required this.index,
    required this.onTap,
  });

  final String name;
  final int selectedIndex;
  final int index;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: index == selectedIndex
              ? secondColor
              : Colors.white24,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Center(
          child: Row(
            children: [
              Text(
                name,
                style: GoogleFonts.ubuntu(
                  fontSize: 17,
                  letterSpacing: index != selectedIndex ? 0.9 : 1.05,
                  fontWeight: index != selectedIndex
                      ? FontWeight.w500
                      : FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                child: Image.asset('assets/img/$name.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
