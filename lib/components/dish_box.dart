import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:japanese_restaurant_app/services/format_name.dart';

import 'like_button.dart';

class DishBox extends StatelessWidget {
  const DishBox({
    super.key,
    required this.index,
    required this.lastIndex,
    required this.name,
    required this.type,
    required this.price,
    required this.grade,
    required this.isLiked,
    required this.onTap,
    required this.onLikeBtnTap,
  });

  final String name;
  final String type;
  final int index;
  final int lastIndex;
  final double price;
  final double grade;
  final bool isLiked;
  final Function() onTap;
  final Function() onLikeBtnTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white24,
        ),
        width: 220,
        padding: const EdgeInsets.all(20),
        margin: EdgeInsets.only(left: 15, right: lastIndex == index ? 15 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    height: 130,
                    width: 140,
                    'assets/img/$type/$name.png',
                    fit: BoxFit.contain,
                  ),
                  MyLikeBtn(
                    isLiked: isLiked,
                    onTap: onLikeBtnTap,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    formatName(name).toUpperCase(),
                    style: GoogleFonts.zenAntique(
                      fontSize: 17,
                    ),
                    softWrap: false,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Text(
                      '\$ $price',
                      style: GoogleFonts.zenAntique(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          grade.toString(),
                          style: GoogleFonts.zenAntique(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
