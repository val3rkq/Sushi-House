import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:japanese_restaurant_app/components/all.dart';
import 'package:japanese_restaurant_app/database/db.dart';
import 'package:japanese_restaurant_app/theme/colors.dart';

class LikedFoodPage extends StatelessWidget {
  LikedFoodPage({super.key});

  DB db = DB();
  Map likedFood = {
    'nigiri': [],
    'maki': [],
    'other': [],
  };

  void getLikedFood() {
    for (var i in db.typesOfDishes.keys) {
      for (int ind = 0; ind < db.typesOfDishes[i].length; ind++) {
        if (db.typesOfDishes[i][ind][1] == true) {
          String type = i;
          if (i == 'popular') {
            type = 'other';
          }
          likedFood[type].add(db.typesOfDishes[i][ind]);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    db.getData();
    getLikedFood();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Liked Food'.toUpperCase(),
          style: GoogleFonts.zenAntique(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: secondColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Background(),
        ],
      ),
    );
  }
}
