import 'package:cheki_keja/ui/Utilities/airtime.dart';
import 'package:cheki_keja/ui/Utilities/kplc.dart';
import 'package:cheki_keja/ui/Utilities/tv.dart';
import 'package:cheki_keja/ui/Utilities/water.dart';
import 'package:flutter/material.dart';

class PayBills extends StatefulWidget {
  PayBills({@required this.biller}) : super();
  var biller;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PayBills>{
  var biller;
  @override
  void initState() {
    biller = widget.biller;
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
        title: Text(biller.biller_name,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Theme.of(context).backgroundColor),),
      ),
      body: loadScreen(widget.biller),
    );
  }

  loadScreen(var biller) {
    switch (biller.biller_code) {
      case "safaricom":
        return Airtime(biller);
      case "airtel":
        return Airtime(biller);
      case "telkom":
        return Airtime(biller);
      case "jtl":
        return Airtime(biller);
      case "kplc_prepaid":
        return KPLC(biller);
      case "kplc_postpaid":
        return KPLC(biller);
      case "startimes":
        return TV(biller);
      case "zuku":
        return TV(biller);
      case "dstv":
        return TV(biller);
      case "gotv":
        return TV(biller);
      case "nairobi_water":
        return Water(biller);
    }
  }
}
