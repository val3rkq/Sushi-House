import 'package:flutter/material.dart';
import 'package:japanese_restaurant_app/theme/text_styles.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Center(
        child: Text(
          '日本食',
          style: backgroundJapaneseTextStyle,
        ),
      ),
    );
  }
}
