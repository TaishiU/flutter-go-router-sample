import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

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
              const SizedBox(height: 32),
              SizedBox(
                height: 100,
                child: ElevatedButton(
                  onPressed: () => context.push('/Third'),
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
