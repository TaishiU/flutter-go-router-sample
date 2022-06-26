import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/screens/second_screen.dart';
import 'package:go_router_sample/screens/third_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  static const path = '/first_screen';
  static const name = '/first_screen';
  // static const path = 'first_screen';
  // static const name = 'first_screen';

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 30);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('First Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 100,
                child: ElevatedButton(
                  onPressed: () => context.goNamed(
                    SecondScreen.name,
                    params: {
                      'paramTitle': '①引数を渡すことに成功🎉',
                    },
                  ),
                  child: const Text(
                    'go /Second',
                    style: textStyle,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 100,
                child: ElevatedButton(
                  onPressed: () => context.pushNamed(
                    SecondScreen.name,
                    params: {
                      'paramTitle': '②引数を渡すことに成功🎉',
                    },
                  ),
                  child: const Text(
                    'push /Second',
                    style: textStyle,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 100,
                child: ElevatedButton(
                  onPressed: () => context.goNamed(
                    ThirdScreen.name,
                    params: {
                      'number': '3',
                    },
                  ),
                  child: const Text(
                    'go /Third',
                    style: textStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
