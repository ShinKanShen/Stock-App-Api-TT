import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/model/provider/app_provider.dart';

import '../model/api/chung_khoan/chung_khoan_info.dart';



class GiaoDichScreen extends StatefulWidget {
  const GiaoDichScreen({super.key});

  @override
  State<GiaoDichScreen> createState() => _GiaoDichScreenState();
}

class _GiaoDichScreenState extends State<GiaoDichScreen> {
  late AppChungKhoanProvider _appProvider;

  @override
  void initState() {
    _appProvider= context.read<AppChungKhoanProvider>();
    _appProvider.addChungKhoanData();
    _appProvider.getDanhMucSelectedItem();
   
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("giao dich"),
      ),
      body:
        SizedBox(
          
          child: Expanded(
            
            child: Selector<AppChungKhoanProvider, List<Data>>(
              selector: (_,p1)=>p1.getChungKhoan,
              shouldRebuild: (p,n)=> true,
              builder: (context,chungKhoanData, child ){
                return  ListView.builder(
                itemCount: chungKhoanData.length,
                itemBuilder: (context,index){
                  
                 
                  final data = chungKhoanData[index];
                 
                  return ListTile(
                    title: Text('${data.fullname}'),
                  );
                }
                );
              }, 
              
            )
              ),
        )
       ,
    );
  }
}