import 'package:flutter/material.dart';
import 'package:mirror_wall/screen/home_screen/provider/home_provider.dart';
import 'package:mirror_wall/utils/screen_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
            ChangeNotifierProvider(create: (context) => HomeProvider(),)
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        routes: app_routes,
      ),
    ),
  );
}
