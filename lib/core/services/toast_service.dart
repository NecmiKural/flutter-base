import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

final toastServiceProvider = Provider<ToastService>((ref) {
  return ToastService();
});

class ToastService {
  /// Show a success toast notification
  void showSuccess(
    BuildContext context, {
    required String title,
    String? description,
    Duration? duration,
  }) {
    _showToast(
      context,
      title: title,
      description: description,
      type: ToastificationType.success,
      duration: duration,
    );
  }

  /// Show an error toast notification
  void showError(
    BuildContext context, {
    required String title,
    String? description,
    Duration? duration,
  }) {
    _showToast(
      context,
      title: title,
      description: description,
      type: ToastificationType.error,
      duration: duration,
    );
  }

  /// Show a warning toast notification
  void showWarning(
    BuildContext context, {
    required String title,
    String? description,
    Duration? duration,
  }) {
    _showToast(
      context,
      title: title,
      description: description,
      type: ToastificationType.warning,
      duration: duration,
    );
  }

  /// Show an info toast notification
  void showInfo(
    BuildContext context, {
    required String title,
    String? description,
    Duration? duration,
  }) {
    _showToast(
      context,
      title: title,
      description: description,
      type: ToastificationType.info,
      duration: duration,
    );
  }

  /// Private method to show a toast notification
  void _showToast(
    BuildContext context, {
    required String title,
    String? description,
    required ToastificationType type,
    Duration? duration,
  }) {
    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: duration ?? const Duration(seconds: 4),
      title: Text(title),
      description: description != null ? Text(description) : null,
      alignment: Alignment.topRight,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(1, 0),
            end: const Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
      borderRadius: BorderRadius.circular(12),
      showProgressBar: true,
      closeButton: ToastCloseButton(
        buttonBuilder: (context, close) {
          return IconButton(icon: const Icon(Icons.close), onPressed: close);
        },
      ),
    );
  }
}
