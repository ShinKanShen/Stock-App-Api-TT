// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/app.dart';
import 'package:stock_app/model/hive/box/boxes.dart';
import 'package:stock_app/model/hive/model/user_model.dart';

import 'model/provider/app_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  userBox = await Hive.openBox<User>('userBox');

  runApp(ChangeNotifierProvider(
    create: (context) => AppChungKhoanProvider(),
    child: const MyApp(),
  ));
}
