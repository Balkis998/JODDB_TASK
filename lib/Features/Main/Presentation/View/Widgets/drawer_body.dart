// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../Core/Language/key_lang.dart';
import '../../../../../Core/Services/Spacer/spacer_static.dart';
import '../../../../../Core/Style/assets.dart';
import '../../../../../Core/Theme/app_colors.dart';
import '../../../../../Core/Theme/text_theme.dart';
import '../../../../../Core/Utils/locator.dart';
import '../../../../../Core/Widgets/custome_loding_widget.dart';
import '../../../../Auth/Presentation/BloC/AuthCubit/auth_cubit.dart';
import '../../../../Auth/Presentation/View/login_screen.dart';

final ScrollController scrollController = ScrollController();

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: Container(
        color: Colors.white,
        height: double.infinity,
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(ImageAssets.logo),
            StaticSpacer.spacer16,
            ListTile(
              leading: SvgPicture.asset(SvgAssets.user),
              title: Text(
                'Profile',
                style: TextThemeStyle.textThemeStyle.bodyLarge!.copyWith(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                // Navigator.pushNamed(context, ProfileScreen.id);
              },
            ),

            ListTile(
              leading: SvgPicture.asset(SvgAssets.clock),
              title: Text(
                'Calendar',
                style: TextThemeStyle.textThemeStyle.bodyLarge!.copyWith(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                // Navigator.pushNamed(context, AttendanceFilterScreen.id);
              },
            ),

            ListTile(
              leading: SvgPicture.asset(SvgAssets.setting),
              title: Text(
                'Settings',
                style: TextThemeStyle.textThemeStyle.bodyLarge!.copyWith(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                // Navigator.pushNamed(context, SettingsScreen.id);
              },
            ),
            const Spacer(),
            BlocConsumer<AuthCubit, AuthState>(
              builder: (_, state) {
                if (state is AuthLoading) {
                  return const CustomLoadingIndicator();
                }

                return ListTile(
                  onTap: () async {
                    final logoutCubit = context.read<AuthCubit>();

                    await logoutCubit.logout();
                  },
                  leading: SvgPicture.asset(SvgAssets.logout),
                  title: Text(
                    KeyLang.logout.tr(),
                    style: TextThemeStyle.textThemeStyle.bodyLarge!.copyWith(
                      color: AppColors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
              listener: (context, state) {
                if (state is AuthFailure) {
                  var sharedPreferences = locator<SharedPreferences>();
                  sharedPreferences.clear().then((v) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginScreen.id,
                      (route) => false,
                    );
                  });
                } else if (state is AuthSuccess) {
                  var sharedPreferences = locator<SharedPreferences>();
                  sharedPreferences.clear().then((v) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginScreen.id,
                      (route) => false,
                    );
                  });
                }
              },
            ),

            StaticSpacer.spacer96,
          ],
        ),
      ),
    );
  }
}
