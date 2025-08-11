import 'package:advisor1/core/router/route.dart';
import 'package:advisor1/core/router/routes_string.dart';
import 'package:advisor1/provider/userProvider.dart';
import 'package:advisor1/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>Userprovider()),
    ChangeNotifierProvider(create: (_)=>UserViewModel())
  ],
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute : RoutesString.login,
      routes : routes,
    );
  }
}
