// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final TitleController = TextEditingController();
  final AmountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) {
              //   amountInput = val;
              // },
              controller: AmountController,
            ),
            FlatButton(
              onPressed: () {
                addTx(
                  TitleController.text,
                  double.parse(AmountController.text),
                );
              },
              child: Text(
                'Add transaction',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              color: Color.fromARGB(255, 52, 64, 245),
            )
          ],
        ),
      ),
    );
  }
}
