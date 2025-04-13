import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../Core/Style/assets.dart';
import '../../../../../Core/Style/icon_style.dart';
import '../../../../Home/Presentation/View/home_screen.dart';
import '../../../../Main/Presentation/BloC/MainCubit/main_screen_cubit.dart';

class CalendarAppbar extends StatelessWidget {
  const CalendarAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      leadingWidth: 80,
      leading: IconButtonStyleWidget(
        icon: SvgPicture.asset(SvgAssets.arrowLeft),
        onPressed: () {
          context.read<MainScreenCubit>().changePage(HomeScreen.id);
        },
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: IconButtonStyleWidget(
            icon: SvgPicture.asset(SvgAssets.search),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
