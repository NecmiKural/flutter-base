import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/features/auth/presentation/widgets/carousel.dart';
import 'package:base_app/features/auth/presentation/widgets/login_button.dart';
import 'package:base_app/features/auth/presentation/widgets/logo.dart';
import 'package:base_app/presentation/theme/colors.dart';
import 'package:base_app/presentation/theme/paddings.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.loginScreenBackGround,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                const AppPadding.verticalLSymmetric() +
                const AppPadding.horizontalLSymmetric(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Logo(), Carousel(), LoginButton()],
            ),
          ),
        ),
      ),
    );
  }
}
