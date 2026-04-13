import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/app_vectors.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/presentation/pages/root.dart';
import 'package:spotify/presentation/pages/signup.dart';
import 'package:spotify/presentation/widgets/app_bar.dart';
import 'package:spotify/presentation/widgets/basic_app_button.dart';
import 'package:spotify/service_locator.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final _emailController =
      TextEditingController();
  final _passwordController =
      TextEditingController();

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
      body: Padding(
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
            _emailField(context),
            SizedBox(height: 20),
            _passwordField(context),
            SizedBox(height: 20),
            BasicAppButton(
              onPressed: () async {
                var result =
                    await sl<SigninUseCase>().call(
                      params: SigninUserRequest(
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
                              RootPage(),
                        ),
                        (route) => false,
                      ),
                );
              },
              text: "Login",
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return Text(
      "Login",
      style: TextStyle(
        fontVariations: [
          FontVariation.weight(800),
        ],
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
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
            "Not a member? ",
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
                      SignupPage(),
                ),
              );
            },
            child: Text(
              "Register Now",
              style: TextStyle(
                fontVariations: [],
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
