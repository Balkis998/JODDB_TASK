import 'package:flutter/material.dart';

import '../../../../../Core/Services/Spacer/spacer_static.dart';
import '../../../../../Core/Theme/app_colors.dart';
import '../../../../../Core/Theme/text_theme.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StaticSpacer.spacer16,

          Text(
            'Today',
            style: TextThemeStyle.textThemeStyle.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
              color: const Color(0xFFD2D5DA),
            ),
          ),
          StaticSpacer.spacer16,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, er adipiscing elit, sed dianummy nibh euismod  dolor sit amet',
                            style: TextThemeStyle.textThemeStyle.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          StaticSpacer.spacer16,

          Text(
            'Sunday, 13/04/2025',
            style: TextThemeStyle.textThemeStyle.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
              color: const Color(0xFFD2D5DA),
            ),
          ),
          StaticSpacer.spacer16,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      'Lorem ipsum dolor sit amet, er adipiscing elit',
                      style: TextThemeStyle.textThemeStyle.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
