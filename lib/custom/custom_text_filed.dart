import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? errorMsg;
  final bool? readOnly;
  final String? Function(String?)? onChanged;

  const MyTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.obscureText,
    required this.labelText,
    this.keyboardType,
    this.suffixIcon,
    this.onTap,
    this.prefix,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.errorMsg,
    this.readOnly,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
        readOnly: readOnly ?? false,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        focusNode: focusNode,
        onTap: onTap,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefix: prefix,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          label: Text(
            labelText,
            style: const TextStyle(fontSize: 20),
          ),
          labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.secondary, fontSize: 18),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          fillColor: const Color(0xFFedf0f8),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFb2b7bf), fontSize: 18),
          errorText: errorMsg,
        ),
      ),
    );
  }
}
