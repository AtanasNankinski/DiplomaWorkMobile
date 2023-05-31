import 'package:flutter/material.dart';

InputDecoration defaultTextFieldDecoration({required String hintText, required BuildContext context}){
  return InputDecoration(
    hintText: hintText,
    hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontWeight: FontWeight.normal,
      color: Colors.black.withOpacity(0.4),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black, width: 1)
    ),
    filled: true,
    fillColor: Colors.white.withOpacity(0.9),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
  );
}