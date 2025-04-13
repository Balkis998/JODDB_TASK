// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:joddb_app/Core/Widgets/main_button.dart';

import '../../../../../Core/Errors/common_ui.dart';
import '../../../../../Core/Services/Spacer/spacer_static.dart';
import '../../../../../Core/Style/assets.dart';
import '../../../../../Core/Theme/app_colors.dart';
import '../../../../../Core/Theme/text_theme.dart';
import '../../../../../Core/Widgets/date_picker_widget.dart';
import '../../../../../Core/Widgets/form_validator.dart';
import '../../../../../Core/Widgets/form_widget.dart';
import '../../../../../Core/Widgets/time_picker_widget.dart';
import '../../../../Calendar/Presentation/View/Widgets/calendar_appbar.dart';
import '../../../Model/category.dart';

class CreateTaskBody extends StatefulWidget {
  const CreateTaskBody({super.key});

  @override
  State<CreateTaskBody> createState() => _CreateTaskBodyState();
}

class _CreateTaskBodyState extends State<CreateTaskBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _timeFromController = TextEditingController();
  final TextEditingController _timeToController = TextEditingController();

  int selectedIndex = 0;

  _handleAddTask() async {
    if (!_formKey.currentState!.validate()) {
      setState(() {
        autoValidate = AutovalidateMode.onUserInteraction;
      });
      return;
    }
    final task = {
      'name': _nameController.text,
      'date': _dateController.text,
      'desc': _descController.text,
      'timeFrom': _timeFromController.text,
      'timeTo': _timeToController.text,
      'category': categoryList[selectedIndex]['name'],
      'categoryID': categoryList[selectedIndex]['id'],
    };

    final box = Hive.box('tasksBox');
    await box.add(task);

    CommonUi.simpleToast(message: 'Task added successfully!');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: autoValidate,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 320,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.secondaryColor,
                    AppColors.secondaryBLueColor,
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Image.asset(ImageAssets.cardTop, width: 200),
                  ),
                  Positioned(
                    left: 0,
                    bottom: -100,
                    child: Image.asset(ImageAssets.cardBottom, width: 200),
                  ),

                  Column(
                    children: [
                      CalendarAppbar(
                        title: Text(
                          'Create a Task',
                          style: TextThemeStyle.textThemeStylePrimary.bodyLarge!
                              .copyWith(color: AppColors.white),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      StaticSpacer.spacer16,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            TextFormFieldWidget(
                              hint: 'Design Changes',
                              title: 'Name',
                              isUnderLine: true,
                              style: TextThemeStyle.textThemeStyle.titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                              validator:
                                  (value) => FormValidato.textValidate(value),
                              controller: _nameController,
                              titleColor: AppColors.white,
                            ),
                            StaticSpacer.spacer16,
                            DatePickerField(
                              controller: _dateController,
                              hint: 'Oct 23, 2020',
                              validator:
                                  (value) => FormValidato.textValidate(value),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              transform: Matrix4.translationValues(
                0.0,
                -25.0,
                0.0,
              ), // Pull it upward
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  TimePickerWidget(
                    controllerFrom: _timeFromController,
                    controllerTo: _timeToController,
                    validator: (value) => FormValidato.textValidate(value),
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
                    validator: (value) => FormValidato.textValidate(value),
                    maxLines: 4,
                    titleColor: AppColors.titleColor,
                    controller: _descController,
                  ),
                  StaticSpacer.spacer48,
                  Text(
                    'Category',
                    style: TextThemeStyle.textThemeStyle.bodyLarge!.copyWith(
                      color: AppColors.titleColor,
                    ),
                  ),
                  StaticSpacer.spacer16,
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      childAspectRatio: 4 / 2,
                    ),
                    padding: EdgeInsets.zero,
                    itemCount: categoryList.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          width: 150,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(75),
                            color: AppColors.white,
                            gradient:
                                selectedIndex == index
                                    ? LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        AppColors.secondaryColor,
                                        AppColors.secondaryBLueColor,
                                      ],
                                    )
                                    : null,
                          ),
                          child: Center(
                            child: Text(
                              categoryList[index]['name'],
                              style: TextThemeStyle
                                  .textThemeStylePrimary
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color:
                                        selectedIndex == index
                                            ? AppColors.white
                                            : AppColors.mainColor,
                                  ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  StaticSpacer.spacer48,
                  MainButton(
                    text: 'Create Task',
                    width: double.infinity,
                    height: 60,
                    radius: 75,
                    onPressed: _handleAddTask,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
