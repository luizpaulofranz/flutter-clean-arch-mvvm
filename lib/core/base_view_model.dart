import 'package:countries_app/core/base_model.dart';
import 'package:flutter/material.dart';

abstract class BaseViewModel<T extends BaseModel> extends ChangeNotifier {
  late T _model;
  T get model => _model;

  set model(T model) {
    _model = model;
    notifyListeners();
  }

  // bool _loading = false;
  // bool get loading => _loading;
  // set loading(bool value) {
  //   _loading = value;
  //   notifyListeners();
  // }

  void init();
}
