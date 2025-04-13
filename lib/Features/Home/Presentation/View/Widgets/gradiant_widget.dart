import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../Core/Theme/app_colors.dart';

class GradiantWidget extends StatelessWidget {
  final String assetName;
  const GradiantWidget({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.secondaryColor, AppColors.secondaryBLueColor],
          stops: [-0.1349, 1.0975],
        ),
      ),
      child: Center(child: SvgPicture.asset(assetName)),
    );
  }
}
