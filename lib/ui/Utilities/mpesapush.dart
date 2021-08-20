import 'package:flutter/material.dart';

class MpesaPushView extends StatelessWidget {
  final _mpesaNoController;
  
  MpesaPushView(this._mpesaNoController);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/mpesa_logo.png',
          height: 50,
          width: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
            controller: _mpesaNoController,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please fill field';
              }
              return null;
            },
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: '07xxxxxxxxx',
                labelText: 'Mpesa Phone',
                helperText: 'Mpesa Phone Number for payment'),
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
