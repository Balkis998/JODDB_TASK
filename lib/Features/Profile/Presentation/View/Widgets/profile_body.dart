// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/Services/Spacer/spacer_static.dart';
import '../../../../../Core/Theme/text_theme.dart';
import '../../../../../Core/Widgets/form_widget.dart';
import '../../../../Calendar/Presentation/BloC/TaskCubit/task_cubit.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchFullName();
  }

  Future<void> fetchFullName() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    setState(() {
      fullNameController.text = doc.data()?['fullName'] ?? 'User';
      emailController.text = doc.data()?['email'] ?? 'email@gmail.com';
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personal Info',
              style: TextThemeStyle.textThemeStylePrimary.headlineLarge!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            StaticSpacer.spacer32,
            Text(
              'Email',
              style: TextThemeStyle.textThemeStylePrimary.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            StaticSpacer.spacer16,
            TextFormFieldWidget(
              hint: '',
              controller: emailController,
              readOnly: true,
            ),
            StaticSpacer.spacer32,
            Text(
              'FullName',
              style: TextThemeStyle.textThemeStylePrimary.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            StaticSpacer.spacer16,
            TextFormFieldWidget(
              hint: '',
              controller: fullNameController,
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}
