import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:japanese_restaurant_app/components/all.dart';
import 'package:japanese_restaurant_app/database/db.dart';
import 'package:japanese_restaurant_app/generated/l10n.dart';
import 'package:japanese_restaurant_app/model/check_model.dart';
import 'package:japanese_restaurant_app/services/format_name.dart';
import 'package:japanese_restaurant_app/theme/colors.dart';
import 'package:intl/intl.dart';

class DishPage extends StatefulWidget {
  const DishPage({
    super.key,
    required this.isLiked,
    required this.price,
    required this.type,
    required this.grade,
    required this.name,
    required this.index,
  });

  final bool isLiked;
  final double price;
  final double grade;
  final String name;
  final String type;
  final int index;

  @override
  State<DishPage> createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  int count = 0;

  void decrementCount() {
    if (count > 0) {
      setState(() {
        count -= 1;
      });
    }
  }

  void incrementCount() {
    setState(() {
      count += 1;
    });
  }

  DB db = DB();

  late bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    db.getData();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: secondColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_rounded),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: MyLikeBtn(
              onTap: () {
                setState(() {
                  db.typesOfDishes[widget.type][widget.index][1] =
                      !db.typesOfDishes[widget.type][widget.index][1];
                });
                db.updateDB();
              },
              isLiked: db.typesOfDishes[widget.type][widget.index][1],
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Background(),

          // content
          Column(
            children: [
              // dish content
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25, 75, 25, 25),
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          child: Image.asset(
                            'assets/img/${widget.type}/${widget.name}.png',
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      formatName(widget.name).toUpperCase(),
                                      style: GoogleFonts.zenAntique(
                                        fontSize: 35,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: secondColor2,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    '試\nす',
                                    style: GoogleFonts.zenAntique(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      height: 1.35,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '\$ ${widget.price}',
                                style: GoogleFonts.zenAntique(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                              Row(
                                children: [
                                  const Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        color: Colors.black,
                                        size: 50,
                                      ),
                                      Icon(
                                        Icons.star_rounded,
                                        color: Colors.yellow,
                                        size: 40,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    widget.grade.toString(),
                                    style: GoogleFonts.zenAntique(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
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
              ),

              // buy content
              Expanded(
                flex: 1,
                child: Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // how much money?
                            SizedBox(
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  '\$ ${(count * widget.price).toStringAsFixed(2)} ',
                                  style: GoogleFonts.zenAntique(
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            // counter
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: decrementCount,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white24,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(15),
                                    child: const Icon(
                                      Icons.remove_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  width: 50,
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        count.toString(),
                                        style: GoogleFonts.zenAntique(
                                          fontSize: 35,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: incrementCount,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white24,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(15),
                                    child: const Icon(
                                      Icons.add_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        MyButton(
                          text: S.of(context).buy_now,
                          onTap: () {
                            if (count != 0) {
                              // add check in history
                              db.historyOfOrders.insert(
                                0,
                                CheckModel(
                                  count: count,
                                  dateTime: DateFormat('yyyy-MM-dd kk:mm').format(DateTime.now()),
                                  name: widget.name,
                                  type: widget.type,
                                  price: widget.price,
                                  grade: widget.grade,
                                ).toMap(),
                              );

                              // show snackbar
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.white,
                                  content: Text(
                                    'Your order is accepted',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );

                              // reset counter
                              setState(() {
                                count = 0;
                              });
                            }
                          },
                          color: white15,
                          isSpaceBetweenEnabled: true,
                        )
                      ],
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
