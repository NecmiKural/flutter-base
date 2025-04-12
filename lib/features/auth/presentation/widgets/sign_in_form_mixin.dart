import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/features/auth/presentation/widgets/sign_in_from.dart';

import 'package:flutter/material.dart';

import '../providers/provider.dart';

mixin SignInFormMixin on ConsumerState<SignInForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final double inputFieldWidth = 300;

  @override
  void initState() {
    emailController.text = "";
    passwordController.text = "";
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signIn() async {
    // if (formKey.currentState!.validate()) {
    // final email = emailController.text;
    // final password = passwordController.text;
    // final authModel = AuthModel(email: email, password: password);

    if (mounted) {
      final viewModel = ref.read(authViewModelProvider);

      if (!viewModel.isDisposed) {
        await viewModel.performAuth();
      }
    }
    // .showLoading(context: context);
    // }
  }
}
