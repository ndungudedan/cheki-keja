import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatefulWidget {
  final TransactionsTableData transaction;
  final index;
  TransactionTile({required this.transaction, this.index});
  @override
  _TransactionTileState createState() => _TransactionTileState();
}

class _TransactionTileState extends State<TransactionTile> {
  late TransactionsTableData transaction;
  @override
  void initState() {
    transaction = widget.transaction;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: CachedNetworkImage(
                imageUrl: Constants.uploadurl +
                    transaction.biller_code! +
                    '.png'),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(transaction.biller_code!,
                  style: Theme.of(context).textTheme.subtitle1!),
              Text(transaction.account!,
                  style: Theme.of(context).textTheme.subtitle2!),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(transaction.date!,
                    style: Theme.of(context).textTheme.caption!),
              ),
            ],
          ),
          SizedBox(
            width: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('KES ' + transaction.amount!,
                  style: Theme.of(context).textTheme.subtitle1!),
              Text(transaction.transaction_id!,
                  style: Theme.of(context).textTheme.subtitle2!),
              transaction.status == Constants.utilcode0
                  ? Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'payment success',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Colors.blue),
                      ),
                    )
                  : transaction.status == Constants.utilcode1
                      ? Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'processing',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.amber),
                          ),
                        )
                      : transaction.status == Constants.utilcode2
                          ? Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'complete success',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: Colors.green),
                              ),
                            )
                          : transaction.status == Constants.utilcode8
                              ? Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    'failed',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(color: Colors.red),
                                  ),
                                )
                              : transaction.status == Constants.utilcode9
                                  ? Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'payment failed',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(color: Colors.red),
                                      ),
                                    )
                                  : Text(transaction.status!)
            ],
          ),
        ],
      ),
      Divider()
    ],
        ),
      );
  }
}
