import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/Errors/common_ui.dart';
import '../../../../../Core/Services/Spacer/spacer_static.dart';
import '../../../../../Core/Theme/app_colors.dart';
import '../../../../../Core/Theme/text_theme.dart';
import '../../../../../Core/Widgets/custome_loding_widget.dart';
import '../../../../../Core/Widgets/form_validator.dart';
import '../../../../../Core/Widgets/form_widget.dart';
import '../../../../../Core/Widgets/main_button.dart';
import '../../../../../Core/Widgets/password_field.dart';
import '../../../../Main/Presentation/View/main_screen.dart';
import '../../BloC/AuthCubit/auth_cubit.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      setState(() {
        autoValidate = AutovalidateMode.onUserInteraction;
      });
      return;
    }
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final authCubit = context.read<AuthCubit>();

    await authCubit.loginHandler(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, MainScreen.id);
        } else if (state is AuthFailure) {
          CommonUi.snackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 128),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),

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
                children: [
                  Text(
                    'Login',
                    style: TextThemeStyle.textThemeStyle.headlineLarge!
                        .copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      // setState(() => _isLogin = !_isLogin);
                    },
                    child: Text("Don't have an account? Register"),
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Remember me'),
                      TextButton(
                        onPressed: () {},
                        child: Text("Forgot Password ?"),
                      ),
                    ],
                  ),
                  StaticSpacer.spacer48,

                  // if (state is AuthLoading)
                  //   const CustomLoadingIndicator()
                  // else
                  MainButton(
                    isGradiunt: true,
                    gradiuntColors: [
                      AppColors.secondaryColor,
                      AppColors.blackColor,
                    ],
                    onPressed: _handleLogin,
                    width: double.infinity,
                    text: 'Login',
                  ),
                  StaticSpacer.spacer8,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
