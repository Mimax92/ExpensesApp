import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String label;
  final double spendingAmont;
  final double spendingPctOfTotal;

  Bar(this.label, this.spendingAmont, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constrains) {
        return Column(
          children: [
            Container(
                height: constrains.maxHeight * 0.15,
                child: FittedBox(
                    child: Text('${spendingAmont.toStringAsFixed(0)} zł'))),
            SizedBox(
              height: constrains.maxHeight * 0.05,
            ),
            Container(
              height: constrains.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constrains.maxHeight * 0.05,
            ),
            Container(height: constrains.maxHeight * 0.15,
              child: FittedBox(child: Text(label))),
          ],
        );
      },
    );
  }
}
