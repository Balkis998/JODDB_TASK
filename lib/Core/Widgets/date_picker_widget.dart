import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Language/config.dart';
import '../Style/assets.dart';
import '../Theme/app_colors.dart';
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
      firstDate: DateTime(1700),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        widget.controller.text =
            '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormFieldWidget(
        hint: widget.hint,
        controller: widget.controller,
        keyboardType: TextInputType.text,
        readOnly: true,
        validator: widget.validator,
        suffixIcon: IconButton(
          icon: SvgPicture.asset(SvgAssets.calendar),
          onPressed: () => selectDate(context),
        ),
      ),
    );
  }
}
