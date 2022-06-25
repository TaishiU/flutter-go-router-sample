import 'package:go_router/go_router.dart';

import 'screens/first_screen.dart';
import 'screens/second_screen.dart';
import 'screens/third_screen.dart';

final router = GoRouter(
  initialLocation: FirstScreen.path,
  routes: [
    GoRoute(
      path: FirstScreen.path,
      name: FirstScreen.name,
      builder: (context, state) => const FirstScreen(),
      routes: [
        GoRoute(
          path: SecondScreen.path,
          name: SecondScreen.name,
          builder: (context, state) => const SecondScreen(),
        ),
        GoRoute(
          path: ThirdScreen.path,
          name: ThirdScreen.name,
          builder: (context, state) => const ThirdScreen(),
        )
      ],
    ),
  ],
);
