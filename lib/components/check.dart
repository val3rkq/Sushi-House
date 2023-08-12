import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:japanese_restaurant_app/services/format_name.dart';
import 'package:japanese_restaurant_app/theme/colors.dart';

class Check extends StatelessWidget {
  const Check({
    super.key,
    required this.data,
    required this.onDeleteTap,
  });

  final Map<String, dynamic> data;
  final Function(BuildContext) onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: onDeleteTap,
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              icon: Icons.delete_rounded,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(right: 15),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              formatName(data['name']).toString().toUpperCase(),
                              style: GoogleFonts.zenAntique(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            data['type'].toString().toUpperCase(),
                            style: GoogleFonts.zenAntique(
                              fontSize: 17,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/img/${data['type']}/${data['name']}.png',
                        height: 100,
                        width: 110,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // date & time
                          Text(
                            data['dateTime'],
                            style: GoogleFonts.zenAntique(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.end,
                          ),

                          // dish price
                          Text(
                            'Price: \$ ${data['price']}0',
                            style: GoogleFonts.zenAntique(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),

                          // dish count
                          Text(
                            'Count: ${data['count']}',
                            style: GoogleFonts.zenAntique(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      // total
                      Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'Total: \$ ${(data['count'] * data['price']).toStringAsFixed(2)}',
                            style: GoogleFonts.zenAntique(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
