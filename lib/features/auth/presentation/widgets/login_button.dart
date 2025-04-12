import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/core/extensions/media_query_extension.dart';
import 'package:base_app/core/utils/i18n_helper.dart';
import 'package:base_app/features/auth/presentation/providers/login_provider.dart';
import 'package:base_app/presentation/widgets/custom_text.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);

    return SizedBox(
      height: context.dynamicHeight(0.07),
      width: context.dynamicWidth(0.8),
      // u can create custom one for this
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromRGBO(30, 33, 49, 1),
          disabledBackgroundColor: const Color.fromRGBO(30, 33, 49, 1),
          shadowColor: Colors.transparent,
        ),
        onPressed: () => ref.read(loginProvider.notifier).startAuth(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loginState.isLogging
                ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
                : const Icon(Icons.login, color: Colors.white54, size: 30),
            SizedBox(width: context.dynamicWidth(0.02)),
            //  CustomText(I18n.get((l) => l.login, fallback: 'Login')),
            CustomText(I18n.localizations?.login ?? "Login"),
            //  CustomText(I18n.localizationService.localizations!.login),
          ],
        ),
      ),
    );
  }
}
