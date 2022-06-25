import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/screens/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    Key? key,
    required this.paramTitle,
  }) : super(key: key);

  static const path = 'second_screen';
  static const name = 'second_screen';

  final String paramTitle;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 30);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Second Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(paramTitle),
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
              const SizedBox(height: 32),
              SizedBox(
                height: 100,
                child: ElevatedButton(
                  onPressed: () => context.pushNamed(
                    ThirdScreen.name,
                    params: {
                      'number': '3',
                    },
                  ),
                  child: const Text(
                    'push /Third',
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
