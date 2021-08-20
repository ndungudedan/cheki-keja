import 'package:flutter/material.dart';

class BorderedTextField extends StatelessWidget {
  final String? hintText;
  final String? helperText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final String? labelText;
  final String? initialValue;
  final Color? fillColor;
  final bool? enabled;
  final TextInputType? inputType;
  final FocusNode? currentfocus;
  final FocusNode? nextfocus;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final formKey;

  BorderedTextField(
      {this.hintText,
      this.helperText,
      this.suffix,
      this.enabled,
      this.prefixIcon,
      this.labelText,
      this.initialValue,
      this.fillColor,
      this.controller,
      this.contentPadding,
      this.currentfocus,
      this.inputType,
      this.nextfocus,
      this.formKey});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
                            onFieldSubmitted: (value) {
                            },
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                enabled: false,
                                hintText: hintText,
                                labelText: labelText,
                                helperText: helperText),
                          );
  }

}
