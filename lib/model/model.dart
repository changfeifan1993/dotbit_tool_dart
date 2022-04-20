import 'dart:convert';

abstract class ModelBase<T> {
  T toModel(Map data);

  String toJson(T model);

  Map toMap(T model);
}
