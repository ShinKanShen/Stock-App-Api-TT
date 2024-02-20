import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/model/provider/app_provider.dart';

import '../widget/list_view/them_danh_muc/them_danh_muc_listview.dart';

class ThemDanhMucScreen extends StatefulWidget {
  const ThemDanhMucScreen({super.key});

  @override
  State<ThemDanhMucScreen> createState() => _ThemDanhMucScreenState();
}

class _ThemDanhMucScreenState extends State<ThemDanhMucScreen> {

  late TextEditingController textEditingController ;
  late AppChungKhoanProvider _appProvider; 
  @override
  void initState() {
    textEditingController = TextEditingController();
    _appProvider= context.read<AppChungKhoanProvider>();
    _appProvider.addChungKhoanData();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Them Danh Muc Moi",
        style:  TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black
        ),
        
        ),
        centerTitle: true,
        
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: (){
                    textEditingController.clear();
                  }
                , icon: const Icon(Icons.clear)
                ),

                filled: true,
                enabledBorder: InputBorder.none,
                hintText: 'Ten danh muc',
                hintStyle: const TextStyle(
                  
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    style: BorderStyle.solid,
                    width: 0.5,
                  )
                )
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            ElevatedButton(
              onPressed: (){

                // if(textEditingController.text.isEmpty || _appProvider.findDanhMucItem(textEditingController.text) ){
                //   print("ten da bi trung or rong");
                // }
                if(textEditingController.text.isEmpty ){
                  print("ten khong rong");
                }
                else{
                  _appProvider.addDanhMuc(textEditingController.text);
                   
                  if(_appProvider.findDanhMucItem(textEditingController.text)){
                    
                   textEditingController.clear();
                   _appProvider.setDefaultItem();
                   _appProvider.clearSelectenList();
                    // print('them thanh cong');
                    // print(_appProvider.danhMuc);
                  }
                }
              }, 
              style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color.fromRGBO(40, 60, 145, 1),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
              child: const Text('Xac Nhan',
               style: TextStyle(color: Colors.white, fontSize: 16)
              )
              ),

            const SizedBox(
              height: 8,
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: "Bạn đang tìm kiếm gì",
                    suffixIcon: IconButton(
                        onPressed: () {
                          textEditingController.clear();
                        },
                        icon: const Icon(Icons.clear)),
                    hintStyle:
                        const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                    prefixIcon: const Icon(Icons.filter_vintage),
                    enabledBorder: InputBorder.none)),
            const Divider(
              thickness: 0.2,
              height: 20,
              color: Colors.black,
            ),
          
            themDanhMucListView(context),

          ],
        ),
      ),
    );
  }
}