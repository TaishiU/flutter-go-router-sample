import 'package:go_router/go_router.dart';
import 'package:go_router_sample/controllers/auth_controller.dart';
import 'package:go_router_sample/providers.dart';
import 'package:go_router_sample/screens/login_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'screens/first_screen.dart';
import 'screens/second_screen.dart';
import 'screens/third_screen.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: LoginScreen.path,
        name: LoginScreen.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/',
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
    redirect: (state) {
      final status = ref.watch(authController.select((state) => state.status));
      print('redirect) status: $status');
      if (status == AuthStatus.notSignedIn) {
        //ログインしていなければLoginScreenへ遷移
        //元々LoginScreenに向かっている(state.subloc == LoginScreen.path)場合はnullを返す
        //そうではなく別のルートに向かっていればLoginScreen.pathを返す
        print('ログインしていなければredirect');
        return state.subloc == LoginScreen.path ? null : LoginScreen.path;
      }
      //ログインしていればFirstScreenへ遷移
      if (status == AuthStatus.signedIn) {
        print('FirstScreenへ遷移');
        //「return FirstScreen.path;」とすると「redirect loop detected」とエラーが出る
        //（例） / => /first_screen => /first_screen
        //理由は、nullを返さない限り無限リダイレクトが起きるため
        //解決策としては以下の3つ
        //①nullを返して無限リダイレクトを止める
        //②「initialLocation: '/'」とする ← 宣言しなくてもOK
        //③ログイン後に遷移させたい画面のpathを「path:'/'」とする ← これは必要
        return null;
        // return FirstScreen.path;
      }

      //一切リダイレクトが不要な場合はnullを返す
      print('一切リダイレクトが不要な場合');
      return null;
    },
  ),
);
