import 'package:flutter/material.dart';

const kSmallTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 15,
);

final kGreySmallTextStyle = TextStyle(
  color: Colors.grey[600],
  fontSize: 15,
);

final kMediumBoldText = TextStyle(
  fontWeight: FontWeight(600),
  fontSize: 20,
);

final kInputConBoxDecoration = BoxDecoration(
  // color: Colors.white,
  borderRadius: BorderRadius.circular(15),
  border: Border.all(
    color: Color.fromRGBO(158, 158, 158, 0.5),
    width: 1,
  ),
);

const Map<String, Color> categoryColors = {
  'Food': Colors.red,
  'Transport': Colors.green,
  'Bills': Colors.orange,
  'Entertainment': Colors.purple,
  'Health': Colors.brown,
  'Shopping': Colors.blue,
  'Other': Colors.grey,
};
