// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:base_app/presentation/theme/spacing_sized.dart';

/// A utility class that provides predefined padding values and EdgeInsets
/// configurations for consistent spacing throughout the app.
class AppPadding extends EdgeInsets {
  /// EdgeInsets with symmetric horizontal xxsmall padding. `4`
  const AppPadding.horizontalxxSSymmetric()
    : super.symmetric(horizontal: SpacingSizes.extraExtraSmall);

  /// EdgeInsets with symmetric horizontal xsmall padding. `8`
  const AppPadding.horizontalxsSymmetric()
    : super.symmetric(horizontal: SpacingSizes.extraSmall);

  /// EdgeInsets with symmetric horizontal small padding. `16`
  const AppPadding.horizontalSSymmetric()
    : super.symmetric(horizontal: SpacingSizes.small);

  /// EdgeInsets with symmetric horizontal medium padding. `24`
  const AppPadding.horizontalMSymmetric()
    : super.symmetric(horizontal: SpacingSizes.medium);

  /// EdgeInsets with symmetric horizontal large padding. `32`
  const AppPadding.horizontalLSymmetric()
    : super.symmetric(horizontal: SpacingSizes.large);

  /// EdgeInsets with symmetric horizontal extra large padding. `64`
  const AppPadding.horizontalxLSymmetric()
    : super.symmetric(horizontal: SpacingSizes.extraExtraLarge);

  /// EdgeInsets with symmetric vertical xxsmall padding. `4`
  const AppPadding.verticalxxSSymmetric()
    : super.symmetric(vertical: SpacingSizes.extraExtraSmall);

  /// EdgeInsets with symmetric vertical xsmall padding. `8`
  const AppPadding.verticalxsSymmetric()
    : super.symmetric(vertical: SpacingSizes.extraSmall);

  /// EdgeInsets with symmetric vertical small padding. `16`
  const AppPadding.verticalSSymmetric()
    : super.symmetric(vertical: SpacingSizes.small);

  /// EdgeInsets with symmetric vertical medium padding. `24`
  const AppPadding.verticalMSymmetric()
    : super.symmetric(vertical: SpacingSizes.medium);

  /// EdgeInsets with symmetric vertical large padding. `32`
  const AppPadding.verticalLSymmetric()
    : super.symmetric(vertical: SpacingSizes.large);

  /// EdgeInsets with symmetric vertical extra large padding. `64`
  const AppPadding.verticalxLSymmetric()
    : super.symmetric(vertical: SpacingSizes.extraExtraLarge);

  /// EdgeInsets with small padding only on specified sides. `4`
  ///
  /// [left], [right], [top], and [bottom] determine which sides have padding.
  const AppPadding.xxsmallOnlyPadding({
    bool left = false,
    bool right = false,
    bool top = false,
    bool bottom = false,
  }) : super.only(
         left: left ? SpacingSizes.extraExtraSmall : 0,
         right: right ? SpacingSizes.extraExtraSmall : 0,
         top: top ? SpacingSizes.extraExtraSmall : 0,
         bottom: bottom ? SpacingSizes.extraExtraSmall : 0,
       );

  /// EdgeInsets with small padding only on specified sides. `8`
  ///
  /// [left], [right], [top], and [bottom] determine which sides have padding.
  const AppPadding.xsmallOnlyPadding({
    bool left = false,
    bool right = false,
    bool top = false,
    bool bottom = false,
  }) : super.only(
         left: left ? SpacingSizes.extraSmall : 0,
         right: right ? SpacingSizes.extraSmall : 0,
         top: top ? SpacingSizes.extraSmall : 0,
         bottom: bottom ? SpacingSizes.extraSmall : 0,
       );

  /// EdgeInsets with small padding only on specified sides. `16`
  ///
  /// [left], [right], [top], and [bottom] determine which sides have padding.
  const AppPadding.smallOnlyPadding({
    bool left = false,
    bool right = false,
    bool top = false,
    bool bottom = false,
  }) : super.only(
         left: left ? SpacingSizes.small : 0,
         right: right ? SpacingSizes.small : 0,
         top: top ? SpacingSizes.small : 0,
         bottom: bottom ? SpacingSizes.small : 0,
       );

  /// EdgeInsets with medium padding only on specified sides. `24`
  ///
  /// [left], [right], [top], and [bottom] determine which sides have padding.
  const AppPadding.mediumOnlyPadding({
    bool left = false,
    bool right = false,
    bool top = false,
    bool bottom = false,
  }) : super.only(
         left: left ? SpacingSizes.medium : 0,
         right: right ? SpacingSizes.medium : 0,
         top: top ? SpacingSizes.medium : 0,
         bottom: bottom ? SpacingSizes.medium : 0,
       );

  /// EdgeInsets with large padding only on specified sides. `32`
  ///
  /// [left], [right], [top], and [bottom] determine which sides have padding.
  const AppPadding.largeOnlyPadding({
    bool left = false,
    bool right = false,
    bool top = false,
    bool bottom = false,
  }) : super.only(
         left: left ? SpacingSizes.large : 0,
         right: right ? SpacingSizes.large : 0,
         top: top ? SpacingSizes.large : 0,
         bottom: bottom ? SpacingSizes.large : 0,
       );

  /// EdgeInsets with extra large padding only on specified sides. `64`
  ///
  /// [left], [right], [top], and [bottom] determine which sides have padding.
  const AppPadding.xLargeOnlyPadding({
    bool left = false,
    bool right = false,
    bool top = false,
    bool bottom = false,
  }) : super.only(
         left: left ? SpacingSizes.extraExtraLarge : 0,
         right: right ? SpacingSizes.extraExtraLarge : 0,
         top: top ? SpacingSizes.extraExtraLarge : 0,
         bottom: bottom ? SpacingSizes.extraExtraLarge : 0,
       );

  /// EdgeInsets with all sides small padding [16px].
  static const EdgeInsets smallPadding = EdgeInsets.all(SpacingSizes.small);

  /// EdgeInsets with all sides medium padding [24px].
  static const EdgeInsets mediumPadding = EdgeInsets.all(SpacingSizes.medium);

  /// EdgeInsets with all sides large padding [32px].
  static const EdgeInsets largePadding = EdgeInsets.all(SpacingSizes.large);

  /// EdgeInsets with all sides extra large padding [64px].
  static const EdgeInsets xLargePadding = EdgeInsets.all(
    SpacingSizes.extraExtraLarge,
  );
}
