class ChungKhoanVnHnx30 {
  List coPhieus;
  ChungKhoanVnHnx30({
    required this.coPhieus,
  });

  factory ChungKhoanVnHnx30.fromJson(Map<String, dynamic> json) {
    return ChungKhoanVnHnx30(coPhieus: List<dynamic>.from(json['d']));
  }
  Map<String, dynamic> toJson() {
    return {};
  }
}

// class ChungKhoanVnHnx30 {
//   late List coPhieus;
//   ChungKhoanVnHnx30({
//     required this.coPhieus,
//   });

//   ChungKhoanVnHnx30.fromJson(Map<String, dynamic> json) {
//     coPhieus = List<dynamic>.from(json['d']);
//   }
//   Map<String, dynamic> toJson() {
//     return {};
//   }
// }
