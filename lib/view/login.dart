import 'package:advisor1/core/router/routes_string.dart';
import 'package:advisor1/provider/userProvider.dart';
import 'package:advisor1/viewmodel/user_viewmodel.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({super.key});

  // هنا تعرف controllers كخصائص في الكلاس
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userVM = Provider.of<UserViewModel>(context);
    final userP = Provider.of<Userprovider>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0f2027), Color(0xff203a43), Color(0xff2c5364)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ZoomIn(
                      child: Icon(
                        Icons.school_rounded,
                        size: 90,
                        color: Colors.cyanAccent,
                      ),
                    ),
                    const SizedBox(height: 10),
                    FadeInDown(
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: Colors.cyanAccent.shade100,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    FadeInLeft(
                      child: _glassTextField(
                        controller: emailController,
                        icon: Icons.email,
                        hint: "Email",
                        isPassword: false,
                      ),
                    ),
                    const SizedBox(height: 16),
                    FadeInRight(
                      child: _glassTextField(
                        controller: passwordController,
                        icon: Icons.lock,
                        hint: "Password",
                        isPassword: true,
                      ),
                    ),
                    const SizedBox(height: 24),
                    BounceInUp(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyanAccent,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 80,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 10,
                        ),
                        onPressed: () async {
                          await userVM.login(
                            email: emailController.text,
                            password: passwordController.text,
                            userProvider: userP,
                          );

                          if (userP.usermodel != null) {
                            Navigator.pushNamed(
                              context,
                              RoutesString.dashboard,
                            );
                          }
                        },
                        child: userVM.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.black,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _glassTextField({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    required bool isPassword,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.cyanAccent),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
