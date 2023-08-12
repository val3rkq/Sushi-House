import 'package:flutter/material.dart';

class MyLikeBtn extends StatelessWidget {
  const MyLikeBtn({
    super.key,
    required this.onTap,
    required this.isLiked,
    required this.color,
  });

  final Function() onTap;
  final bool isLiked;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
        color: color,
        size: 27,
      ),
    );
  }
}
