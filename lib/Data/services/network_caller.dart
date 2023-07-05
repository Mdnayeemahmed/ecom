import 'dart:convert';
import 'package:ecom/Data/util/urls.dart';
import 'package:ecom/State_management/userAuthcontroller.dart';
import 'package:http/http.dart';

import '../model/response_model.dart';

class networkcaller {
  networkcaller._();

  static Future<responsemodel> getReq({required String url}) async {
    try {
      final Response response = await get(Uri.parse(urls.baseurl + url),headers: {
        'Content-type':'application/json',
        'Accept':'application/json',
        'token':userAuthcontroller.token.toString(),


      });
      if (response.statusCode == 200) {
        return responsemodel(
            responsecode: response.statusCode,
            isSuccess: true,
            responsebody: jsonDecode(response.body));
      }
      // else if(response.statusCode == 401) {
      //   return responsemodel(
      //       responsecode: response.statusCode,
      //       isSuccess: false,
      //       responsebody: jsonDecode(response.body));
      // }

      else {
        return responsemodel(
            responsecode: response.statusCode,
            isSuccess: false,
            responsebody: jsonDecode(response.body));
      }
    } catch (e) {
      print(e.toString());
      return responsemodel(
          responsecode: -1, isSuccess: false, responsebody: e.toString());
    }
  }
}
