import 'package:flutter/material.dart';
import 'package:stock_app/main_menu.dart';

import 'route/routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Stock App",

      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().router,
      // routeInformationParser: AppRouter().router.routeInformationParser,
      // routerDelegate: AppRouter().router.routerDelegate,
      // builder: (context, child) {
      //   return Overlay(
      //     initialEntries: [
      //       OverlayEntry(
      //         builder:(context)=>const   MainMenu())
      //     ],
      //   );
      // },
    );
  }
}
