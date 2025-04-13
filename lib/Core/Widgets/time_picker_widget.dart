// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../Services/Spacer/spacer_static.dart';
import '../Theme/app_colors.dart';
import '../Theme/text_theme.dart';
import 'date_selected.dart';

class TimePickerWidget extends StatefulWidget {
  final TextEditingController controllerFrom;
  final TextEditingController controllerTo;

  final String? Function(String?)? validator;
  final String dateSelected;
  const TimePickerWidget({
    super.key,
    this.validator,
    required this.controllerFrom,
    required this.controllerTo,
    required this.dateSelected,
  });

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  DateTime selectedDateFrom = DateTime.now();

  DateSelected dateSelected = DateSelected();

  TimeOfDay timeFrom = TimeOfDay.now();
  TimeOfDay timeTo = TimeOfDay.now();

  Future _selectTime(BuildContext context) async {
    timeFrom = await dateSelected.selectTime(context, timeFrom);

    final DateTime parsedDate = DateFormat(
      'MMM d, yyyy',
    ).parse(widget.dateSelected);

    // Step 2: Combine parsed date with selected time
    final DateTime combinedDateTime = DateTime(
      parsedDate.year,
      parsedDate.month,
      parsedDate.day,
      timeFrom.hour,
      timeFrom.minute,
    );

    setState(() {
      widget.controllerFrom.text = DateFormat.jm().format(combinedDateTime);
    });
  }

  Future _selectTimeTo(BuildContext context) async {
    timeTo = await dateSelected.selectTimeTo(context, timeTo);

    final DateTime parsedDate = DateFormat(
      'MMM d, yyyy',
    ).parse(widget.dateSelected);

    // Step 2: Combine parsed date with selected time
    final DateTime combinedDateTime = DateTime(
      parsedDate.year,
      parsedDate.month,
      parsedDate.day,
      timeTo.hour,
      timeTo.minute,
    );

    // Step 3: Format time as AM/PM
    setState(() {
      widget.controllerTo.text = DateFormat.jm().format(
        combinedDateTime,
      ); // Example: 2:30 PM
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              _selectTime(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'Start Time',
                  style: TextThemeStyle.textThemeStyle.bodyLarge!.copyWith(
                    color: AppColors.titleColor,
                  ),
                ),
                StaticSpacer.spacer16,
                Text(
                  widget.controllerFrom.text,
                  style: TextThemeStyle.textThemeStyle.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),

        Expanded(
          child: GestureDetector(
            onTap: () {
              _selectTimeTo(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'End Time',
                  style: TextThemeStyle.textThemeStyle.bodyLarge!.copyWith(
                    color: AppColors.titleColor,
                  ),
                ),
                StaticSpacer.spacer16,

                Text(
                  widget.controllerTo.text,
                  style: TextThemeStyle.textThemeStyle.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
