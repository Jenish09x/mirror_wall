import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/screen/home_screen/provider/home_provider.dart';
import 'package:mirror_wall/screen/home_screen/view/home_screen.dart';
import 'package:provider/provider.dart';

// ignore: non_constant_identifier_names
void ShowDialog(BuildContext context,) {
  showDialog(context: context, builder: (context) {
    final searchEngineProvider = context.read<HomeProvider>();
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
              HomeScreenState.inAppWebViewController?.loadUrl(
                  urlRequest: URLRequest(
                      url: Uri.parse("https://www.google.com/")));
            },
            title: const Text("Google"),
          ),
          RadioListTile(
            value: "Yahoo",
            groupValue: searchEngineProvider.maritalStatus,
            onChanged: (value) {
              searchEngineProvider.setMaritalStatus(value.toString());
              HomeScreenState.inAppWebViewController?.loadUrl(
                  urlRequest: URLRequest(
                      url: Uri.parse("https://in.search.yahoo.com/?fr2=inr")));
              Navigator.pop(context);
            },
            title: const Text("Yahoo"),
          ),
          RadioListTile(
            value: "Bing",
            groupValue: searchEngineProvider.maritalStatus,
            onChanged: (value) {
              searchEngineProvider.setMaritalStatus(value.toString());
              HomeScreenState.inAppWebViewController?.loadUrl(
                  urlRequest: URLRequest(
                      url: Uri.parse("https://www.bing.com/#!")));
              Navigator.pop(context);
            },
            title: const Text("Bing"),
          ),
          RadioListTile(
            value: "Duck Duck Go",
            groupValue: searchEngineProvider.maritalStatus,
            onChanged: (value) {
              searchEngineProvider.setMaritalStatus(value.toString());
              HomeScreenState.inAppWebViewController?.loadUrl(
                  urlRequest: URLRequest(
                      url: Uri.parse("https://duckduckgo.com/&")));
              Navigator.pop(context);
            },
            title: const Text("Duck Duck Go"),
          ),
        ],
      ),
    );
  },
  );
}