// import 'package:flutter/material.dart';
// import 'package:go_router_sample/providers.dart';
// import 'package:go_router_sample/screens/first_screen.dart';
// import 'package:go_router_sample/screens/login_screen.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// import 'controllers/auth_controller.dart';
//
// class AuthWidget extends HookConsumerWidget {
//   const AuthWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final status = ref.watch(authController.select((state) => state.status));
//     switch (status) {
//       case AuthStatus.notSignedIn:
//         return const LoginScreen();
//       case AuthStatus.signedIn:
//         return const FirstScreen();
//       case AuthStatus.none:
//         return const CenterCircularProgressIndicator();
//       default:
//         return const CenterCircularProgressIndicator();
//     }
//   }
// }
//
// class CenterCircularProgressIndicator extends StatelessWidget {
//   const CenterCircularProgressIndicator({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
