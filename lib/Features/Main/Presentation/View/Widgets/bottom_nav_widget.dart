import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Core/Style/assets.dart';
import '../../../../../Core/Style/icon_style.dart';
import '../../../../Calendar/Presentation/View/calendar_screen.dart';
import '../../../../Home/Presentation/View/home_screen.dart';
import '../../../../Notification/Presentation/View/notification_screen.dart';
import '../../BloC/MainCubit/main_screen_cubit.dart';
import '../../BloC/MainCubit/main_screen_state.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (_, state) {
        return Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButtonStyleWidget(
                icon: SvgPicture.asset(
                  state.currentPage == HomeScreen.id
                      ? SvgAssets.home
                      : SvgAssets.homeOutline,
                  width: 32,
                  height: 32,
                ),
                onPressed: () {
                  context.read<MainScreenCubit>().changePage(HomeScreen.id);
                },
              ),
              IconButtonStyleWidget(
                icon: SvgPicture.asset(
                  state.currentPage == CalendarScreen.id
                      ? SvgAssets.calendar
                      : SvgAssets.calendarOutline,
                  width: 32,
                  height: 32,
                ),
                onPressed: () {
                  context.read<MainScreenCubit>().changePage(CalendarScreen.id);
                },
              ),
              IconButtonStyleWidget(
                icon: SvgPicture.asset(
                  SvgAssets.notification,
                  width: 32,
                  height: 32,
                ),
                onPressed: () {
                  context.read<MainScreenCubit>().changePage(
                    NotificationScreen.id,
                  );
                },
              ),
              IconButtonStyleWidget(
                icon: SvgPicture.asset(SvgAssets.search, width: 32, height: 32),
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
