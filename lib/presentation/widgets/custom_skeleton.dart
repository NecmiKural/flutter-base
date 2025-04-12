import 'package:flutter/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeleton extends StatelessWidget {
  final bool enabled;
  const CustomSkeleton({
    required this.child,
    super.key,
    this.enabled = true,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      effect: const PulseEffect(),
      child: child,
    );
  }
}
