import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';
import '../route.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const path = '/login_screen';
  static const name = '/login_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      authStatusController,
      (_, __) {
        print('ref.listenが呼ばれました');
        ref.refresh(routerProvider);
      },
    );

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          final currentScope = FocusScope.of(context);
          if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  SizedBox(height: 100),
                  Text(
                    'Welcome👋',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 100),
                  _Email(),
                  SizedBox(height: 10),
                  _Password(),
                  SizedBox(height: 100),
                  _LoginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Email extends HookConsumerWidget {
  const _Email({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextFormField(
          controller: ref.read(authController.notifier).emailController,
          style: const TextStyle(fontSize: 20),
          keyboardType: TextInputType.emailAddress,
          onChanged: (String? email) =>
              ref.read(authController.notifier).onChangedEmail(email!),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            hintText: 'Email',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class _Password extends HookConsumerWidget {
  const _Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscure =
        ref.watch(authController.select((value) => value.isObscure));
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextFormField(
          controller: ref.read(authController.notifier).passwordController,
          obscureText: isObscure,
          style: const TextStyle(fontSize: 20),
          keyboardType: TextInputType.visiblePassword,
          onChanged: (String? password) =>
              ref.read(authController.notifier).onChangedPassword(password!),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            hintText: 'Password',
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
            suffixIcon: GestureDetector(
              onTap: () => ref.read(authController.notifier).switchObscure(),
              child: Icon(
                isObscure ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends HookConsumerWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(authController.select((value) => value.email));
    final password =
        ref.watch(authController.select((value) => value.password));
    final emailOrPasswordIsEmpty = email == '' || password == '';

    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: emailOrPasswordIsEmpty ? Colors.grey.shade300 : Colors.blue,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: emailOrPasswordIsEmpty
            ? null
            : () {
                FocusScope.of(context).unfocus();
                ref.read(authController.notifier).login();
              },
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
