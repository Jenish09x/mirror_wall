import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void ShowBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return BottomSheet(
        onClosing: () {},
        builder: (context) => const SizedBox(
          height: 700,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      );
    },
  );
}