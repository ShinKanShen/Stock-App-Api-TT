import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/model/provider/app_provider.dart';



Widget buildIndexButton(BuildContext context, String indexCode){
  AppChungKhoanProvider _appChungKhoanProvider = context.read<AppChungKhoanProvider>();
  return Selector<AppChungKhoanProvider, String>(
     selector: (_,p)=> p.currentIndexCode,
    builder: (context, currentIndexCode, child){
      return TextButton(
        onPressed: (){
          _appChungKhoanProvider.changeIndex(indexCode);
        },
        style: TextButton.styleFrom(
          side: BorderSide(
            color: indexCode==currentIndexCode
                  ? Colors.red
                  :const Color.fromRGBO(230, 230, 230, 1),

            width: 1, 
            style: BorderStyle.solid,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
          )
        ),
         child: Text(
          indexCode,
          style: const TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.4)
          ),
         )
         
         );
    },
    );
}