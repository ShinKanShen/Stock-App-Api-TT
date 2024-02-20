import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_app/screen/them_danh_muc_screen.dart';
import 'package:stock_app/screen/thi_truong_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const ThemDanhMucScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const ThiTruongScreen();
          },
        ),
      ],
    ),
  ],);
