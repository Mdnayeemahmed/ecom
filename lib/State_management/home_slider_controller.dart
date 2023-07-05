import 'package:get/get.dart';
import 'package:ecom/Data/services/network_caller.dart';

import '../Data/model/slider_model.dart';

class homeSliderController extends GetxController {
  bool _getsliderprogress = false;
  CategoryModel _homeSliderModel = CategoryModel();

  bool get getsliderprogress => _getsliderprogress;
  CategoryModel get homeSliderModel=>_homeSliderModel;

  Future<bool> gethomeslider() async {
    _getsliderprogress = true;
    update();
    final response = await networkcaller.getReq(url: "/ListProductSlider");
    _getsliderprogress = false;
    if (response.isSuccess) {
      _homeSliderModel=CategoryModel.fromJson(response.responsebody);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
