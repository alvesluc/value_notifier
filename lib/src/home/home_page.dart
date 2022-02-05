import 'package:flutter/material.dart';

import 'counter_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _counter = Counter();

  @override
  void initState() {
    super.initState();
    _counter.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ValueListenableBuilder<int>(
          valueListenable: _counter,
          builder: (context, value, _) {
            return Text('$value');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counter.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
