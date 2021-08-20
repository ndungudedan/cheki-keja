import 'package:cheki_keja/ui/Utilities/bill_payment_body.dart';
import 'package:cheki_keja/ui/Utilities/transactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillPayments extends StatefulWidget {
  @override
  _BillPaymentsState createState() => _BillPaymentsState();
}

class _BillPaymentsState extends State<BillPayments> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'PAY UTILITY BILLS',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Theme.of(context).backgroundColor),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.receipt_long_outlined),
              tooltip: 'Utility Transactions',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Transactions();
                }));
              },
            ),
          ],
        ),
        body: BillPaymentsBody());
  }
}
