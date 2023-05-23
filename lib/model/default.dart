import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefixIcon,
  IconData? suffix,
  required validate,
  bool isPassword = false,
  suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xfff2f9fc),
        prefixIcon: Icon(prefixIcon),
        labelText: label,
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: suffixPressed,
              )
            : null,
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(238, 238, 238, 1)),
          borderRadius: BorderRadius.circular(25),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(238, 238, 238, 1)),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(238, 238, 238, 1)),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      validator: validate,
      obscureText: isPassword,
    );
