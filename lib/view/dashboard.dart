import 'package:advisor1/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final userP = Provider.of<Userprovider>(context);
    String name = userP.usermodel!.name ?? "";
    return Scaffold(
      body: Center(
        child: Text("welcome $name !", style: TextStyle(fontSize: 25)),
      ),
    );
  }
}
