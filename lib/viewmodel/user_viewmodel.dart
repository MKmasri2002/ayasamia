import 'package:advisor1/core/service/api.dart';
import 'package:advisor1/models/userModel.dart';
import 'package:advisor1/provider/userProvider.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  bool isLoading = false;
  Future<void> login({
    required String email,
    required String password,
    required Userprovider userProvider,
  }) async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    final UserModel? userModel = await Api.login(
      email: email,
      password: password,
    );
    if (userModel != null) {
      userProvider.setData(userModel: userModel);
    }
    isLoading = false;
    notifyListeners();
  }
}
