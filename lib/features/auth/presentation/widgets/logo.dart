import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/core/extensions/media_query_extension.dart';
import 'package:base_app/features/auth/presentation/providers/logo_controller.dart';

class Logo extends ConsumerWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logoState = ref.watch(logoProvider);

    return logoState.darkLogoString.isNotEmpty
        ? getLogo(logoState.darkLogoString, height: context.dynamicHeight(0.07))
        : SizedBox(height: context.dynamicHeight(0.07));
  }
}
