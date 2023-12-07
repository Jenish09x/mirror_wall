import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void ShowBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return BottomSheet(
        onClosing: () {},
        builder: (context) => SizedBox(
          height: 700,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("yes"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("No"),
              ),
            ],
          ),
        ),
      );
    },
  );
}
