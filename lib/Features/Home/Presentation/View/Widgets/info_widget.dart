import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/Services/Spacer/spacer_static.dart';
import '../../../../../Core/Theme/app_colors.dart';
import '../../../../../Core/Theme/text_theme.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({super.key});

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  String? fullName;

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
      fullName = doc.data()?['fullName'] ?? 'User';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, ${fullName ?? ''}!',
            style: TextThemeStyle.textThemeStylePrimary.headlineLarge!.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          StaticSpacer.spacer8,
          Text(
            'Have a nice day.',
            style: TextThemeStyle.textThemeStylePrimary.bodyLarge!.copyWith(
              color: AppColors.mainColor,
            ),
          ),
          StaticSpacer.spacer24,
        ],
      ),
    );
  }
}
