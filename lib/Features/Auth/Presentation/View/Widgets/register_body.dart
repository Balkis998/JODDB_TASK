import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Core/Errors/common_ui.dart';
import '../../../../../Core/Services/Spacer/spacer_static.dart';
import '../../../../../Core/Style/assets.dart';
import '../../../../../Core/Theme/app_colors.dart';
import '../../../../../Core/Theme/text_theme.dart';
import '../../../../../Core/Widgets/custome_loding_widget.dart';
import '../../../../../Core/Widgets/form_validator.dart';
import '../../../../../Core/Widgets/form_widget.dart';
import '../../../../../Core/Widgets/main_button.dart';
import '../../../../../Core/Widgets/password_field.dart';
import '../../../../../Core/Widgets/text_button_widget.dart';
import '../../../../Main/Presentation/View/main_screen.dart';
import '../../BloC/AuthCubit/auth_cubit.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  _handleRegister() async {
    if (!_formKey.currentState!.validate()) {
      setState(() {
        autoValidate = AutovalidateMode.onUserInteraction;
      });
      return;
    }
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final name = _nameController.text;

    final authCubit = context.read<AuthCubit>();

    await authCubit.registerHandler(email, password, name);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
        ),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            autovalidateMode: autoValidate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: SvgPicture.asset(SvgAssets.arrowLeft),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                StaticSpacer.spacer16,

                Text(
                  'Sign Up',
                  style: TextThemeStyle.textThemeStyle.headlineLarge!.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                StaticSpacer.spacer16,

                TextButtonWidget(
                  text1: 'Already have an account?',
                  text2: 'Login',
                  mainAxisAlignment: MainAxisAlignment.start,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                StaticSpacer.spacer24,

                TextFormFieldWidget(
                  hint: 'Balqees Abaza',
                  title: 'FullName',
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  validator: (value) => FormValidato.textValidate(value),
                ),
                StaticSpacer.spacer16,
                TextFormFieldWidget(
                  hint: 'balqeesturk3@gmail.com',
                  title: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => FormValidato.isEmailValid(value),
                ),
                StaticSpacer.spacer16,
                PasswordField(
                  passwordController: _passwordController,
                  title: 'Password',
                  hintText: '******',
                  validator: (value) => FormValidato.isPasswordValid(value),
                ),

                StaticSpacer.spacer96,
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      Navigator.pushReplacementNamed(context, MainScreen.id);
                    } else if (state is AuthFailure) {
                      CommonUi.snackBar(context, state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return CustomLoadingIndicator();
                    }
                    return MainButton(
                      isGradiunt: true,
                      gradiuntColors: [
                        AppColors.secondaryColor,
                        AppColors.secondaryBLueColor,
                      ],
                      onPressed: _handleRegister,
                      width: double.infinity,
                      text: 'Sign Up',
                    );
                  },
                ),
                StaticSpacer.spacer8,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
