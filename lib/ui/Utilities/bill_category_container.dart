import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/database/dao.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/ui/Utilities/paybill.dart';
import 'package:flutter/material.dart';

class BillCategoryContainer extends StatefulWidget {
  final category;
  BillCategoryContainer({required this.category});

  @override
  _BillCategoryContainerState createState() => _BillCategoryContainerState();
}

class _BillCategoryContainerState extends State<BillCategoryContainer> {
  var dao = DatabaseDao(databasehelper);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:Color.fromARGB(255, 255, 161, 46),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 5),
            child: Text(
              widget.category.toUpperCase(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          SizedBox(
            child: StreamBuilder<List<BillerTableData>>(
              stream: dao.watchBillersCategory(widget.category),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PayBills(
                                  biller: snapshot.data!.elementAt(index),
                                );
                              }));
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 3.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: CachedNetworkImage(
                                          imageUrl: Constants.baseurl +
                                              snapshot.data!
                                                  .elementAt(index)
                                                  .biller_code! +
                                              '.png'),
                                    ),
                                  ),
                                  Container(
                                      color: Theme.of(context).backgroundColor,
                                      width: double.infinity,
                                      child: Center(
                                          child: Text(
                                              snapshot.data!
                                                  .elementAt(index)
                                                  .biller_name!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                    fontSize: 10,
                                                  )))),
                                ],
                              ),
                            ),
                          );
                        });
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
          ),
        ],
      ),
    );
  }
}
