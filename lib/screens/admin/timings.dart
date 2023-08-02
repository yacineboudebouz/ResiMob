import 'package:flutter/material.dart';

class Timings extends StatelessWidget {
  const Timings({super.key});
  static const timingsNamed = '/timings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timings'),
      ),
    );
  }
}
