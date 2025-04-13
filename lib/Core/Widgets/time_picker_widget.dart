// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:joddb_app/Core/Widgets/form_widget.dart';

import '../Services/Spacer/spacer_static.dart';
import '../Theme/app_colors.dart';
import '../Theme/text_theme.dart';
import 'date_selected.dart';

class TimePickerWidget extends StatefulWidget {
  final TextEditingController controllerFrom;
  final TextEditingController controllerTo;
  final String? Function(String?)? validator;
  const TimePickerWidget({
    super.key,
    this.validator,
    required this.controllerFrom,
    required this.controllerTo,
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

    DateTime now = DateTime.now();

    final selectedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      timeFrom.hour,
      timeFrom.minute,
    );

    setState(() {
      widget.controllerFrom.text = DateFormat.jm().format(selectedDateTime);
    });
  }

  Future _selectTimeTo(BuildContext context) async {
    timeTo = await dateSelected.selectTimeTo(context, timeTo);

    DateTime now = DateTime.now();

    final selectedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      timeTo.hour,
      timeTo.minute,
    );

    setState(() {
      widget.controllerTo.text = DateFormat.jm().format(selectedDateTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
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
              TextFormFieldWidget(
                hint: '--:--',
                onTap: () {
                  _selectTime(context);
                },
                style: TextThemeStyle.textThemeStyle.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                readOnly: true,
                controller: widget.controllerFrom,
                validator: widget.validator,
                borderColor: Colors.transparent,
                focusBorderColor: Colors.transparent,
              ),
            ],
          ),
        ),

        Expanded(
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

              TextFormFieldWidget(
                hint: '--:--',
                onTap: () {
                  _selectTimeTo(context);
                },
                style: TextThemeStyle.textThemeStyle.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                readOnly: true,
                controller: widget.controllerTo,
                validator: widget.validator,
                borderColor: Colors.transparent,
                focusBorderColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
