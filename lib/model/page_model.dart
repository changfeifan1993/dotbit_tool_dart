import 'model.dart';

class PageModel extends ModelBase {
  List<AccountDataLite> account_datas = [];

  @override
  toModel(Map data) {
    PageModel pageModel = PageModel();
    pageModel.account_datas = [];
    for (Map dataItem in data['list']) {
      pageModel.account_datas.add(AccountDataLite().toModel(dataItem));
    }
    return pageModel;
  }

  @override
  String toJson(model) => "";

  @override
  Map toMap(model) {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}

class AccountData extends ModelBase {
  late String account;
  late String account_id_hex;
  late String next_account_id_hex;
  late int create_at_unix;
  late int expired_at_unix;
  late List<Record> records;
  late int status;
  late String das_lock_arg_hex;
  late String owner_address_chain;
  late String owner_address;
  late String manager_address_chain;
  late String manager_address;
  late String manager_lock_args_hex;

  @override
  toModel(Map data) {
    AccountData accountData = AccountData()
      ..account = data['account']
      ..account_id_hex = data['account_id_hex']
      ..next_account_id_hex = data['next_account_id_hex']
      ..create_at_unix = data['create_at_unix']
      ..expired_at_unix = data['expired_at_unix']
      ..status = data['status']
      ..das_lock_arg_hex = data['das_lock_arg_hex']
      ..owner_address_chain = data['owner_address_chain']
      ..owner_address = data['owner_address']
      ..manager_address_chain = data['manager_address_chain']
      ..manager_address = data['manager_address']
      ..manager_lock_args_hex = data['manager_lock_args_hex'];
    List<Record> records = [];
    for (Map item in data['records']) {
      records.add(Record().toModel(item));
    }
    accountData.records = records;
    return accountData;
  }

  @override
  String toJson(model) => "";

  @override
  Map toMap(model) {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}

class AccountDataLite extends ModelBase {
  late String account;
  late int status;
  late int expiredAt;
  late int registeredAt;


  @override
  toModel(Map data) {
    AccountDataLite accountDataLite = AccountDataLite()
      ..account = data['account']
      ..status = data['status']
      ..expiredAt = data['expired_at']
      ..registeredAt = data['registered_at']
    ;
    return accountDataLite;
  }

  @override
  String toJson(model) => "";

  @override
  Map toMap(model) {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}


class Record extends ModelBase {
  String key = '';
  String label = '';
  String value = '';
  String ttl = '';
  RecordState recordState = RecordState.normal;

  @override
  toModel(Map data) {
    return Record()
      ..key = data['key']
      ..label = data['label']
      ..value = data['value']
      ..ttl = data['ttl'];
  }

  @override
  String toJson(model) => "";

  @override
  Map toMap(record) {
    record as Record;
    return {
      'key': _getKeyAndType(record.key)[1],
      'type': _getKeyAndType(record.key)[0],
      'label': record.label,
      'value': record.value,
      'ttl': record.ttl,
      'action': _getAction(record.recordState)
    };
  }

  _getAction(RecordState state) {
    switch (state) {
      case RecordState.normal:
        return '';
      case RecordState.change:
        return 'change';
      case RecordState.add:
        return 'add';
      case RecordState.delete:
        return 'delete';
      default:
        return '';
    }
  }

  _getKeyAndType(String data) {
    List dataList = data.split('.');
    String key = dataList[0];
    String value = '';
    for (var item in dataList.sublist(1)) {
      value += item;
    }
    return [key, value];
  }

}

enum RecordState {
  normal,
  change,
  add,
  delete,
}
