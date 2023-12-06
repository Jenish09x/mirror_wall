import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AlertDialog ShowDialog()
{
  return  AlertDialog(
    title: const Center(child: Text("Search Engine")),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
           Radio(value: '', groupValue: '', onChanged: (value) {
           },),
           const Text("Google")
          ],
        ),
        Row(
          children: [
            Radio(value: '', groupValue: '', onChanged: (value) {
            },),
           const Text("Yahoo")
          ],
        ),
        Row(
          children: [
            Radio(value: '', groupValue: '', onChanged: (value) {
            },),
           const Text("Bing")
          ],
        ),
        Row(
          children: [
            Radio(value: '', groupValue: '', onChanged: (value) {
            },),
           const Text("Duck Duck Go")
          ],
        ),
      ],
    ),
  );
}