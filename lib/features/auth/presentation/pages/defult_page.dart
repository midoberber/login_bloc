import 'package:flutter/material.dart';

class DefultPage extends StatelessWidget {
  const DefultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Defult Page"),
      ),
      body: const Text("Defult Page"),
    );
  }
}
