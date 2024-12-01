import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  const CampoTexto({
    super.key,
    required this.controller,
    required this.label,
    this.tipoTeclado = TextInputType.number,
    this.validator,
    this.onChanged,
    this.initialValue,
  });

  final TextEditingController controller;
  final String label;
  final TextInputType tipoTeclado;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: tipoTeclado,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
        onChanged: onChanged,
        initialValue: initialValue,
      ),
    );
  }
}
