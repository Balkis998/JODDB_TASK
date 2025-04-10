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
          Text(
            'اليوم',
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(15))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text('موسبيإ ميرول صن نم خسن ىلع',
                                style: TextThemeStyle.textThemeStyle.bodyLarge!
                                    .copyWith(
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary),
                          ),
                        ],
                      ),
                      StaticSpacer.spacer8,
                      Text(
                        '.موسبيإ ميرول صن نم خسن ىلع اًضيأ توح يتلاو ركيام جياب سودلأ لثم ينورتكلإلا رشنلا',
                        style:
                            TextThemeStyle.textThemeStyle.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              }),
          Text(
            'الخميس, 12/1/2025',
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(15))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text('موسبيإ ميرول صن نم خسن ىلع',
                                style: TextThemeStyle.textThemeStyle.bodyLarge!
                                    .copyWith(
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                        ],
                      ),
                      StaticSpacer.spacer8,
                      Text(
                        '.موسبيإ ميرول صن نم خسن ىلع اًضيأ توح يتلاو ركيام جياب سودلأ لثم ينورتكلإلا رشنلا',
                        style:
                            TextThemeStyle.textThemeStyle.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
