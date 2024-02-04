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
}

enum LoadState {
  loading,
  init,
  loaded,
  error,
}

class SortCodeConst {
  static const String az='A-Z';
  static const String gia='Gia';
  static const String khoiluong ='Khoi Luong';
}

class AppChungKhoanProvider extends ChangeNotifier{

  final ApiChungKhoanService _api = ApiChungKhoanService();
  
  String _currentIndex = IndexCodeConst.vn30;
  String get currentIndexCode=> _currentIndex;

  String _currentSort = SortCodeConst.az;
  String get currentSortIndexCode =>_currentSort;


  List<Data> _chungKhoanData =[];
  List _chungKhoanDataSort=[];
  List get ChungKhoanDataSort => _chungKhoanDataSort;
  List<Data> get getChungKhoan => _chungKhoanData;
  
  String _danhmucText='';
  String get danhMucText => _danhmucText;

  List<Data> chungKhoanSelected =[];

  List<Map<String, dynamic>> _danhmuc =[];
  List<Map<String, dynamic>>  get danhMuc=> _danhmuc;

   int checkSelected=0;
  
  List<dynamic> _selectedItem=[];
  List<dynamic>  get selectedItem => _selectedItem;

  // void setDanhMucText(String text){
  //   _danhmucText = text;
  //   notifyListeners();
  // }
  void addDanhMuc(var tendanhmuc){
    _danhmuc.add({
      'name': tendanhmuc,
      'chungKhoans': _selectedItem,
    });
    _danhmucText = tendanhmuc;
    print(_danhmuc[0]['chungKhoans']);
    print(danhMuc[0]);
    notifyListeners();
  }

  bool findDanhMucItem(String name){
    if(_danhmuc.where((element) => element['name']==name).isNotEmpty){
      return true;
    }
    return false;
  }
  void clearSelectenList(){
    _selectedItem.clear();
  }

  void deleteDanhMuc(){
    if(_danhmucText!=''){
    _danhmuc.removeWhere((element) => element['name']==_danhmucText);
    notifyListeners();
    }
    _danhmucText= _danhmuc.first['name'].toString();
    notifyListeners();
  }

  void addSelectedItem(Data data){
    _selectedItem.add(data);
    print(_selectedItem);
    notifyListeners();
  }

  void removeSeletedItem(Data data){
    _selectedItem.remove(data);
    print(_selectedItem);
    notifyListeners();
  }

  List<Data> getDanhMucSelectedItem(){
    if(_danhmuc.isNotEmpty){
      Map<String, dynamic> data = _danhmuc.firstWhere((element) => element['name']==_danhmucText);
      if(data.isNotEmpty){
        List<Data> a = List<Data>.from(data['chungKhoans']);
      return a;
    }
    }
    notifyListeners();
     return [];
  }

  int changeIsSave(int check){
    checkSelected = check;
    if(check == 0) {
      
      checkSelected =1;
       notifyListeners();
      return 1;
    }
    
    checkSelected=0;
    notifyListeners();
    return 0;
  }

  // void setDanhMucText(String danhmuctext){
  //   _danhmucText = danhmuctext;
  //   notifyListeners();
  // }

  void addChungKhoanData() async{
    DataChungKhoan? getData = await _api.getChungKhoan('');
    _chungKhoanData = getData!.chungKhoanInfoList;
    print(' call add list chung khoan ${_chungKhoanData[1].id}');
    print(' call add list chung khoan ${_chungKhoanData[1].isSave}');
    notifyListeners();

  }

  void sortChungKhoanIsSave(){
    _chungKhoanData.sort((a,b)=> b.isSave!.compareTo(a.isSave!));
  }

 

  void changeIndex(String indexCode){
    _chungKhoanDataSort.addAll(_chungKhoanData.toList());
    if(_currentIndex != indexCode){
      _currentIndex = indexCode;
      notifyListeners();
    }
    switch(indexCode){
      case IndexCodeConst.vn30:
        _chungKhoanDataSort.where((element) => element.exchange==indexCode);
        notifyListeners(); break;
      case IndexCodeConst.hnx:
        _chungKhoanDataSort.where((element) => element.exchange==indexCode);
        notifyListeners(); break;
      case IndexCodeConst.hsx:
        _chungKhoanDataSort.where((element) => element.exchange==indexCode);
        notifyListeners(); 
        break;
      case IndexCodeConst.hnx30:
        _chungKhoanDataSort.where((element) => element.exchange==indexCode);
        notifyListeners(); break;
      case IndexCodeConst.upcom:
        _chungKhoanDataSort.where((element) => element.exchange==indexCode);
        notifyListeners(); break;
      case SortCodeConst.az: 
        _chungKhoanDataSort.sort((a,b)=> (a.fullname.compareTo(b.fullname)));
      case SortCodeConst.gia: 
        _chungKhoanDataSort.sort((a,b)=> (a.closePrice.compareTo(b.closePrice)));
      case SortCodeConst.khoiluong:  
        _chungKhoanDataSort.sort((a,b)=> (a.totalTrading.compareTo(b.totalTrading)));
      default: break;
    }
  }

  
}