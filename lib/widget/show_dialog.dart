
import 'package:flutter/material.dart';
import 'package:mirror_wall/screen/home_screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

// ignore: non_constant_identifier_names
void ShowDialog(BuildContext context)
{
  showDialog(context: context, builder: (context) {
    return  Consumer<HomeProvider>(builder: (context, searchEngineProvider, maritalSearch) {
      return AlertDialog(
        title: const Text('Search Engine'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
              value: "Google",
              groupValue: searchEngineProvider.maritalStatus,
              onChanged: (value) {
                searchEngineProvider.setMaritalStatus(value.toString());
              },
              title: const Text("Google"),
            ),
            RadioListTile(
              value: "Yahoo",
              groupValue: searchEngineProvider.maritalStatus,
              onChanged: (value) {
                searchEngineProvider.setMaritalStatus(value.toString());
              },
              title: const Text("Yahoo"),
            ),
            RadioListTile(
              value: "Bing",
              groupValue: searchEngineProvider.maritalStatus,
              onChanged: (value) {
                searchEngineProvider.setMaritalStatus(value.toString());
              },
              title: const Text("Bing"),
            ),
            RadioListTile(
              value: "Duck Duck Go",
              groupValue: searchEngineProvider.maritalStatus,
              onChanged: (value) {
                searchEngineProvider.setMaritalStatus(value.toString());
              },
              title: const Text("Duck Duck Go"),
            ),
          ],
        ),
      );
    },
    );
  },);
}