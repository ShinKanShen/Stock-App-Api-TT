import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final cupertinoAction = CupertinoActionSheet(
  actions: <Widget>[
    Container(
      height: 50,
      
      color: const Color.fromARGB(255, 255, 255, 255),
      child:  curpertinoAction(onPressed: (){}, text: 'Thao Tac') ,
    ),
     Container(
      height: 55,    
      color: const Color.fromARGB(255, 255, 255, 255),
      child:  curpertinoAction(onPressed: (){}, text: 'Them Danh Muc', fontSize: 16) ,
    ),
     Container(
      height: 55,
     
      color: const Color.fromARGB(255, 255, 255, 255),
      child:  curpertinoAction(onPressed: (){}, text: 'Chinh Sua Danh Muc',  fontSize: 16) ,
    ),
     Container(
      height: 55,
      color: const Color.fromARGB(255, 255, 255, 255),
      child:  curpertinoAction(onPressed: (){}, text: 'Xoa Danh Muc', xoa: false,  fontSize: 16),
    ),
  ],
  cancelButton: Container(
    height: 55,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: curpertinoAction(onPressed: (){}, text: 'Dong',  fontSize: 16),

  )
  ,
);



 curpertinoAction({required VoidCallback onPressed, required String text, bool? xoa, double? fontSize}){
  return CupertinoActionSheetAction(
    onPressed: onPressed,
    
    child: Text(
      text, style: TextStyle(
        fontSize: fontSize??14, 
        color: xoa??true? const  Color.fromRGBO(0, 0, 0, 1) : Colors.red   
          ),
    ),
   
   );
}