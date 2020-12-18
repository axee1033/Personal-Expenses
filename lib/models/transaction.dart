import 'package:flutter/foundation.dart';

class Transaction {
  final String id, title;
  final double amount;
  final DateTime data;
  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.data});
}
