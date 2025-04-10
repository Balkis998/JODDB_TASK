import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Style/assets.dart';
import '../Theme/app_colors.dart';
import '../Theme/text_theme.dart';

class AttachmentUtils {
  static Future<void> showAttachmentOptions({
    required BuildContext context,
    required VoidCallback onPickImage,
    required VoidCallback onPickFile,
  }) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          color: AppColors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: SvgPicture.asset(
                  SvgAssets.gallery,
                ),
                title: Text(
                  "ارفاق صورة",
                  style: TextThemeStyle.textThemeStyle.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.mainColor,
                      fontSize: 14),
                ),
                onTap: () {
                  Navigator.pop(context);

                  onPickImage();
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  SvgAssets.folder,
                  width: 24,
                  height: 24,
                ),
                title: Text(
                  "ارفاق ملف",
                  style: TextThemeStyle.textThemeStyle.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.mainColor,
                      fontSize: 14),
                ),
                onTap: () {
                  Navigator.pop(context);

                  onPickFile();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
