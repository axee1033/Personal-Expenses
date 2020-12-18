import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function press;

  NewTransaction({Key key, this.press}) : super(key: key);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedaDate;

  void SubmitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedaDate == null) {
      return;
    }
    widget.press(
      _titleController.text,
      double.parse(
        _amountController.text,
      ),
      _selectedaDate,
    );
    Navigator.of(context).pop();
  }

  void _PresentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedaDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              onSubmitted: (_) => SubmitData(),
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Title",
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _amountController,
              onSubmitted: (_) => SubmitData(),
              decoration: InputDecoration(
                labelText: "Amount",
              ),
            ),
            Container(
              height: 70.0,
              child: Row(
                children: [
                  Text(_selectedaDate == null
                      ? "No Date Choose"
                      : DateFormat.yMd().format(_selectedaDate)),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      "Choose Date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _PresentDatePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: SubmitData,
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
