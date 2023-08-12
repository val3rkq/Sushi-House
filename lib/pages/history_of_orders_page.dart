import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:japanese_restaurant_app/components/all.dart';
import 'package:japanese_restaurant_app/database/db.dart';
import 'package:japanese_restaurant_app/generated/l10n.dart';
import 'package:japanese_restaurant_app/theme/colors.dart';
import 'package:lottie/lottie.dart';

class HistoryOfOrdersPage extends StatefulWidget {
  const HistoryOfOrdersPage({super.key});

  @override
  State<HistoryOfOrdersPage> createState() => _HistoryOfOrdersPageState();
}

class _HistoryOfOrdersPageState extends State<HistoryOfOrdersPage> {
  DB db = DB();

  @override
  Widget build(BuildContext context) {
    db.getData();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).history_of_orders.toUpperCase(),
          style: GoogleFonts.zenAntique(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: secondColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Background(),
          db.historyOfOrders.isNotEmpty
              ? SlidableAutoCloseBehavior(
                  child: ListView.builder(
                    itemCount: db.historyOfOrders.length,
                    itemBuilder: (context, index) {
                      return Check(
                        data: db.historyOfOrders[index],
                        onDeleteTap: (context) {
                          setState(() {
                            db.historyOfOrders.removeAt(index);
                            db.updateDB();
                          });
                        },
                      );
                    },
                  ),
                )
              : Lottie.asset(
                  'assets/lottie/food_sticks.json',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
        ],
      ),
      floatingActionButton: db.historyOfOrders.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      alignment: Alignment.center,
                      child: Container(
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).are_you_sure.toUpperCase(),
                              style: GoogleFonts.zenAntique(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DialogBtn(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  text: S.of(context).no,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                DialogBtn(
                                  onTap: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      db.historyOfOrders = [];
                                      db.updateDB();
                                    });
                                  },
                                  text: S.of(context).yes,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              backgroundColor: primaryColor,
              child: const Icon(Icons.delete_forever_rounded),
            )
          : const SizedBox(),
    );
  }
}
