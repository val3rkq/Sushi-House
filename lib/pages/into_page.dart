import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:japanese_restaurant_app/components/all.dart';
import 'package:japanese_restaurant_app/generated/l10n.dart';
import 'package:japanese_restaurant_app/theme/colors.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // background text - JAPANESE FOOD
          const Background(),

          Padding(
            padding: const EdgeInsets.only(bottom: 200, left: 25),
            child: Image.asset(
              'assets/img/main.png',
              fit: BoxFit.cover,
            ),
          ),

          // content
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 50, 25, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SUSHI HOUSE',
                  style: GoogleFonts.kaiseiTokumin(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: white15,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '寿\n司\n屋',
                      style: GoogleFonts.zenAntique(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.35,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      S.of(context).the_taste_of_japanese_food.toUpperCase(),
                      style: GoogleFonts.kaiseiTokumin(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        S.of(context).feel_the_taste_text,
                        style: GoogleFonts.ubuntu(
                          color: secondColor2,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MyButton(
                      isSpaceBetweenEnabled: true,
                      text: S.of(context).get_started,
                      color: white15,
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
