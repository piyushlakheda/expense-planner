// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors, non_constant_identifier_names, unnecessary_null_comparison

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart ';

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _TitleController = TextEditingController();
  final _AmountController = TextEditingController();

  final DateFormat serverFormater = DateFormat('dd-MM-yyyy');

  // DateTime temp = DateTime.now();
  DateTime _selectDate = DateTime.now();

  @override
  void submitData() {
    if (_AmountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _TitleController.text;
    final enteredAmount = double.parse(_AmountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _selectDate = pickedDate;
        });
      },
    );
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (val) {
              //   titleInput = val;
              // },
              controller: _TitleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) {
              //   amountInput = val;
              // },

              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),

              controller: _AmountController,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectDate == null
                          ? 'No date chosen'
                          : 'Picked Date:' +
                              ' ' +
                              DateFormat.yMd().format(_selectDate),
                    ),
                  ),
                  FlatButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
            FlatButton(
              onPressed: () => submitData,
              child: Text(
                'Add transaction',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              color: Colors.blueAccent,
              hoverColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
