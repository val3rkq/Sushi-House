class CheckModel {
  // check data
  // final int index;
  final String dateTime;
  final int count;

  // food data
  final String name;
  final String type;
  final double price;
  final double grade;

  CheckModel({
    // required this.index,
    required this.count,
    required this.dateTime,
    required this.name,
    required this.type,
    required this.price,
    required this.grade,
  });

  Map<String, dynamic> toMap() {
    return {
      // 'index': index,
      'count': count,
      'dateTime': dateTime,
      'name': name,
      'type': type,
      'price': price,
      'grade': grade,
    };
  }
}
