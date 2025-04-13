import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Theme/app_colors.dart';
import '../../../Profile/Presentation/View/Widgets/profile_appbar.dart';
import 'Widgets/setting_body.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = 'SettingsScreen';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: ProfileAppbar(),
      ),
      body: SettingBody(),
    );
  }
}
