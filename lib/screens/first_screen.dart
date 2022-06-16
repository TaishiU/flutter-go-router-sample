import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

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
                  onPressed: () => context.go('/Second'),
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
                  onPressed: () => context.push('/Second'),
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
                  onPressed: () => context.go('/Third'),
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
