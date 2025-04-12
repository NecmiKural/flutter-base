import 'package:cached_network_image/cached_network_image.dart';
// import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:base_app/presentation/theme/colors.dart';

/// A widget that displays the user's avatar.
///
/// This widget is used to display the user's avatar image.
/// The image is fetched from the provided URL.
/// If the image is not available, a default avatar image is displayed.
/// The default avatar image is based on
/// the user's
/// gender.
class UserAvatar extends StatelessWidget {
  /// A widget that displays the user's avatar.
  ///
  /// This widget is used to display the user's avatar image.
  ///
  /// The image is fetched from the provided URL.
  /// If the image is not available, a default avatar image is displayed.
  ///
  /// **The default avatar image is based on
  /// the user's
  /// gender**.
  const UserAvatar({
    required this.imageUrl,
    super.key,
    this.size = 32,
    this.gender,
  });

  /// imageUrl: The URL of the user's avatar image.
  final String imageUrl;

  /// size: The size of the avatar image. The default value is 32.
  final double? size;

  /// gender: The gender of the user. The default value is null.
  final String? gender;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        );
      },
      width: size,
      height: size,

      /// If the image is not available, a default avatar image is displayed.
      /// based on the user's gender.
      errorWidget:
          (context, url, error) => Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundColor[60],
              shape: BoxShape.circle,
              // image: DecorationImage(
              //   image: AssetImage(
              //     gender == LocaleKeys.common_gender.tr(gender: "female")
              //         ? Assets.images.femaleAvatar.path
              //         : Assets.images.maleAvatar.path,
              //   ),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),

      /// If the image is not available, a default avatar image is displayed.
      placeholder:
          (context, url) => Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundColor[60],
              shape: BoxShape.circle,
              // image: DecorationImage(
              //   image: AssetImage(
              //     gender == LocaleKeys.common_gender.tr(gender: "female")
              //         ? Assets.images.femaleAvatar.path
              //         : Assets.images.maleAvatar.path,
              //   ),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
    );
  }
}
