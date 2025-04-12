// import 'package:easy_localization/easy_localization.dart';

// import '../../../config/localization/lang/locale_keys.g.dart';

// /// A class containing various validation methods for different types of input.
// class ValidatorMethods {
//   /// Creates a new instance of [ValidatorMethods] with an optional [text] parameter.
//   ///
//   /// [text] is the input string to be validated.
//   ValidatorMethods({this.text});
//   final String? text;

//   /// The required length for a valid phone number.
//   static const int phone_length = 10;

//   /// Validates the email address format.
//   ///
//   /// Returns `null` if the email address is valid, otherwise returns 'Invalid email address'.
//   String? get validateMail {
//     return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//             .hasMatch(text ?? '')
//         ? null
//         : tr(LocaleKeys.errors_invalid_email);
//   }

//   /// Validates the password length.
//   ///
//   /// Returns `null` if the password is at least 6 characters long, otherwise returns 'Password must be at least 6 characters'.
//   String? get validatePassword {
//     return RegExp(
//                 r"^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?':{}|<>])[A-Za-z\d!@#$%^&*(),.?':{}|<>]{6,}$")
//             .hasMatch(text ?? '')
//         ? null
//         : tr(LocaleKeys.errors_weak_password);
//   }

//   /// Validates the name length.
//   ///
//   /// Returns `null` if the name is at least 3 characters long, otherwise returns 'Name must be at least 3 characters'.
//   String? get validateName {
//     return (text?.length ?? 0) >= 3 ? null : tr(LocaleKeys.errors_invalid_name);
//   }

//   /// Validates the phone number length.
//   ///
//   /// Returns `null` if the phone number is at least 12 characters long, otherwise returns 'Phone number must be at least 12 characters'.
//   String? get validatePhone {
//     return ((text?.isNotEmpty ?? false) && text?[0] == "0")
//         ? LocaleKeys.errors_phoneNumberCantStartWithZero.tr()
//         : (text?.length ?? 0) == phone_length
//             ? null
//             : tr(LocaleKeys.errors_invalid_phone_number);
//   }

//   /// Validates the empty field.
//   /// Returns `null` if the field is not empty, otherwise returns 'This field is required'.
//   /// This method is used to validate the required fields.
//   String? get emptyField {
//     return text?.isEmpty ?? true
//         ? tr(LocaleKeys.common_validationError_required.tr())
//         : null;
//   }

//   /// Validates the length of the input.
//   /// Returns `null` if the input length is at least [length], otherwise
//   /// returns 'This field must be at least [length] characters'.
//   String? validateLength(int length) {
//     return (text?.length ?? 0) >= length
//         ? null
//         : LocaleKeys.common_validationError_length
//             .tr(args: [length.toString()]);
//   }
// }
