import 'package:flutter/material.dart';

/// A utility class that defines commonly used border radius values for the application.
class AppBorderRadius extends BorderRadius {
  /// Constructor for small border radius [8px].
  const AppBorderRadius.small()
      : super.all(const Radius.circular(smallRadiusValue));

  /// Constructor for medium border radius [16px].
  const AppBorderRadius.medium()
      : super.all(const Radius.circular(mediumRadiusValue));

  /// Constructor for large border radius [32px].
  const AppBorderRadius.large()
      : super.all(const Radius.circular(largeRadiusValue));

  /// Constructor for custom border radius.
  AppBorderRadius.customAll(double radius) : super.all(Radius.circular(radius));

  /// Constructor for custom symmetric border radius.
  AppBorderRadius.customSymmetric({
    double horizontal = 0.0,
    double vertical = 0.0,
  }) : super.only(
          topLeft: Radius.circular(horizontal),
          topRight: Radius.circular(horizontal),
          bottomLeft: Radius.circular(vertical),
          bottomRight: Radius.circular(vertical),
        );

  /// Constructor for border radius only on specified sides.
  AppBorderRadius.customOnly({
    double topLeft = 0.0,
    double topRight = 0.0,
    double bottomLeft = 0.0,
    double bottomRight = 0.0,
  }) : super.only(
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
        );

  /// Constructor for small border radius only [8px].
  const AppBorderRadius.smallOnly({
    bool topLeft = false,
    bool topRight = false,
    bool bottomLeft = false,
    bool bottomRight = false,
  }) : super.only(
          topLeft:
              topLeft ? const Radius.circular(smallRadiusValue) : Radius.zero,
          topRight:
              topRight ? const Radius.circular(smallRadiusValue) : Radius.zero,
          bottomLeft: bottomLeft
              ? const Radius.circular(smallRadiusValue)
              : Radius.zero,
          bottomRight: bottomRight
              ? const Radius.circular(smallRadiusValue)
              : Radius.zero,
        );

  /// Constructor for medium border radius only [16px].
  const AppBorderRadius.mediumOnly({
    bool topLeft = false,
    bool topRight = false,
    bool bottomLeft = false,
    bool bottomRight = false,
  }) : super.only(
          topLeft:
              topLeft ? const Radius.circular(mediumRadiusValue) : Radius.zero,
          topRight:
              topRight ? const Radius.circular(mediumRadiusValue) : Radius.zero,
          bottomLeft: bottomLeft
              ? const Radius.circular(mediumRadiusValue)
              : Radius.zero,
          bottomRight: bottomRight
              ? const Radius.circular(mediumRadiusValue)
              : Radius.zero,
        );

  /// Constructor for large border radius only [32px].
  const AppBorderRadius.largeOnly({
    bool topLeft = false,
    bool topRight = false,
    bool bottomLeft = false,
    bool bottomRight = false,
  }) : super.only(
          topLeft:
              topLeft ? const Radius.circular(largeRadiusValue) : Radius.zero,
          topRight:
              topRight ? const Radius.circular(largeRadiusValue) : Radius.zero,
          bottomLeft: bottomLeft
              ? const Radius.circular(largeRadiusValue)
              : Radius.zero,
          bottomRight: bottomRight
              ? const Radius.circular(largeRadiusValue)
              : Radius.zero,
        );

  /// Constructor for small symmetric border radius [8px].
  const AppBorderRadius.smallSymmetric({
    bool horizontal = false,
    bool vertical = false,
  }) : super.only(
          topLeft: horizontal
              ? const Radius.circular(smallRadiusValue)
              : Radius.zero,
          topRight: horizontal
              ? const Radius.circular(smallRadiusValue)
              : Radius.zero,
          bottomLeft:
              vertical ? const Radius.circular(smallRadiusValue) : Radius.zero,
          bottomRight:
              vertical ? const Radius.circular(smallRadiusValue) : Radius.zero,
        );

  /// Constructor for medium symmetric border radius [16px].
  const AppBorderRadius.mediumSymmetric({
    bool horizontal = false,
    bool vertical = false,
  }) : super.only(
          topLeft: horizontal
              ? const Radius.circular(mediumRadiusValue)
              : Radius.zero,
          topRight: horizontal
              ? const Radius.circular(mediumRadiusValue)
              : Radius.zero,
          bottomLeft:
              vertical ? const Radius.circular(mediumRadiusValue) : Radius.zero,
          bottomRight:
              vertical ? const Radius.circular(mediumRadiusValue) : Radius.zero,
        );

  /// Constructor for large symmetric border radius [32px].
  const AppBorderRadius.largeSymmetric({
    bool horizontal = false,
    bool vertical = false,
  }) : super.only(
          topLeft: horizontal
              ? const Radius.circular(largeRadiusValue)
              : Radius.zero,
          topRight: horizontal
              ? const Radius.circular(largeRadiusValue)
              : Radius.zero,
          bottomLeft:
              vertical ? const Radius.circular(largeRadiusValue) : Radius.zero,
          bottomRight:
              vertical ? const Radius.circular(largeRadiusValue) : Radius.zero,
        );

  /// The value for a small border radius, which is 8 pixels.
  static const double smallRadiusValue = 8;

  /// The value for a medium border radius, which is 16 pixels.
  static const double mediumRadiusValue = 16;

  /// The value for a large border radius, which is 32 pixels.
  static const double largeRadiusValue = 32;
}
