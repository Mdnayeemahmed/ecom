import 'package:ecom/Data/services/network_caller.dart';
import 'package:ecom/State_management/userAuthcontroller.dart';
import 'package:ecom/State_management/user_profile_controller.dart';
import 'package:get/get.dart';

class userauthcontroller extends GetxController {
  bool _emailverificationprogress = false;
  bool _otpverificationprogress = false;

  bool get emailverificationprogress => _emailverificationprogress;
  bool get otpverificationprogress => _otpverificationprogress;


  Future<bool> emailverification(String email) async {
    _emailverificationprogress = true;
    update();
    final response = await networkcaller.getReq(url: "/UserLogin/$email");
    _emailverificationprogress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      update();
      return false;
    }
  }


  Future<bool> otpverification(String email,String otp) async {
    _otpverificationprogress = true;
    update();
    final response = await networkcaller.getReq(url: "/VerifyLogin/$email/$otp");
    _otpverificationprogress = false;
    if (response.isSuccess) {
      await Get.find<userAuthcontroller>().savetoken(response.responsebody['data']);
      await Get.find<UserProfileController>().getprofiledata();
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
