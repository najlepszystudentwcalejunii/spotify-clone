import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/app_vectors.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/presentation/pages/home.dart';
import 'package:spotify/presentation/pages/signin.dart';
import 'package:spotify/presentation/widgets/app_bar.dart';
import 'package:spotify/presentation/widgets/basic_app_button.dart';
import 'package:spotify/service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController
  _fullNameController = TextEditingController();
  final TextEditingController _emailController =
      TextEditingController();
  final TextEditingController
  _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 30,
        ),
      ),
      bottomNavigationBar: _signinText(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center,
          children: [
            _registerText(),
            SizedBox(height: 50),
            _fullNameField(context),
            SizedBox(height: 20),
            _emailField(context),
            SizedBox(height: 20),
            _passwordField(context),
            SizedBox(height: 20),
            BasicAppButton(
              onPressed: () async {
                var result =
                    await sl<SignupUseCase>().call(
                      params: CreateUserRequest(
                        fullName:
                            _fullNameController
                                .text
                                .trim(),
                        email: _emailController
                            .text
                            .trim(),
                        password:
                            _passwordController
                                .text
                                .trim(),
                      ),
                    );
                result.fold(
                  (l) {
                    var snackbar = SnackBar(
                      content: Text(l),
                    );
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(snackbar);
                  },
                  (r) =>
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomePage(),
                        ),
                        (route) => false,
                      ),
                );
              },
              text: "Create Account",
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return Text(
      "Register",
      style: TextStyle(
        fontVariations: [
          FontVariation.weight(800),
        ],
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: _fullNameController,
      decoration:
          InputDecoration(
            hintText: "Full Name",
          ).applyDefaults(
            Theme.of(
              context,
            ).inputDecorationTheme,
          ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration:
          InputDecoration(
            hintText: "Email",
          ).applyDefaults(
            Theme.of(
              context,
            ).inputDecorationTheme,
          ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordController,
      decoration:
          InputDecoration(
            hintText: "Password",
          ).applyDefaults(
            Theme.of(
              context,
            ).inputDecorationTheme,
          ),
    );
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Text(
            "Do you have an account? ",
            style: TextStyle(
              fontVariations: [
                FontVariation.weight(400),
              ],
              fontSize: 14,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SigninPage(),
                ),
              );
            },
            child: Text(
              "Sign In",
              style: TextStyle(
                decoration:
                    TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
