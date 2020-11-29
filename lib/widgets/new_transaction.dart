import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTr;

  NewTransaction(this.addNewTr);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInputControler = TextEditingController();
  final amountInputControler = TextEditingController();
  DateTime _selectDate;

  void _submitData() {
    if (amountInputControler.text.isEmpty) {
      return;
    }
    final enteredTitle = titleInputControler.text;
    final enteredAmount = double.parse(amountInputControler.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectDate == null) {
      return;
    }

    widget.addNewTr(enteredTitle, enteredAmount, _selectDate);
    Navigator.of(context).pop();
  }

  void _presentDayPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          _selectDate = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              autocorrect: true,
              onSubmitted: (_) => _submitData(),
              decoration: InputDecoration(labelText: 'Tytuł'),
              controller: titleInputControler,
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Kwota'),
              controller: amountInputControler,

              // onChanged: (value) => amountInput = value,
            ),
            Container(
              height: 80,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(_selectDate == null
                          ? 'Brak wybranej daty'
                          : 'Wybrana data ${DateFormat.yMd().format(_selectDate)}')),
                  FlatButton(
                      textColor: Colors.purple,
                      onPressed: _presentDayPicker,
                      child: Text(
                        'Wybierz datę',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            RaisedButton(
              onPressed: _submitData,
              child: Text('Dodaj Tranzakcję'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
            )
          ],
        ),
      ),
    );
  }
}
