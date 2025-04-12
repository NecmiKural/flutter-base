import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/core/extensions/media_query_extension.dart';
import 'package:base_app/presentation/widgets/custom_text.dart';

class Carousel extends ConsumerWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.dynamicHeight(0.1),
      child: CustomText("add ur carousel here", color: Colors.white),
    );
  }
}
