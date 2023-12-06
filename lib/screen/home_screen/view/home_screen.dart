
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/widget/show_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
 InAppWebViewController? inAppWebViewController;
TextEditingController txtSearch=TextEditingController();
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Browser'),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.bookmark_add),
                        Text("All Bookmark")
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => ShowDialog(),
                        );
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
            onLoadStart: (controller, url) => inAppWebViewController=controller,
            onLoadStop: (controller, url) => inAppWebViewController=controller,
            onLoadError: (controller, url, code, message) => inAppWebViewController=controller,
            onProgressChanged: (controller, progress) => inAppWebViewController=controller,
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
                    child: TextField(
                      controller: txtSearch,
                      decoration:  InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Search or type web address"),
                          suffixIcon: IconButton(onPressed: () {
                            inAppWebViewController?.loadUrl(urlRequest: URLRequest(url: Uri.parse("https://www.google.com/search?q=${txtSearch.text}")));
                          }, icon: Icon(Icons.search),)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: () {
                        inAppWebViewController?.loadUrl(urlRequest: URLRequest(url: Uri.parse("https://www.google.com/")));
                      }, icon: const Icon(Icons.home)),
                      IconButton(
                          onPressed: () {
                          },
                          icon: const Icon(Icons.bookmark_add_outlined)),
                      IconButton(
                          onPressed: () {
                            inAppWebViewController?.goBack();
                          }, icon: const Icon(Icons.arrow_back)),
                      IconButton(
                          onPressed: () {
                            inAppWebViewController?.reload();
                          }, icon: const Icon(Icons.restart_alt)),
                      IconButton(
                          onPressed: () {
                            inAppWebViewController?.goForward();
                          }, icon: const Icon(Icons.arrow_forward)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}