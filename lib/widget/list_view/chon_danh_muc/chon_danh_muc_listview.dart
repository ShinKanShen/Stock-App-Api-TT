import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/model/provider/app_provider.dart';

Widget chonDanhMucListView(BuildContext context){

  AppChungKhoanProvider _appProvider = context.read<AppChungKhoanProvider>();
  return Selector<AppChungKhoanProvider, List>(
    selector: (_,p1)=> p1.danhMuc,
    builder: (context, danhMucs, child){
      return Expanded(
        child: ListView.builder(
          itemCount: danhMucs.length,
          itemBuilder: (context, index){
            final danhmuc = danhMucs[index];
            return GestureDetector(
              onTap: () {
                _appProvider.setDanhMucText(danhmuc['name']);
                _appProvider.addDataForSort();
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: GestureDetector(
                  onTap: (){},
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(danhmuc['name']??'',
                          style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400
                          ),),
              
                          const Icon(
                            Icons.arrow_forward_ios_outlined, size: 20, 
                            color: Colors.black45,
                          )
                        ],
                      ),
                       const Divider(
                thickness: 0.5,
                height: 8,)
                    ],
                  ),
                ),
              
              ),
            );


          })
        );
    }, 
    );
}