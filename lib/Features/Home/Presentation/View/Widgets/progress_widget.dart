// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../Core/Services/Spacer/spacer_static.dart';
import '../../../../../Core/Style/assets.dart';
import '../../../../../Core/Theme/app_colors.dart';
import '../../../../../Core/Theme/text_theme.dart';
import 'gradiant_widget.dart';

class ProgressWidget extends StatelessWidget {
  final String text;
  const ProgressWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextThemeStyle.textThemeStylePrimary.headlineSmall!.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          StaticSpacer.spacer32,
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (_, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blackColor.withOpacity(0.02),

                      offset: Offset(0, -7),
                      blurRadius: 23,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(
                    'Design Changes',
                    style: TextThemeStyle.textThemeStylePrimary.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    '2 Days ago',
                    style: TextThemeStyle.textThemeStylePrimary.bodySmall!
                        .copyWith(color: AppColors.primary),
                  ),
                  leading: GradiantWidget(assetName: SvgAssets.list),
                  trailing: SvgPicture.asset(SvgAssets.menu),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
