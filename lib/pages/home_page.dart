import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:japanese_restaurant_app/components/all.dart';
import 'package:japanese_restaurant_app/constants.dart';
import 'package:japanese_restaurant_app/database/db.dart';
import 'package:japanese_restaurant_app/generated/l10n.dart';
import 'package:japanese_restaurant_app/pages/dish_page.dart';
import 'package:japanese_restaurant_app/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DB db = DB();
  var box = Hive.box(boxName);

  int selectedTypeIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (box.get('MENU') == null) {
      db.initData();
      db.updateDB();
    } else {
      db.getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    db.getData();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: primaryColor,
      appBar: AppBar(),
      endDrawer: const MyDrawer(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Background(),

          // content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),

                // advertising banner
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.asset(
                          'assets/img/sauces.png',
                          width: 150,
                          height: 160,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).get_promo.toUpperCase(),
                              style: GoogleFonts.zenAntique(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.35,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyButton(
                              isSpaceBetweenEnabled: false,
                              text: S.of(context).try_now,
                              color: white15,
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // types of dishes
                Container(
                  height: 50,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 15),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return DishTypeTile(
                        name: db.typesOfDishes.keys.toList()[index],
                        selectedIndex: selectedTypeIndex,
                        index: index,
                        onTap: () {
                          _scrollController.animateTo(
                            0.0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                          setState(() {
                            selectedTypeIndex = index;
                          });
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                // dishes
                Container(
                  height: 250,
                  alignment: Alignment.topLeft,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: db
                        .typesOfDishes[
                            db.typesOfDishes.keys.toList()[selectedTypeIndex]]
                        .length,
                    itemBuilder: (context, index) {
                      final String type =
                          db.typesOfDishes.keys.toList()[selectedTypeIndex];
                      final String name = db.typesOfDishes[type][index][0];
                      final bool isLiked = db.typesOfDishes[type][index][1];
                      final double grade = db.typesOfDishes[type][index][2];
                      final double price = double.parse(
                          db.typesOfDishes[type][index][3].toString());

                      return DishBox(
                        index: index,
                        lastIndex: db
                                .typesOfDishes[db.typesOfDishes.keys
                                    .toList()[selectedTypeIndex]]
                                .length -
                            1,
                        name: name,
                        type: type,
                        grade: grade,
                        price: price,
                        isLiked: isLiked,
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => DishPage(
                                isLiked: isLiked,
                                price: price,
                                type: type,
                                grade: grade,
                                name: name,
                                index: index,
                              ),
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        },
                        onLikeBtnTap: () {
                          setState(() {
                            db.typesOfDishes[type][index][1] =
                                !db.typesOfDishes[type][index][1];
                          });
                          db.updateDB();
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                // title
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  alignment: Alignment.topLeft,
                  child: Text(
                    S.of(context).popular_food,
                    style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                // most popular dish
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => DishPage(
                          type: 'popular',
                          name: db.typesOfDishes['popular'][0][0],
                          isLiked: db.typesOfDishes['popular'][0][1],
                          grade: db.typesOfDishes['popular'][0][2],
                          price: db.typesOfDishes['popular'][0][3],
                          index: 0,
                        ),
                      ),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 120,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/img/popular/squid.png'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // name
                            Text(
                              db.typesOfDishes['popular'][0][0].toUpperCase(),
                              style: GoogleFonts.zenAntique(
                                fontSize: 17,
                              ),
                            ),
                            // price
                            Row(
                              children: [
                                Text(
                                  '\$ ${db.typesOfDishes['popular'][0][3]}',
                                  style: GoogleFonts.zenAntique(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MyLikeBtn(
                                onTap: () {
                                  setState(() {
                                    db.typesOfDishes['popular'][0][1] =
                                        !db.typesOfDishes['popular'][0][1];
                                  });
                                  db.updateDB();
                                },
                                color: Colors.white,
                                isLiked: db.typesOfDishes['popular'][0][1],
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
                                    db.typesOfDishes['popular'][0][2]
                                        .toString(),
                                    style: GoogleFonts.zenAntique(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
