// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Core/Style/assets.dart';
import '../../../../../Core/Style/icon_style.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      leadingWidth: 80,
      leading: IconButtonStyleWidget(
        icon: SvgPicture.asset(SvgAssets.arrowLeft),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
