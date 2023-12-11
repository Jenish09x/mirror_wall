import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen/home_screen/provider/home_provider.dart';

// ignore: non_constant_identifier_names
void ShowBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return BottomSheet(
        onClosing: () {},
        builder: (context) => Container(
          height: MediaQuery.sizeOf(context).height * 1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.white),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                onLongPress: () {
                  context.watch<HomeProvider>().bookMarkData?.removeAt(index);
                  Navigator.pop(context);
                },
                title: Text("https://www.google.com/search?q ${context.read<HomeProvider>().bookMarkData!}"),
              );
            },
            itemCount: context.read<HomeProvider>().bookMarkData!.length,
          ),
        ),
      );
    },
  );
}