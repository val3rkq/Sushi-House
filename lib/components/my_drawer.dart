import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:japanese_restaurant_app/generated/l10n.dart';
import 'package:japanese_restaurant_app/pages/history_of_orders_page.dart';
import 'package:japanese_restaurant_app/theme/colors.dart';

import 'background.dart';
import 'drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryColor,
      child: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Background(),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'SUSHI HOUSE',
                        style: GoogleFonts.zenAntique(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: Image.asset('assets/img/sushi.png'),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 15,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Divider(
                      color: Colors.white,
                      height: 1,
                    ),
                  ),
                ),

                // history of orders
                DrawerTile(
                  text: S.of(context).history_of_orders,
                  icon: Icons.history_rounded,
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const HistoryOfOrdersPage(),
                      ),
                    );
                  },
                ),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset(
                      'assets/img/foods.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
