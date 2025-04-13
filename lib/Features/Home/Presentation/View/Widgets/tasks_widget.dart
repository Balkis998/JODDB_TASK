// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../Core/Services/Spacer/spacer_static.dart';
import '../../../../../Core/Style/assets.dart';
import '../../../../../Core/Theme/app_colors.dart';
import '../../../../../Core/Theme/text_theme.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  TasksWidgetState createState() => TasksWidgetState();
}

class TasksWidgetState extends State<TasksWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.5);
  int _currentIndex = 0;

  final List<Color> colors = [Colors.purple, Colors.blue];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int newPage = _pageController.page!.round();
      if (_currentIndex != newPage) {
        setState(() {
          _currentIndex = newPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(colors.length, (index) {
        bool isActive = index == _currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 10,
          width: isActive ? 42 : 10,
          decoration: BoxDecoration(
            gradient:
                isActive
                    ? LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.secondaryColor,
                        AppColors.secondaryBLueColor,
                      ],
                      stops: [-0.1349, 1.0975],
                    )
                    : null,
            color: AppColors.formBorderColor,
            borderRadius: BorderRadius.circular(12),
          ),
        );
      }),
    );
  }

  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (index) {
            final isSelected = selectedTabIndex == index;
            final labels = ['My Tasks', 'In-progress', 'Completed'];

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedTabIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75),
                  color: isSelected ? AppColors.white : AppColors.lightColor,
                ),
                child: Text(
                  labels[index],
                  style: TextThemeStyle.textThemeStylePrimary.bodyMedium!
                      .copyWith(
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w500,
                      ),
                ),
              ),
            );
          }),
        ),
        StaticSpacer.spacer24,

        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            itemCount: colors.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.secondaryColor,
                        AppColors.secondaryBLueColor,
                      ],
                    ),

                    borderRadius: BorderRadius.circular(24),
                  ),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Image.asset(ImageAssets.cardTop, width: 80),
                      ),
                      Positioned(
                        left: 0,
                        bottom: -70,
                        child: Image.asset(ImageAssets.cardBottom, width: 80),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.white.withOpacity(0.2),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(SvgAssets.think),
                                  ),
                                ),
                                StaticSpacer.spacer16W,

                                Expanded(
                                  child: Text(
                                    'Project 1',
                                    style: TextThemeStyle
                                        .textThemeStylePrimary
                                        .bodyLarge!
                                        .copyWith(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ],
                            ),

                            Text(
                              'Front-End Development',
                              style: TextThemeStyle
                                  .textThemeStylePrimary
                                  .headlineSmall!
                                  .copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),

                            Text(
                              'October 20, 2020',
                              style: TextThemeStyle
                                  .textThemeStylePrimary
                                  .bodyLarge!
                                  .copyWith(color: AppColors.white),
                            ),
                            StaticSpacer.spacer4,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        _buildIndicator(),
      ],
    );
  }
}
