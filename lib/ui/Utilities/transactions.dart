import 'package:cheki_keja/blocs/transactionsBloc.dart';
import 'package:cheki_keja/database/dao.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/views/avatar_btm_sheet.dart';
import 'package:cheki_keja/views/receipt.dart';
import 'package:cheki_keja/views/trans_tile.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Transactions extends StatefulWidget {
  Transactions() : super();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Transactions> {
  var dao = DatabaseDao(databasehelper);
  late TransactionsBloc transactionsBloc;
  @override
  void initState() {
    transactionsBloc = TransactionsBloc();
    transactionsBloc.fetchTransactions();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Utility Transactions',
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Theme.of(context).backgroundColor),),
      ),
      body: StreamBuilder<List<TransactionsTableData>>(
        stream: dao.watchTransactions(),
        builder: (BuildContext context, AsyncSnapshot<List<TransactionsTableData>> snapshot) {
          if (snapshot.data != null) {
            if (snapshot.hasData) {
              return RefreshIndicator(
                onRefresh: ()async {
                  transactionsBloc.fetchTransactions();
                  setState(() {
                    
                  });
                },
                              child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          showCustomModalBottomSheet(
                            expand: false,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => AvatarBottomSheet(
                              child: ReceiptUi(
                                data: snapshot.data!.elementAt(index),
                              ),
                            ),
                            containerWidget: (context, animation, child) {
                              return SafeArea(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Material(
                                    color: Colors.transparent,
                                    clipBehavior: Clip.antiAlias,
                                    borderRadius: BorderRadius.circular(12),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        child,
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'POWERED BY ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                        fontSize: 10,
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Image.asset(
                                                'assets/images/logo.png',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: TransactionTile(
                          transaction: snapshot.data!.elementAt(index),
                          index: index,
                        ),
                      );
                    }),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Image.asset('assets/images/no_data.png'),
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
