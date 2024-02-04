import 'chung_khoan_info.dart';

class DataChungKhoan{
  late List<Data> chungKhoanInfoList;
  DataChungKhoan();

  DataChungKhoan.fromJson(List? jsonArray){
    if(jsonArray == null) return ;
    chungKhoanInfoList =[];
    for( var json in jsonArray){
      Data indexData = Data.fromJson(json);
      if(indexData.changePercent!=0){
        chungKhoanInfoList.add(indexData);
      } 
    }
  }

  Map<String, dynamic> toJson()=>{
    'd': chungKhoanInfoList.map((e) => e.toJson()).toList()
  };

 }