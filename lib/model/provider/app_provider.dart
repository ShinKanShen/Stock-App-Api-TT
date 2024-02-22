//import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_app/services/api_chung_khoan_services.dart';

import '../api/chung_khoan/chung_khoan_info.dart';
import '../api/chung_khoan/data_chung_khoan.dart';

class IndexCodeConst {
  static const String vn30 = "VN30";
  static const String hsx = "HSX";
  static const String hnx = "HNX";
  static const String hnx30 = "HNX30";
  static const String upcom = "UPCOM";
  static const String hose = "HOSE";
}

enum LoadState {
  loading,
  init,
  loaded,
  error,
}

class SortCodeConst {
  static const String az = 'A-Z';
  static const String gia = 'Giá';
  static const String khoiluong = 'Khối lượng';
  static const String chungkhoan = 'Chứng khoán';
  static const String tintucs = 'Tin tức';
  static const String chucnang = 'Chức năng';
}

class AppChungKhoanProvider extends ChangeNotifier {
  // khoi tao api service
  final ApiChungKhoanService _api = ApiChungKhoanService();
  // chuc nang index
  String _currentIndex = IndexCodeConst.vn30;
  String get currentIndexCode => _currentIndex;
  // chuc nang sap xep
  final String _currentSort = SortCodeConst.az;
  String get currentSortIndexCode => _currentSort;
  // lay du lieu chung khoan tu api va de thuc hien cac chuc nang
  List<Data> _chungKhoanData = [];
  List<Data> _chungKhoanDataSort = [];
  List<Data> get chungKhoanDataSort => _chungKhoanDataSort;
  List<Data> get getChungKhoan => _chungKhoanData;
  // danh muc text cho hient hi
  String _danhmucText = '';
  String get danhMucText => _danhmucText;

  // danh muc khi them va cac chuc nang lien quan
  final List<Map<String, dynamic>> _danhmuc = [];
  List<Map<String, dynamic>> get danhMuc => _danhmuc;
  // luu co phieu khi ta nhan luu khi them

  int checkSelected = 0; // check luu hay chua
  final List<dynamic> _selectedItem = [];
  List<dynamic> get selectedItem => _selectedItem;
  // tra lai co phieu nhu ban dau khi ma thay doi gia tri
  late int _selectItemCount;
  int get selectItemCount => _selectItemCount;
  // list co phieu cho search
  List<Data> search = [];

  void searchList(String value) {
    search = List.from(_chungKhoanData);

    search = _chungKhoanData
        .where((element) =>
            element.symbol!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

  // add danh muc
  void addDanhMuc(var tendanhmuc) {
    List<Data> selectedItem = List.from(_selectedItem);
    _selectItemCount = selectedItem.length;
    _danhmuc.add({
      'name': tendanhmuc,
      'chungKhoans': selectedItem,
    });
    _danhmucText = tendanhmuc;

    notifyListeners();
  }

  // set data for sort
  void addDataForSort() {
    _chungKhoanDataSort = List<Data>.from(getDanhMucSelectedItem());
    notifyListeners();
  }

  // set default cho chung khoan
  void setDefaultItem() {
    for (int i = 0; i < selectItemCount; i++) {
      _chungKhoanData[i].isSave = 0;
    }
    notifyListeners();
  }

  // tim danh muc item
  bool findDanhMucItem(String name) {
    if (_danhmuc.where((element) => element['name'] == name).isNotEmpty) {
      return true;
    }
    return false;
  }

  // clear selected item
  void clearSelectenList() {
    _selectedItem.clear();
  }

// xoa danh muc
  void deleteDanhMuc() {
    if (_danhmucText != '') {
      _danhmuc.removeWhere((element) => element['name'] == _danhmucText);
    }

    _danhmucText = _danhmuc.first['name'].toString();
    notifyListeners();
  }

//  them selected item into list
  void addSelectedItem(Data data) {
    _selectedItem.add(data);
    print(_selectedItem);
    notifyListeners();
  }

// xoa item trong selected list
  void removeSeletedItem(Data data) {
    _selectedItem.remove(data);
    print(_selectedItem);
    notifyListeners();
  }

// lay danh sach co phieu trong danh muc
  List<Data> getDanhMucSelectedItem() {
    if (_danhmuc.isNotEmpty || _danhmucText != '') {
      Map<String, dynamic> data =
          _danhmuc.firstWhere((element) => element['name'] == _danhmucText);
      if (data.isNotEmpty) {
        List<Data> a = List<Data>.from(data['chungKhoans']);
        return a;
      }
    }
    // không cần thiết phải thông báo thực hiện thay đổi vì những chức năng kia đã thông
    // báo thay đổi và rebuild lại rồi không cần thiết
    // notifyListeners();
    return [];
  }

// chage isSave de hien thi trong trang them
  int changeIsSave(int check) {
    checkSelected = check;
    if (check == 0) {
      checkSelected = 1;
      notifyListeners();
      return 1;
    }
    checkSelected = 0;
    notifyListeners();
    return 0;
  }

  // gan danh muc text de hien thi
  void setDanhMucText(String danhmuctext) {
    _danhmucText = danhmuctext;
    notifyListeners();
  }

// lay data tu api
  Future addChungKhoanData() async {
    DataChungKhoan? getData = await _api.getChungKhoan('');
    _chungKhoanData = getData!.chungKhoanInfoList;
    // print(' call add list chung khoan ${_chungKhoanData[1].id}');
    // print(' call add list chung khoan ${_chungKhoanData[1].isSave}');
    notifyListeners();
  }

// sap xep chung khoan theo save hay chua
  void sortChungKhoanIsSave() {
    _chungKhoanData.sort((a, b) => b.isSave!.compareTo(a.isSave!));
  }

// cac chuc nang khi nhan tren man hinh
  void changeIndex(String indexCode) {
    // _chungKhoanDataSort.addAll(_chungKhoanData.toList());
    if (_currentIndex != indexCode) {
      _currentIndex = indexCode;
    }

    notifyListeners();
  }

  // tim co phieu co trong san nhat dinh
  void findByIndex(String indexcode) {
    _chungKhoanDataSort.clear();
    _chungKhoanDataSort.addAll(getDanhMucSelectedItem()
        .where((element) => element.exchange == indexcode));
  }

  // sap xep co phieu bang cac nut chuc nang sap xep
  void sortFunction(String sortCode) {
    switch (sortCode) {
      case SortCodeConst.az:
        _chungKhoanDataSort
            .sort((a, b) => (a.fullname!.compareTo(b.fullname!)));
      case SortCodeConst.gia:
        _chungKhoanDataSort
            .sort((a, b) => (a.closePrice!.compareTo(b.closePrice!)));
      case SortCodeConst.khoiluong:
        _chungKhoanDataSort
            .sort((a, b) => (a.totalTrading!.compareTo(b.totalTrading!)));
      default:
        break;
    }
    print(_chungKhoanDataSort);
    notifyListeners();
  }

  // chuc nang tim co phieu trong san
  void functionButton(String indexCode) {
    _chungKhoanDataSort.clear();
    switch (indexCode) {
      case IndexCodeConst.vn30:
        findByIndex(IndexCodeConst.vn30);
        break;
      case IndexCodeConst.hnx:
        findByIndex(IndexCodeConst.hnx);

        break;
      case IndexCodeConst.hsx:
        findByIndex(IndexCodeConst.hsx);

        break;
      case IndexCodeConst.hnx30:
        findByIndex(IndexCodeConst.hnx30);

        break;
      case IndexCodeConst.upcom:
        findByIndex(IndexCodeConst.upcom);

        break;
      case IndexCodeConst.hose:
        findByIndex(IndexCodeConst.hose);

        break;
    }
    notifyListeners();
  }
}
