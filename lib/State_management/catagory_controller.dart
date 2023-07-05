import 'package:get/get.dart';
import 'package:ecom/Data/services/network_caller.dart';

import '../Data/model/catagory_model.dart';


class catagoryController extends GetxController {
  bool _getcatagoryprogress = false;

  CatagoryModel _catagoryModel =CatagoryModel();

  bool get getsliderprogress => _getcatagoryprogress;
  CatagoryModel get catagoryModel=>_catagoryModel;

  Future<bool> getcatagorymodel() async {
    _getcatagoryprogress = true;
    update();
    final response = await networkcaller.getReq(url: "/CategoryList");
    _getcatagoryprogress = false;
    if (response.isSuccess) {
      _catagoryModel=CatagoryModel.fromJson(response.responsebody);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
