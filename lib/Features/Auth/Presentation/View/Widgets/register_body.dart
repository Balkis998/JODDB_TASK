import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/Errors/common_ui.dart';
import '../../../../../Core/Widgets/form_validator.dart';
import '../../../../../Core/Widgets/form_widget.dart';
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
        return Form(
          key: _formKey,
          autovalidateMode: autoValidate,
          child: Column(
            children: [
              TextFormFieldWidget(
                hint: 'balqeesturk3@gmail.com',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => FormValidato.isEmailValid(value),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) => FormValidato.isPasswordValid(value),
              ),
              const SizedBox(height: 20),
              if (state is AuthLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: _handleRegister,
                  child: Text('Register'),
                ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text("Already have an account? Login"),
              ),
            ],
          ),
        );
      },
    );
  }
}
