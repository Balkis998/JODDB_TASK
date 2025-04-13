import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Theme/app_colors.dart';
import '../../../Calendar/Presentation/View/calendar_screen.dart';
import '../../../Home/Presentation/View/home_screen.dart';
import '../../../Notification/Presentation/View/notification_screen.dart';
import '../BloC/MainCubit/main_screen_cubit.dart';
import '../BloC/MainCubit/main_screen_state.dart';
import 'Widgets/bottom_nav_widget.dart';
import 'Widgets/main_appbar.dart';

class MainScreen extends StatelessWidget {
  static const String id = 'MainScreen';

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenCubit(),
      child: BlocBuilder<MainScreenCubit, MainScreenState>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.backgroundColor,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70.h),
                child: MainAppbar(),
              ),

              resizeToAvoidBottomInset: false,
              bottomNavigationBar: const BottomNavWidget(),
              // drawer: const DrawerScreen(),
              body: _getScreenFromId(state.currentPage),
            ),
          );
        },
      ),
    );
  }

  Widget _getScreenFromId(String pageId) {
    switch (pageId) {
      case HomeScreen.id:
        return const HomeScreen();
      case CalendarScreen.id:
        return const CalendarScreen();

      case NotificationScreen.id:
        return const NotificationScreen();

      default:
        return const HomeScreen();
    }
  }
}
//