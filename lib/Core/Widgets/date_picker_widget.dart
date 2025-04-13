import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../Language/config.dart';
import '../Theme/app_colors.dart';
import '../Theme/text_theme.dart';
import 'form_widget.dart';

class DatePickerField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;

  const DatePickerField({
    super.key,
    required this.controller,
    required this.hint,
    this.validator,
  });

  @override
  DatePickerFieldState createState() => DatePickerFieldState();
}

class DatePickerFieldState extends State<DatePickerField> {
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      locale: ConfigLanguage.enLocale,
      builder: (_, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.mainColor,
            colorScheme: ColorScheme.light(primary: AppColors.secondaryColor),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2043),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        widget.controller.text = DateFormat('MMM d, yyyy').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormFieldWidget(
        hint: widget.hint,
        title: 'Date',
        titleColor: AppColors.white,
        style: TextThemeStyle.textThemeStyle.titleLarge!.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        controller: widget.controller,
        keyboardType: TextInputType.text,
        readOnly: true,
        isUnderLine: true,
        validator: widget.validator,
        onTap: () => selectDate(context),
      ),
    );
  }
}
