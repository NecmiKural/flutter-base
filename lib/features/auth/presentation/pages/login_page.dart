import 'package:flutter/material.dart';
import 'package:base_app/features/auth/presentation/widgets/sign_in_from.dart';
import 'package:base_app/presentation/theme/paddings.dart';
import 'package:base_app/presentation/widgets/custom_text.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              const AppPadding.verticalLSymmetric() +
              const AppPadding.horizontalLSymmetric(),
          child: Container(
            // background image
            decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage(Assets.icons.roofLogo.path),
              //   fit: BoxFit.contain,
              // ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[const CustomText(null), SignInForm()],
            ),
          ),
        ),
      ),
    );
  }
}
