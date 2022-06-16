import 'package:go_router/go_router.dart';

import 'screens/first_screen.dart';
import 'screens/second_screen.dart';
import 'screens/third_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const FirstScreen(),
      routes: [
        GoRoute(
          path: 'second',
          builder: (context, state) => const SecondScreen(),
        ),
        GoRoute(
          path: 'third',
          builder: (context, state) => const ThirdScreen(),
        )
      ],
    ),
  ],
);
