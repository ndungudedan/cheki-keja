import 'package:cheki_keja/blocs/billersBloc.dart';
import 'package:cheki_keja/database/dao.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/ui/Utilities/bill_category_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillPaymentsBody extends StatefulWidget {
  @override
  _BillPaymentsBodyState createState() => _BillPaymentsBodyState();
}

class _BillPaymentsBodyState extends State<BillPaymentsBody> {
  var dao = DatabaseDao(databasehelper);
  late BillersBloc billersBloc;
  @override
  void initState() {
    billersBloc = BillersBloc();
    billersBloc.fetchBillers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
          stream: dao.watchBillers(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              print(snapshot.data);
              return ListView(
                children: [
                  SizedBox(
                            height: 16,
                          ),
                BillCategoryContainer(category: 'airtime',),
                SizedBox(
                            height: 16,
                          ),
                BillCategoryContainer(category: 'electricity',),
                SizedBox(
                            height: 16,
                          ),
                BillCategoryContainer(category: 'tv',),
                SizedBox(
                            height: 16,
                          ),
                BillCategoryContainer(category: 'water',),
                SizedBox(
                            height: 16,
                          ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Image.asset('assets/images/no_data.png'),
              );
            } else if (snapshot.data != null) {
              return Center(
                child: Image.asset('assets/images/no_data.png'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }
    );
  }
}

