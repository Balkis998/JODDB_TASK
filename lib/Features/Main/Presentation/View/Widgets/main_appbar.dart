// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Core/Style/assets.dart';
import '../../../../../Core/Style/icon_style.dart';

class MainAppbar extends StatelessWidget {
  const MainAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsets.all(6.0),
        child: IconButtonStyleWidget(
          icon: SvgPicture.asset(SvgAssets.drawerMenu),
          onPressed: () {},
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: IconButtonStyleWidget(
            icon: SvgPicture.asset(SvgAssets.profile),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
