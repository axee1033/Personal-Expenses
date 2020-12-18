import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotle;

  const ChartBar(
      {Key key, this.label, this.spendingAmount, this.spendingPctOfTotle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 20.0,
          child: FittedBox(child: Text("\$${spendingAmount.toStringAsFixed(0)}"))),
        SizedBox(
          height: 4,
        ),
        Container(
          width: 10,
          height: 60,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10.0)
                  
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotle,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                ),
              ),

            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
