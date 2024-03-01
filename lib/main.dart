// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/app.dart';

import 'package:stock_app/model/hive/box/boxes.dart';

import 'model/hive/model/danhmuc/data_model.dart';

import 'model/provider/app_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
//Hive.registerAdapter(UserAdapter());
  // Hive.registerAdapter(DanhMucAdapter());
  Hive.registerAdapter(Data2Adapter());

// userBox = await Hive.openBox<User>('userBox');
  danhMucBox = await Hive.openBox('danhMucBox');
  if (danhMucBox.length >= 2) {
    // print(danhMucBox.length);
    danhMucBox.clear();
  }

  runApp(ChangeNotifierProvider(
    create: (context) => AppChungKhoanProvider(),
    child: const MyApp(),
  ));
}
