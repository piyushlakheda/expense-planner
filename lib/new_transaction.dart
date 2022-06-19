// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TitleController = TextEditingController();

  final AmountController = TextEditingController();

  void submitData() {
    final enteredTitle = TitleController.text;
    final enteredAmount = double.parse(AmountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
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
              controller: TitleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) {
              //   amountInput = val;
              // },

              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),

              controller: AmountController,
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
