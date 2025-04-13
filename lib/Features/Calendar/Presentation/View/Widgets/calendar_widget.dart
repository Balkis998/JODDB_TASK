// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:joddb_app/Core/Widgets/main_button.dart';

import '../../../../../Core/Services/Spacer/spacer_static.dart';
import '../../../../../Core/Theme/app_colors.dart';
import '../../../../../Core/Theme/text_theme.dart';
import '../../../../Task/Presentation/View/task_screen.dart';
import 'gradinat_text_widget.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final startOfWeek = today.subtract(Duration(days: today.weekday % 7));
    final formattedMonth = DateFormat('MMM, yyyy').format(today);

    return Container(
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -7),
            color: AppColors.blackColor.withOpacity(0.02),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          StaticSpacer.spacer24,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                formattedMonth,
                style: TextThemeStyle.textThemeStylePrimary.headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              MainButton(
                text: '',
                width: 161,
                height: 55,
                widgetButton: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: AppColors.white),
                    Text(
                      'Add task',
                      style: TextThemeStyle.textThemeStyle.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, CreateTaskScreen.id);
                },
                radius: 75,
              ),
            ],
          ),
          Container(
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                final date = startOfWeek.add(Duration(days: index));
                final dayAbbreviation = DateFormat.E().format(
                  date,
                ); // Su, Mo...
                final dayNumber = date.day.toString();

                final isSelected =
                    selectedDate != null &&
                    date.year == selectedDate!.year &&
                    date.month == selectedDate!.month &&
                    date.day == selectedDate!.day;

                final isToday =
                    selectedDate == null &&
                    date.year == today.year &&
                    date.month == today.month &&
                    date.day == today.day;

                final isHighlighted = isSelected || isToday;

                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),

                    decoration: BoxDecoration(
                      color:
                          isHighlighted
                              ? AppColors.secondaryColor.withOpacity(0.1)
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isHighlighted
                            ? GradientText(
                              dayAbbreviation,
                              style:
                                  TextThemeStyle
                                      .textThemeStylePrimary
                                      .bodyLarge,
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.secondaryColor,
                                  AppColors.secondaryBLueColor,
                                ],
                              ),
                            )
                            : Text(
                              dayAbbreviation,
                              style: TextThemeStyle
                                  .textThemeStylePrimary
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                        SizedBox(height: 4),
                        isHighlighted
                            ? GradientText(
                              dayNumber,
                              style:
                                  TextThemeStyle
                                      .textThemeStylePrimary
                                      .bodyLarge,
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.secondaryColor,
                                  AppColors.secondaryBLueColor,
                                ],
                              ),
                            )
                            : Text(
                              dayNumber,
                              style: TextThemeStyle
                                  .textThemeStylePrimary
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
