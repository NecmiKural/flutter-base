// import 'package:flutter/material.dart';

// import '../../../../core/utils/constants/app_paddings.dart';
// import '../../../../core/utils/constants/gen/assets.gen.dart';
// import '../widgets/sign_in_form.dart';

// ///
// /// SignIn page
// class SignIn extends StatefulWidget {
//   /// SignIn page
//   const SignIn({super.key});

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         width: double.infinity,
//         child: Padding(
//           padding: const AppPadding.verticalLSymmetric() +
//               const AppPadding.horizontalLSymmetric(),
//           child: Container(
//             // background image
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                   Assets.icons.roofLogo.path,
//                 ),
//                 fit: BoxFit.contain,
//               ),
//             ),
//             child: const Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 SignInForm(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
