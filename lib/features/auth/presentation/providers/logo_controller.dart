import 'dart:convert';
import 'dart:typed_data';
// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:base_app/main.dart';
// import 'package:base_app/models/backoffice_settings/backoffice_settings.dart';
// import 'package:base_app/utils/variables.dart' as variables;

///? how about bloc
/// in Riverpod you would use providers instead of controllers like in GetX.
/// The equivalent approach would be to create a StateNotifierProvider or a StateProvider depending on your needs.
/// For your LogoController example, you would create a LogoNotifier class that extends StateNotifier
/// and manages your logo state, then expose it through a StateNotifierProvider.
/// This provider would be consumed in your widgets using ref.watch() instead of GetBuilder or Obx.
/// Riverpod's providers serve the same purpose as GetX controllers
/// but follow a different pattern for state management and dependency injection.

// Define the state class for the logo controller
class LoginState {
  final bool isLoading;
  final String lightLogoString;
  final String darkLogoString;
  final Uint8List lightLogoPng;
  final Uint8List darkLogoPng;

  LoginState({
    this.isLoading = false,
    this.lightLogoString = '',
    this.darkLogoString = '',
    required this.lightLogoPng,
    required this.darkLogoPng,
  });

  // Create a copy of the state with updated values
  LoginState copyWith({
    bool? isLoading,
    String? lightLogoString,
    String? darkLogoString,
    Uint8List? lightLogoPng,
    Uint8List? darkLogoPng,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      lightLogoString: lightLogoString ?? this.lightLogoString,
      darkLogoString: darkLogoString ?? this.darkLogoString,
      lightLogoPng: lightLogoPng ?? this.lightLogoPng,
      darkLogoPng: darkLogoPng ?? this.darkLogoPng,
    );
  }
}

// Define the notifier class that will manage the logo state
class LogoNotifier extends StateNotifier<LoginState> {
  LogoNotifier()
    : super(LoginState(lightLogoPng: Uint8List(0), darkLogoPng: Uint8List(0))) {
    setLogo();
  }

  Future<void> setLogo() async {
    try {
      state = state.copyWith(isLoading: true);
      // final BackofficeSettings? backofficeSettings =
      //     await variables.userDataBox.get("backofficeSettings");

      // if (backofficeSettings != null) {
      //   final lightLogoPng = await _processAnyImage(
      //     base64String: backofficeSettings.lightLogo,
      //     context: navigatorKey.currentContext!,
      //   );
      //   final darkLogoPng = await _processAnyImage(
      //     base64String: backofficeSettings.darkLogo,
      //     context: navigatorKey.currentContext!,
      //   );

      //   state = state.copyWith(
      //     lightLogoPng: lightLogoPng,
      //     darkLogoPng: darkLogoPng,
      //     lightLogoString: backofficeSettings.lightLogo,
      //     darkLogoString: backofficeSettings.darkLogo,
      //     isLoading: false,
      //   );
      // }
    } catch (e) {
      // } catch (e, s) {
      // logger.e("error while setting logo= $e, stack= \n $s");
      state = state.copyWith(isLoading: false);
    }
  }

  // Helper methods for image processing
  // enum _ImageFormat { jpeg, png, svg, unknown }

  // Future<Uint8List> _processAnyImage({
  //   required String base64String,
  //   required BuildContext context,
  //   int? width,
  //   int? height,
  // }) async {
  //   try {
  //     // Clean the base64 string
  //     final String cleanBase64 =
  //         base64String.contains(',') ? base64String.split(',')[1] : base64String;

  //     if (!_isValidBase64(cleanBase64)) {
  //       throw Exception('Invalid base64 string');
  //     }

  //     // Decode base64 to bytes
  //     final Uint8List imageBytes = base64Decode(cleanBase64);

  //     // Detect format
  //     _ImageFormat format = _detectImageFormat(imageBytes);

  //     switch (format) {
  //       case _ImageFormat.jpeg:
  //       case _ImageFormat.png:
  //         // For PNG and JPEG, return bytes directly as they're already in the right format
  //         return imageBytes;
  //       case _ImageFormat.svg:
  //         // Convert SVG to PNG
  //         try {
  //           final String svgString = utf8.decode(imageBytes);
  //           final pictureInfo =
  //               await vg.loadPicture(SvgStringLoader(svgString), context);
  //           final image =
  //               await pictureInfo.picture.toImage(width ?? 100, height ?? 100);
  //           final byteData = await image.toByteData(format: ImageByteFormat.png);
  //           if (byteData == null) {
  //             throw Exception('Unable to convert SVG to PNG');
  //           }
  //           return byteData.buffer.asUint8List();
  //         } catch (e) {
  //           throw Exception('Failed to process SVG: $e');
  //         }
  //       case _ImageFormat.unknown:
  //         throw Exception('Unsupported or invalid image format');
  //     }
  //   } catch (e) {
  //     logger.e('Image processing failed: $e');
  //     rethrow;
  //   }
  // }

  // _ImageFormat _detectImageFormat(Uint8List bytes) {
  //   if (bytes.length < 8) return _ImageFormat.unknown;

  //   // Check JPEG signatures (can start with FF D8 FF)
  //   if (bytes[0] == 0xFF && bytes[1] == 0xD8 && bytes[2] == 0xFF) {
  //     return _ImageFormat.jpeg;
  //   }

  //   // Check PNG signature
  //   if (bytes[0] == 0x89 &&
  //       bytes[1] == 0x50 &&
  //       bytes[2] == 0x4E &&
  //       bytes[3] == 0x47 &&
  //       bytes[4] == 0x0D &&
  //       bytes[5] == 0x0A &&
  //       bytes[6] == 0x1A &&
  //       bytes[7] == 0x0A) {
  //     return _ImageFormat.png;
  //   }

  //   // Try to detect SVG by looking for XML or SVG tags
  //   try {
  //     String start = utf8.decode(bytes.sublist(0, min(100, bytes.length)));
  //     if (start.trim().toLowerCase().startsWith('<?xml') ||
  //         start.trim().toLowerCase().startsWith('<svg') ||
  //         start.toLowerCase().contains('<svg')) {
  //       return _ImageFormat.svg;
  //     }
  //   } catch (_) {}

  //   return _ImageFormat.unknown;
  // }

  // bool _isValidBase64(String str) {
  //   try {
  //     base64Decode(str.replaceAll(RegExp(r'\s+'), ''));
  //     return true;
  //   } catch (_) {
  //     return false;
  //   }
  // }
}

// Create a provider for the logo state
final logoProvider = StateNotifierProvider<LogoNotifier, LoginState>((ref) {
  return LogoNotifier();
});

// Helper function to display logo from base64 string
Widget getLogo(String base64String, {double? height, double? width}) {
  try {
    // Clean the base64 string
    final String cleanBase64 =
        base64String.contains(',') ? base64String.split(',')[1] : base64String;

    // Decode base64 to bytes
    final Uint8List bytes = base64Decode(cleanBase64);

    // Create an image from the bytes
    return Image.memory(
      bytes,
      height: height,
      width: width,
      fit: BoxFit.contain,
    );
  } catch (e) {
    // Return an empty container if there's an error
    return SizedBox(height: height, width: width);
  }
}
