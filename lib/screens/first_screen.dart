import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/screens/second_screen.dart';
import 'package:go_router_sample/screens/third_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  static const path = '/first_screen';
  static const name = '/first_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('First Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              _Button(
                title: 'go /Second',
                onPressed: () => context.goNamed(
                  SecondScreen.name,
                  params: {
                    'paramTitle': '①引数を渡すことに成功🎉',
                  },
                ),
              ),
              const SizedBox(height: 30),
              _Button(
                title: 'push /Second',
                onPressed: () => context.goNamed(
                  SecondScreen.name,
                  params: {
                    'paramTitle': '②引数を渡すことに成功🎉',
                  },
                ),
              ),
              const SizedBox(height: 30),
              _Button(
                title: 'go /Third',
                onPressed: () => context.goNamed(
                  ThirdScreen.name,
                  params: {
                    'number': '3',
                  },
                ),
              ),
              const SizedBox(height: 100),
              const _LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 30);
    return SizedBox(
      height: 100,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}

class _LogoutButton extends HookConsumerWidget {
  const _LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(authController.notifier).logout(),
      child: Container(
        height: 100,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Center(
          child: Text(
            'Logout',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
