import 'package:advisor1/core/router/routes_string.dart';
import 'package:advisor1/view/dashboard.dart';
import 'package:advisor1/view/login.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes =  <String, WidgetBuilder>{

RoutesString.login:(context )=>Login(),
RoutesString.dashboard: (context )=>Dashboard(),

};
