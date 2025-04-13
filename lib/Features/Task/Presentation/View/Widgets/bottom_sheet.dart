import 'package:flutter/material.dart';

import '../../../../../Core/Services/Spacer/spacer_static.dart';
import '../../../../../Core/Theme/app_colors.dart';
import '../../../../../Core/Theme/text_theme.dart';
import '../../../../../Core/Widgets/form_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        'Start Time',
                        style: TextThemeStyle.textThemeStyle.bodyLarge!
                            .copyWith(color: AppColors.titleColor),
                      ),
                      StaticSpacer.spacer16,
                      Text(
                        '00:00 PM',
                        style: TextThemeStyle.textThemeStyle.titleLarge!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: GestureDetector(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Time',
                        style: TextThemeStyle.textThemeStyle.bodyLarge!
                            .copyWith(color: AppColors.titleColor),
                      ),
                      StaticSpacer.spacer16,

                      Text(
                        '00:00 PM',
                        style: TextThemeStyle.textThemeStyle.titleLarge!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Divider(color: AppColors.titleColor, height: 48),
          TextFormFieldWidget(
            hint:
                'Lorem ipsum dolor sit amet, er adipiscing elit, sed dianummy nibh euismod  dolor sit amet, er adipiscing elit, sed dianummy nibh euismod.',
            title: 'Description',
            isUnderLine: true,
            style: TextThemeStyle.textThemeStyle.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
            ),
            maxLines: 4,
            titleColor: AppColors.titleColor,
          ),
          StaticSpacer.spacer48,
          Text(
            'Category',
            style: TextThemeStyle.textThemeStyle.bodyLarge!.copyWith(
              color: AppColors.titleColor,
            ),
          ),
        ],
      ),
    );
  }
}
