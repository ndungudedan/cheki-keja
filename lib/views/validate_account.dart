import 'package:cheki_keja/models/billers.dart';
import 'package:cheki_keja/views/textfield_border.dart';
import 'package:flutter/material.dart';

class ValidateAccountUi extends StatelessWidget {
final VoidCallback confirmed;
  final VoidCallback canceled;
  final ValidateAccountResponse data;
  ValidateAccountUi({
    required this.data,
      required this.confirmed,
      required this.canceled
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Meter Number'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BorderedTextField(
                                  initialValue: data.account,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Account Name'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BorderedTextField(
                                  initialValue: data.name ?? '',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Balance'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BorderedTextField(
                                  initialValue: data.balance ?? '',
                                ),
                              ),
                              SizedBox(
                                height: 100,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: OutlinedButton(
                                        child: Text('CANCEL',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                        style: ButtonStyle(
                                          side: MaterialStateProperty.all(
                                              BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                          shape: MaterialStateProperty.all(
                                              BeveledRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0))),
                                        ),
                                        onPressed: () {
                                          canceled();
                                        }),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: OutlinedButton(
                                        child: Text(
                                          'CONFIRM',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .backgroundColor),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Theme.of(context)
                                                      .primaryColor),
                                          shape: MaterialStateProperty.all(
                                              BeveledRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0))),
                                        ),
                                        onPressed: () {
                                          confirmed();
                                        }),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
  }
}
