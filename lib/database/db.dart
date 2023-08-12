import 'package:hive_flutter/hive_flutter.dart';
import 'package:japanese_restaurant_app/constants.dart';

class DB {
  final _box = Hive.box(boxName);
  late Map typesOfDishes;
  late List historyOfOrders;

  void initData() {
    typesOfDishes = {
      'nigiri': [
        ['maguro', false, 4.6, 23.5],
        ['sake', false, 4.0, 25],
        ['ebi', false, 4.3, 28.4],
        ['tamago', false, 4.8, 20],
      ],
      'maki': [
        ['futomaki', false, 4.3, 23.5],
        ['tekkamaki', false, 5.0, 22],
        ['ikura', false, 4.4, 27.2],
        ['temaki', false, 4.8, 30],
      ],
      'other': [
        ['udon', false, 4.6, 17.8],
        ['miso_soup_with_tofu', false, 4.2, 18.2],
        ['ramen', false, 4.7, 18.5],
        ['shrimps', false, 4.4, 21],
        ['dango', false, 4.5, 27],
      ],
      'popular': [
        ['squid', false, 4.7, 26.5],
      ],
    };
    historyOfOrders = [];
  }

  void getData() {
    typesOfDishes = _box.get('MENU');
    historyOfOrders = _box.get('CHECKS');
  }

  void updateDB() {
    _box.put('MENU', typesOfDishes);
    _box.put('CHECKS', historyOfOrders);
  }
}
