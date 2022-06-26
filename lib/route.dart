import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/auth_widget.dart';
import 'package:go_router_sample/screens/login_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'screens/first_screen.dart';
import 'screens/second_screen.dart';
import 'screens/third_screen.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    // initialLocation: LoginScreen.path,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const AuthWidget(),
        ),
      ),
      GoRoute(
        path: LoginScreen.path,
        name: LoginScreen.name,
        builder: (context, state) => const LoginScreen(),
        // routes: [
        //   GoRoute(
        //     path: FirstScreen.path,
        //     name: FirstScreen.name,
        //     builder: (context, state) => const FirstScreen(),
        //   ),
        // ],
      ),
      GoRoute(
        path: FirstScreen.path,
        name: FirstScreen.name,
        builder: (context, state) => const FirstScreen(),
        routes: [
          GoRoute(
            path: '${SecondScreen.path}/:paramTitle',
            name: SecondScreen.name,
            builder: (context, state) {
              final paramTitle = state.params['paramTitle']!;
              return SecondScreen(paramTitle: paramTitle);
            },
          ),
          GoRoute(
            path: '${ThirdScreen.path}/:number',
            name: ThirdScreen.name,
            builder: (context, state) {
              final number = int.parse(state.params['number']!);
              return ThirdScreen(number: number);
            },
          )
        ],
      ),
    ],
    // redirect: (state) {},
  ),
);

// final router = GoRouter(
//   // initialLocation: LoginScreen.path,
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//       path: '/',
//       pageBuilder: (context, state) => MaterialPage(
//         key: state.pageKey,
//         child: const AuthWidget(),
//       ),
//     ),
//     GoRoute(
//       path: LoginScreen.path,
//       name: LoginScreen.name,
//       builder: (context, state) => const LoginScreen(),
//       // routes: [
//       //   GoRoute(
//       //     path: FirstScreen.path,
//       //     name: FirstScreen.name,
//       //     builder: (context, state) => const FirstScreen(),
//       //   ),
//       // ],
//     ),
//     GoRoute(
//       path: FirstScreen.path,
//       name: FirstScreen.name,
//       builder: (context, state) => const FirstScreen(),
//       routes: [
//         GoRoute(
//           path: '${SecondScreen.path}/:paramTitle',
//           name: SecondScreen.name,
//           builder: (context, state) {
//             final paramTitle = state.params['paramTitle']!;
//             return SecondScreen(paramTitle: paramTitle);
//           },
//         ),
//         GoRoute(
//           path: '${ThirdScreen.path}/:number',
//           name: ThirdScreen.name,
//           builder: (context, state) {
//             final number = int.parse(state.params['number']!);
//             return ThirdScreen(number: number);
//           },
//         )
//       ],
//     ),
//   ],
//   redirect: (state) {},
// );
