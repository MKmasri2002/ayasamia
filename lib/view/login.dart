import 'package:advisor1/core/router/routes_string.dart';
import 'package:advisor1/provider/userProvider.dart';
import 'package:advisor1/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final userVM = Provider.of<UserViewModel>(context);
    final userP = Provider.of<Userprovider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Text("login"),
                SizedBox(height: 16),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(prefixIcon: Icon(Icons.person)),
                ),
                SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(prefixIcon: Icon(Icons.lock)),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    await userVM.login(
                      email: emailController.text,
                      password: passwordController.text,
                      userProvider: userP,
                    );

                   if (userP.usermodel != null) {
                      Navigator.pushNamed(context, RoutesString.dashboard);
                    } 
                  },
                  child: userVM.isLoading
                      ? CircularProgressIndicator()
                      : Text("login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
