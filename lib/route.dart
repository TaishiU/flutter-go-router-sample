import 'package:go_router/go_router.dart';
import 'package:go_router_sample/screens/login_screen.dart';

import 'screens/first_screen.dart';
import 'screens/second_screen.dart';
import 'screens/third_screen.dart';

final router = GoRouter(
  initialLocation: LoginScreen.path,
  routes: [
    GoRoute(
      path: LoginScreen.path,
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
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
);
