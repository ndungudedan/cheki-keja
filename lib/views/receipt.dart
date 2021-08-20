import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:flutter/material.dart';

class ReceiptUi extends StatelessWidget {
  final TransactionsTableData data;
  ReceiptUi({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date',
                      style: Theme.of(context).textTheme.subtitle2!),
                  Text(data.date!,
                      style: Theme.of(context).textTheme.subtitle1!)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Time',
                      style: Theme.of(context).textTheme.subtitle2!),
                  Text(data.time!,
                      style: Theme.of(context).textTheme.subtitle1!)
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Paid To',
                      style: Theme.of(context).textTheme.subtitle2!),
                  Text(data.biller_code!,
                      style: Theme.of(context).textTheme.subtitle1!)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Account',
                      style: Theme.of(context).textTheme.subtitle2!),
                  Text(data.account!,
                      style: Theme.of(context).textTheme.subtitle1!)
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount',
                      style: Theme.of(context).textTheme.subtitle2!),
                  Text('KES ' + data.amount!,
                      style: Theme.of(context).textTheme.subtitle1!)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Transaction ID',
                      style: Theme.of(context).textTheme.subtitle2!),
                  Text(data.transaction_id!,
                      style: Theme.of(context).textTheme.subtitle1!)
                ],
              ),
            ],
          ),
        ),
      
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Status',
                      style: Theme.of(context).textTheme.subtitle2!),
                  data.status == Constants.utilcode0
                  ? Text(
                    'payment success',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.blue),
                  )
                  : data.status == Constants.utilcode1
                      ? Text(
                        'processing',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Colors.amber),
                      )
                      : data.status == Constants.utilcode2
                          ? Text(
                            'complete success',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.green),
                          )
                          : data.status == Constants.utilcode8
                              ? Text(
                                'failed',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: Colors.red),
                              )
                              : data.status == Constants.utilcode9
                                  ? Text(
                                    'payment failed',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(color: Colors.red),
                                  )
                                  : Text(data.status!)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Units',
                      style: Theme.of(context).textTheme.subtitle2!),
                  Text(data.units!,
                      style: Theme.of(context).textTheme.subtitle1!)
                ],
              ),
            ],
          ),
        ),
        Padding(padding: const EdgeInsets.all(12.0),
        child: Text(data.token!,style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20)),)
      ],
    ));
  }
}
