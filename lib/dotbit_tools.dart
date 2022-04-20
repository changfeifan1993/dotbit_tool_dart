library dotbit_tools;

import 'dart:convert';

import 'package:dotbit_tools/utils/api.dart';
import 'package:dotbit_tools/utils/http.dart';
import 'package:http/http.dart';

import 'model/page_model.dart';

class DasTools {

  static getRecordByAddress({required String address, required onSuccess(PageModel pageModel)}) async {
    if (address == '') return null;
    Map body = {"address": address, "chain_type": 1, "page": 1, "size": 100};
    await doPost(dasPostAddressToGetMineList, jsonEncode(body), (Response response) {
      Map dataMap = jsonDecode(response.body);
      PageModel pageModel = PageModel().toModel(dataMap['data']);
      onSuccess(pageModel);
    });
  }
}
