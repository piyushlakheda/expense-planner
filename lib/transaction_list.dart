// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart ';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions added yet!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'asset/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 5,
                  ),
                  elevation: 10,
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 94, 205, 98),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color.fromARGB(255, 94, 205, 98),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.0,
                            offset: Offset(
                              2.5,
                              2.5,
                            ),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount}',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => deleteTx(transactions[index].id),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin:
                //             EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                //         decoration: BoxDecoration(
                //           color: Color.fromARGB(255, 94, 205, 98),
                //           borderRadius: BorderRadius.circular(20),
                //           border: Border.all(
                //             color: Color.fromARGB(255, 94, 205, 98),
                //           ),
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.grey,
                //               blurRadius: 3.0,
                //               offset: Offset(
                //                 2.5,
                //                 2.5,
                //               ),
                //             ),
                //           ],
                //         ),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Colors.white,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(transactions[index].title,
                //               style: TextStyle(
                //                 color: Colors.blue,
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.bold,
                //               )),
                //           Text(
                //             DateFormat.yMMMd().format(transactions[index].date),
                //             style: TextStyle(
                //               color: Colors.grey,
                //               fontWeight: FontWeight.normal,
                //               fontSize: 10,
                //             ),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
