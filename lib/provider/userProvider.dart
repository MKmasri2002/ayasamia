import 'package:advisor1/models/userModel.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Userprovider extends ChangeNotifier {


  UserModel? _userModel;
  UserModel? get usermodel => _userModel;

  setData({required UserModel userModel}) {
    _userModel = userModel;
    notifyListeners();
  }
}
