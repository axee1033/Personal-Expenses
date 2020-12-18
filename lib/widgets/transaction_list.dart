import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList({Key key, this.transactions,this.deleteTx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transaction",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 200.0,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, int index) {
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      child: FittedBox(
                        child: Text(
                          "\$${transactions[index].amount.toStringAsFixed(2)}",
                        ),
                      ),
                    ),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.title),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].data),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,color: Colors.redAccent[400],),
                      onPressed: () {
                       deleteTx(transactions[index].id) ;
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}

