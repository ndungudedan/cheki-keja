import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/management/management.dart';
import 'package:cheki_keja/models/status.dart';
import 'package:cheki_keja/utility/utils.dart';
import 'package:cheki_keja/views/custom_button.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'mpesapush.dart';

class TV extends StatelessWidget {
  TV(this.biller);
  var biller;
  final _mpesaNoController =
      TextEditingController(text: sharedPreferences.getPhone() ?? '');
  final _amountController = TextEditingController();
  final _accountNoController = TextEditingController();
  final _step1Key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _step1Key,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: CachedNetworkImage(
                imageUrl: Constants.uploadurl + biller.biller_code + '.png',
                height: 50,
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _accountNoController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill field';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: '1234567890123',
                  labelText: 'Account Number',
                ),
                maxLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill field';
                  } else {
                    var am=int.tryParse(value) ?? 0;
                    var min = int.tryParse(biller.minimum_balance) ?? 500;
                    if (am < min) {
                      return 'Invalid Amount';
                    }
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: '0',
                    labelText: 'Amount',
                    helperText: 'min: 500'),
                maxLines: 1,
              ),
            ),
            MpesaPushView(_mpesaNoController),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomButton(
                onTap: () {
                  if (_step1Key.currentState!.validate()) {
                    payBill(context);
                  }
                },
                icon: Image.asset(
                  'assets/images/ic_ticket.png',
                  scale: 2.5,
                ),
                label: 'Buy',
              ),
            ),
          ],
        ));
  }

  Future<void> payBill(context) async {
    startLoader(context);
    var response = await NetworkApi().payBill(biller, _accountNoController.text,
        _mpesaNoController.text, _amountController.text);
    print(response);
    closeLoader(context);
    print(response);
    var result = Status.fromJson(json.decode(response));
    if (result.code == Constants.success) {
      await CoolAlert.show(
          context: context,
          title: 'Transaction Request Successful',
          type: CoolAlertType.success,
          text: result.message,
          confirmBtnColor: Theme.of(context).primaryColor);
    } else {
      await CoolAlert.show(
          context: context,
          title: 'Transaction Request Failed',
          type: CoolAlertType.error,
          text: result.message,
          confirmBtnColor: Theme.of(context).primaryColor);
    }
  }
}
