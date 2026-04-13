import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/presentation/pages/choose_mode.dart';
import 'package:spotify/presentation/widgets/basic_app_button.dart';
import 'package:spotify/core/app_colors.dart';
import 'package:spotify/core/app_images.dart';
import 'package:spotify/core/app_vectors.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages.introBg,
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
                  "Enjoy listening to music",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 25,
                    fontVariations: [
                      FontVariation.weight(600),
                    ],
                  ),
                ),
                SizedBox(height: 21),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.grey,
                    fontVariations: [
                      FontVariation.weight(100),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChooseModePage(),
                      ),
                    );
                  },
                  text: "Get Started",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
