import 'catagory.dart';

class CatagoryModel {
  String? msg;
  List<Category>? catagories;

  CatagoryModel({this.msg, this.catagories});

  CatagoryModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      catagories = <Category>[];
      json['data'].forEach((v) {
        catagories!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.catagories != null) {
      data['data'] = this.catagories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

