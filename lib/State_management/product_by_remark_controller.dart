
import 'package:get/get.dart';
import 'package:ecom/Data/services/network_caller.dart';
import '../Data/model/product_by_remark_model.dart';

class ProductByRemarkController extends GetxController{
  bool _getpopularproductbyremarkprogress=false;
  ProductByRemarksModel _popularProducts =ProductByRemarksModel();

  bool get getpopularproductbyremarkprogress => _getpopularproductbyremarkprogress;
  ProductByRemarksModel get popularProducts=>_popularProducts;

  Future <bool> getpopularProducts() async {
    _getpopularproductbyremarkprogress = true;
    update();
    final response = await networkcaller.getReq(url: "/ListProductByRemark/popular");
    _getpopularproductbyremarkprogress = false;
    if (response.isSuccess) {
      _popularProducts=ProductByRemarksModel.fromJson(response.responsebody);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}