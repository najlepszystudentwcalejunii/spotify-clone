import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/app_colors.dart';
import 'package:spotify/core/app_images.dart';
import 'package:spotify/core/app_vectors.dart';
import 'package:spotify/presentation/bloc/theme_cubit.dart';
import 'package:spotify/presentation/pages/login_or_signup.dart';
import 'package:spotify/presentation/widgets/basic_app_button.dart';
import 'package:spotify/presentation/widgets/choose_theme_button.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages.chooseModeBg,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 60,
              horizontal: 30,
            ),
            child: Column(
              children: [
                SvgPicture.asset(AppVectors.logo),
                Spacer(),
                Text(
                  "Choose mode",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 22,
                    fontVariations: [
                      FontVariation.weight(600),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  spacing: 70,
                  children: [
                    ChooseThemeButton(
                      onPressed: () {
                        context
                            .read<ThemeCubit>()
                            .updateTheme(
                              ThemeMode.dark,
                            );
                      },
                      icon: CupertinoIcons.moon,
                      title: "Dark Theme",
                      isActive:
                          context
                              .read<ThemeCubit>()
                              .state ==
                          ThemeMode.dark,
                    ),
                    ChooseThemeButton(
                      onPressed: () {
                        context
                            .read<ThemeCubit>()
                            .updateTheme(
                              ThemeMode.light,
                            );
                      },
                      icon:
                          CupertinoIcons.sun_max,
                      title: "Light Theme",
                      isActive:
                          context
                              .read<ThemeCubit>()
                              .state ==
                          ThemeMode.light,
                    ),
                  ],
                ),
                SizedBox(height: 60),
                BasicAppButton(
                  text: "Continue",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LoginOrSignupPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
