import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.labelTex,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  final String labelTex;
  final Widget icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: TextFormField(
        validator: (String? value) {
          return value!.isEmpty ? "Campo obrigatório" : null;
        },
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.]+'))],
        decoration: InputDecoration(
          icon: icon,
          labelText: labelTex,
        ),
      ),
    );
  }
}
