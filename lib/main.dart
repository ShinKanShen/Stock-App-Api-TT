


// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/app.dart';

import 'model/provider/app_provider.dart';

void main(){
  runApp(
   
    ChangeNotifierProvider(
      create: (context)=> AppChungKhoanProvider(),

      child: const MyApp(),
      )
    );
   
}


  