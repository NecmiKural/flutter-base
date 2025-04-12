import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/presentation/theme/colors.dart';
import 'package:base_app/presentation/theme/paddings.dart';
import 'package:base_app/presentation/theme/spacing_sized.dart';
import 'package:base_app/presentation/widgets/buttons/buttons_import.dart';
import 'package:base_app/src/generated/i10n/app_localizations.dart';

import 'sign_in_form_mixin.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> with SignInFormMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        color: AppColors.backgroundColor[60]?.withValues(alpha: 0.9),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Padding(
            padding:
                const AppPadding.horizontalxLSymmetric() +
                const AppPadding.verticalxLSymmetric(),
            child: SizedBox(
              width: inputFieldWidth,
              child: Column(
                spacing: SpacingSizes.large,
                children: [
                  Row(
                    children: [
                      ResponsiveElevatedButton(
                        onPressed: signIn,
                        child: Text(AppLocalizations.of(context).login),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
