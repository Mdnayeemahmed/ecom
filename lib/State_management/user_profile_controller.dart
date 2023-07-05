import 'package:ecom/Data/model/profile_model.dart';
import 'package:ecom/Screen/UI/sign_up_screen.dart';
import 'package:ecom/State_management/userAuthcontroller.dart';
import 'package:get/get.dart';
import 'package:ecom/Data/services/network_caller.dart';


class UserProfileController extends GetxController {
  bool _getprofiledatainprogress = false;

  bool get getprofiledatainprogress => _getprofiledatainprogress;


  Future<bool> getprofiledata() async {
    _getprofiledatainprogress = true;
    update();
    final response = await networkcaller.getReq(url: "/ReadProfile");
    _getprofiledatainprogress = false;
    if (response.isSuccess) {
      final ProfileModel profileModel=ProfileModel.fromJson(response.responsebody);
      if(profileModel.data!=null){
        await Get.find<userAuthcontroller>().saveProfileData(profileModel.data!.first);
      }else{
        //Get.to(signupscreen());
      }

      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}