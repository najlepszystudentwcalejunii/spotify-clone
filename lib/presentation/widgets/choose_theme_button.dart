import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spotify/core/app_colors.dart';

class ChooseThemeButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String title;
  final bool isActive;

  const ChooseThemeButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.title,
    this.isActive = false,
  });

  @override
  State<ChooseThemeButton> createState() =>
      _ChooseThemeButtonState();
}

class _ChooseThemeButtonState
    extends State<ChooseThemeButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onPressed,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3,
                sigmaY: 3,
              ),
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  border: widget.isActive
                      ? BoxBorder.all(
                          color: AppColors.white,
                        )
                      : null,
                  color: AppColors.darkGrey
                      .withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
                child: Icon(widget.icon),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 17,
            fontVariations: [
              FontVariation.weight(400),
            ],
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
