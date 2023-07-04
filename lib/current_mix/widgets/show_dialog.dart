import 'package:flutter/material.dart';

class ShowDialog extends StatefulWidget {
  const ShowDialog({super.key});

  @override
  State<ShowDialog> createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show Dialog"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: (() {}),
          child: const Text("Open"),
        ),
      ),
    );
  }
}
