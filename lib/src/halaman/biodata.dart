import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class Biodata extends StatelessWidget {
  const Biodata({super.key});

  static const routeName = '/biodata';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biodata Mahasiswa'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
