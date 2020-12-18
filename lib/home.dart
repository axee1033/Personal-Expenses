import 'package:flutter/material.dart';
import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import 'models/transaction.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [];
  List<Transaction> get _recentTransaction {
    return _userTransactions.where((tx) {
      return tx.data.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txtitle, double txamount, DateTime date) {
    final NewTx = Transaction(
        title: txtitle,
        amount: txamount,
        data: date,
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(NewTx);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return NewTransaction(
            press: _addNewTransaction,
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _startNewTransaction(context);
            },
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Charts(
              recentTransaction: _recentTransaction,
            ),
            TransactionList(transactions: _userTransactions,deleteTx :_deleteTransaction,),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startNewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
