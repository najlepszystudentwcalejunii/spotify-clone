import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/is_dark_mode.dart';
import 'package:spotify/core/app_colors.dart';
import 'package:spotify/core/app_images.dart';
import 'package:spotify/core/app_vectors.dart';
import 'package:spotify/presentation/pages/signin.dart';
import 'package:spotify/presentation/pages/signup.dart';
import 'package:spotify/presentation/widgets/app_bar.dart';
import 'package:spotify/presentation/widgets/basic_app_button.dart';

class LoginOrSignupPage extends StatefulWidget {
  const LoginOrSignupPage({super.key});

  @override
  State<LoginOrSignupPage> createState() =>
      _LoginOrSignupPageState();
}

class _LoginOrSignupPageState
    extends State<LoginOrSignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BasicAppBar(),
          Align(
            alignment: AlignmentGeometry.topRight,
            child: SvgPicture.asset(
              AppVectors.topPattern,
            ),
          ),
          Align(
            alignment:
                AlignmentGeometry.bottomRight,
            child: SvgPicture.asset(
              AppVectors.bottomPattern,
            ),
          ),
          Align(
            alignment:
                AlignmentGeometry.bottomLeft,
            child: Image.asset(
              AppImages.authBg,
              scale: 1.2,
            ),
          ),
          Align(
            alignment: AlignmentGeometry.center,
            child: Padding(
              padding:
                  EdgeInsetsGeometry.symmetric(
                    horizontal: 20,
                  ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppVectors.logo,
                  ),
                  SizedBox(height: 55),
                  Text(
                    "Enjoy listening to music",
                    style: TextStyle(
                      fontVariations: [
                        FontVariation.weight(800),
                      ],
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(height: 21),
                  Text(
                    "Spotify is a proprietary Swedish audio streaming and media services provider",
                    style: TextStyle(
                      fontVariations: [
                        FontVariation.weight(100),
                      ],
                      color: AppColors.grey,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: BasicAppButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SignupPage(),
                              ),
                            );
                          },
                          text: "Register",
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: BasicAppButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SigninPage(),
                              ),
                            );
                          },
                          text: "Login",
                          bgColor:
                              Colors.transparent,
                          textColor:
                              context.isDarkMode
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
