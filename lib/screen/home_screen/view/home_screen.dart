
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/screen/home_screen/provider/home_provider.dart';
import 'package:mirror_wall/widget/show_bottom_sheet.dart';
import 'package:mirror_wall/widget/show_dialog.dart';
import 'package:provider/provider.dart';

import '../../../utils/check_data_status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
 @override
 void initState() {
   super.initState();
   networkConnection.checkConnection(context);
 }
 NetworkConnection networkConnection = NetworkConnection();
 HomeProvider? providerR;
  HomeProvider? providerW;
  static InAppWebViewController? inAppWebViewController;
  TextEditingController txtSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return SafeArea(
      child: providerW!.isOnline?Scaffold(
        appBar: AppBar(
          title: const Text('Browser'),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: InkWell(
                      onTap: () {
                        ShowBottomSheet(context);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.bookmark_add),
                          Text("All Bookmark")
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    child: InkWell(
                      onTap: () {
                        ShowDialog(context);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.screen_search_desktop_rounded),
                          Text("Search Engine")
                        ],
                      ),
                    ),
                  ),
                ];
              },
            )
          ],
        ),
        body: Stack(children: [
          InAppWebView(
            onLoadStart: (controller, url) =>
                inAppWebViewController = controller,
            onLoadStop: (controller, url) =>
                inAppWebViewController = controller,
            onLoadError: (controller, url, code, message) =>
                inAppWebViewController = controller,
            onProgressChanged: (controller, progress) {
              inAppWebViewController = controller;
              providerW!.progressBar(progress);
            },
            initialUrlRequest: URLRequest(
              url: Uri.parse("https://www.google.com/"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.15,
              color: Colors.grey.shade100,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextField(
                          controller: txtSearch,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              label: const Text("Search or type web address"),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  inAppWebViewController?.loadUrl(
                                      urlRequest: URLRequest(
                                          url: Uri.parse(
                                              "https://www.google.com/search?q=${txtSearch.text}")));
                                },
                                icon: const Icon(Icons.search),
                              )),
                        ),
                        LinearProgressIndicator(
                          color: Colors.red,
                          value: providerR!.progressValue,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            inAppWebViewController?.loadUrl(
                                urlRequest: URLRequest(
                                    url: Uri.parse("https://www.google.com/")));
                          },
                          icon: const Icon(Icons.home_outlined)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_add_outlined)),
                      IconButton(
                          onPressed: () {
                            inAppWebViewController?.goBack();
                          },
                          icon: const Icon(Icons.arrow_back)),
                      IconButton(
                          onPressed: () {
                            inAppWebViewController?.reload();
                          },
                          icon: const Icon(Icons.restart_alt)),
                      IconButton(
                          onPressed: () {
                            inAppWebViewController?.goForward();
                          },
                          icon: const Icon(Icons.arrow_forward)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ):Center(child: const Text("No Internet"))
    );
  }
}
