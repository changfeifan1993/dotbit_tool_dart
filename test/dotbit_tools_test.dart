import 'dart:io';

import 'package:dotbit_tools/model/page_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dotbit_tools/dotbit_tools.dart';

void main() {
  test('get bit data', () async {
    await DasTools.getRecordByAddress(
      onSuccess: (pageModel) {
        print(pageModel.account_datas[0].account);
      },
      address: '',
    );
  });
}
