import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:stock_app/model/provider/app_provider.dart';
import 'package:stock_app/route/router_name_constant.dart';

import '../widget/list_view/them_danh_muc/them_danh_muc_listview.dart';

class ThemDanhMucScreen extends StatefulWidget {
  const ThemDanhMucScreen({super.key});

  @override
  State<ThemDanhMucScreen> createState() => _ThemDanhMucScreenState();
}

class _ThemDanhMucScreenState extends State<ThemDanhMucScreen> {
  late TextEditingController textEditingController;
  late AppChungKhoanProvider _appProvider;
  @override
  void initState() {
    textEditingController = TextEditingController();
    _appProvider = context.read<AppChungKhoanProvider>();

    textEditingController.text = _appProvider.updateDanhMucText;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thêm danh mục mới",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
      ),
      //backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
      body: Column(
        children: [
          Container(
            height: 10,
            width: double.infinity,
            color: const Color.fromRGBO(238, 238, 238, 1),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            child: Column(
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            textEditingController.clear();
                          },
                          icon: const Icon(
                            Icons.clear,
                            size: 18,
                          )),
                      //filled: true,
                      enabledBorder: InputBorder.none,
                      hintText: 'Tên danh mục',
                      hintStyle: const TextStyle(),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            style: BorderStyle.solid,
                            width: 0.5,
                          ))),
                ),
                const Divider(
                  thickness: 0.2,
                  height: 5,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      // if(textEditingController.text.isEmpty || _appProvider.findDanhMucItem(textEditingController.text) ){
                      //   print("ten da bi trung or rong");
                      // }
                      if (!_appProvider.isUpdate) {
                        if (textEditingController.text.isEmpty) {
                          //print("ten khong rong");
                        } else {
                          _appProvider.addDanhMuc(textEditingController.text);
                          _appProvider.addDataForSort();
                          _appProvider.addDanhMucBox(
                              'key_${textEditingController.text}',
                              textEditingController.text);

                          _appProvider.isStart = false;
                          // print('${_appProvider.getDanhMucBox()[0]}' +
                          // 'ten danh muc trong box');

                          if (_appProvider
                              .findDanhMucItem(textEditingController.text)) {
                            context.pushNamed(MyAppRouterName.thitruong);
                            textEditingController.clear();
                            _appProvider.setDefaultItem();
                            _appProvider.clearSelectenList();
                            _appProvider.updateDanhMuc.clear();
                            // print('them thanh cong');
                            // print(_appProvider.danhMuc);
                          }
                        }
                        // print('${_appProvider.getDanhMucBox()}' +
                        //    'ten danh muc trong box 2');
                      } else {
                        _appProvider.update(textEditingController.text);
                        if (_appProvider
                            .findDanhMucItem(textEditingController.text)) {
                          context.pushNamed(MyAppRouterName.thitruong);
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
                            borderRadius: BorderRadius.circular(5))),
                    child: const Text('Xác nhận',
                        style: TextStyle(color: Colors.white, fontSize: 16))),
              ],
            ),
          ),
          Container(
            height: 10,
            width: double.infinity,
            color: const Color.fromRGBO(238, 238, 238, 1),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 12, bottom: 12),
              child: Column(
                children: [
                  TextField(
                      decoration: InputDecoration(
                          hintText: "Bạn đang tìm kiếm gì",
                          prefixIconConstraints:
                              const BoxConstraints(maxHeight: 18, maxWidth: 30),
                          suffixIcon: IconButton(
                              onPressed: () {
                                textEditingController.clear();
                              },
                              icon: const Icon(
                                Icons.clear,
                                size: 18,
                              )),
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.4)),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 24,
                          ),
                          // contentPadding: const EdgeInsets.only(
                          //     top: 8, bottom: 8, left: 0, right: 0),
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
          ),
        ],
      ),
    );
  }
}
